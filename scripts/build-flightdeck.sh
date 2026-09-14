#!/usr/bin/env bash
set -euo pipefail

# Build and package FlightDeck desktop app and the `flightdeck` / `deck` internal CLI.
#
# Usage:
#   scripts/build-flightdeck.sh [--install] [--dest <path>]
#
# Options:
#   --install       Installs FlightDeck.app to ~/Applications/FlightDeck.app (or --dest)
#   --dest <dir>    Custom destination directory for the installed FlightDeck.app
#   --help, -h      Show this help

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
FLIGHTDECK_DIR="$REPO_ROOT/flightdeck"
CLI_DIR="$FLIGHTDECK_DIR/cli"

DO_INSTALL=false
DEST_DIR="$HOME/Applications"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --install)
      DO_INSTALL=true
      shift
      ;;
    --dest)
      if [[ $# -lt 2 || "$2" == --* ]]; then
        echo "Error: --dest requires a directory argument" >&2
        exit 1
      fi
      DEST_DIR="$2"
      DO_INSTALL=true
      shift 2
      ;;
    -h|--help)
      echo "Usage: scripts/build-flightdeck.sh [--install] [--dest <path>]"
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

echo "==> Checking prerequisites..."
command -v cargo >/dev/null 2>&1 || { echo "Error: 'cargo' not found in PATH" >&2; exit 1; }
command -v flutter >/dev/null 2>&1 || { echo "Error: 'flutter' not found in PATH" >&2; exit 1; }
command -v zig >/dev/null 2>&1 || { echo "Error: 'zig' not found in PATH" >&2; exit 1; }
command -v codesign >/dev/null 2>&1 || { echo "Error: 'codesign' not found in PATH" >&2; exit 1; }
command -v plutil >/dev/null 2>&1 || { echo "Error: 'plutil' not found in PATH" >&2; exit 1; }

if [ "$DO_INSTALL" = true ]; then
  command -v ditto >/dev/null 2>&1 || { echo "Error: 'ditto' not found in PATH" >&2; exit 1; }
fi

# Kernel-held mutual exclusion via BSD lockf(1) FILE-DESCRIPTOR mode (the
# pattern `man lockf` itself documents): open the lock file on a dedicated
# fd in THIS shell, then have `lockf` lock that fd directly — `lockf` runs
# only briefly to make that one lock(2) call on our already-open fd and
# exits immediately; there's no self-reexec and no persistent lock-holder
# child to babysit or race signals with. The lock is tied to the shell's own
# open file
# description, so it is held for the rest of this script's lifetime —
# through the first mutation (`cargo clean`, right below) through build,
# validation, and (if requested) install/cleanup — and released
# automatically by the kernel once every descriptor referencing it is
# closed, on every exit path including SIGKILL. Fd 9 is not close-on-exec,
# so `cargo`/`flutter` children inherit it; on a killed parent this means
# the kernel conservatively keeps holding the lock until any such
# surviving child also exits and closes its inherited copy — not
# necessarily the instant the parent dies. That's the safer direction to
# be wrong in: it prevents a second build from starting while a build
# child of the first one might still be running. Acquired here (after
# --help/argument-parsing and the read-only prerequisite checks above, but
# before any mutation) so `--help` and invalid-argument diagnostics stay
# available even while another build holds the lock.
#
# `-s` silences lockf's own messages (contention is reported by us, below,
# based on its exit status). `-t 0` fails immediately instead of blocking
# if another instance already holds it. `-k`/`-w` are implied/ignored in
# this fd mode per the man page, since the file is already open via the
# shell redirection itself — but the lock FILE must never be deleted:
# removing it would let a future run open/lock a DIFFERENT inode at the
# same path while an existing holder's lock (tied to the OLD inode) is
# still live, silently defeating exclusion.
#
# The lock file lives in the OS-provided private per-user temp directory
# (`getconf DARWIN_USER_TEMP_DIR`, mode 0700, owned by this user) rather
# than a fixed `/tmp/...` path: world-writable `/tmp` lets any other local
# user pre-create a symlink at a guessable path, and `exec 9>"$LOCK_FILE"`
# (like any `>` redirection) follows an existing symlink and truncates
# whatever it points to — a classic symlink-attack primitive. The Darwin
# per-user temp dir is not writable by other users, so nothing can be
# pre-planted there.
if [ ! -x /usr/bin/lockf ]; then
  echo "Error: '/usr/bin/lockf' not found (required for build/install mutual exclusion)" >&2
  exit 1
fi
DARWIN_TEMP_DIR="$(/usr/bin/getconf DARWIN_USER_TEMP_DIR 2>/dev/null || true)"
if [ -z "$DARWIN_TEMP_DIR" ] || [ ! -d "$DARWIN_TEMP_DIR" ]; then
  echo "Error: could not resolve a private per-user temp directory (getconf DARWIN_USER_TEMP_DIR)" >&2
  exit 1
fi
LOCK_FILE="${DARWIN_TEMP_DIR%/}/flightdeck-build.lock"
exec 9>"$LOCK_FILE"
if ! /usr/bin/lockf -s -t 0 9; then
  echo "Error: Another FlightDeck build/install process is currently running (lock: $LOCK_FILE)" >&2
  exit 1
fi

# Refuses to touch a path that is expected to be a regular file or symlink
# (CLI binary, `deck` alias, `ck` removal target, Pi hook script) but is
# instead a REAL directory. That's a foreign/unexpected filesystem state —
# no run of this installer would ever create a directory there — so backing
# it up and swapping over it would silently destroy something unrelated.
# Symlinks (even ones pointing at a directory) are fine to back up/replace.
reject_unexpected_dir() {
  local path="$1"
  if [ -e "$path" ] && [ ! -L "$path" ] && [ -d "$path" ]; then
    echo "Error: $path is an unexpected directory (expected a file or symlink); refusing to touch it" >&2
    exit 1
  fi
}

# Refuses to touch the FlightDeck.app target path if it exists as anything
# OTHER than a directory (the bundle) or a symlink. A plain file sitting at
# that path is a foreign/unexpected state.
reject_unexpected_nondir() {
  local path="$1"
  if [ -e "$path" ] && [ ! -L "$path" ] && [ ! -d "$path" ]; then
    echo "Error: $path exists but is not a directory (expected the FlightDeck.app bundle); refusing to touch it" >&2
    exit 1
  fi
}

validate_app_bundle() {
  local app_path="$1"
  local plist="$app_path/Contents/Info.plist"

  if [ ! -f "$plist" ]; then
    echo "Error: Info.plist missing at $plist" >&2
    return 1
  fi

  local bundle_id
  local display_name
  local name
  local executable

  bundle_id=$(plutil -extract CFBundleIdentifier raw "$plist" 2>/dev/null || echo "")
  display_name=$(plutil -extract CFBundleDisplayName raw "$plist" 2>/dev/null || echo "")
  name=$(plutil -extract CFBundleName raw "$plist" 2>/dev/null || echo "")
  executable=$(plutil -extract CFBundleExecutable raw "$plist" 2>/dev/null || echo "")

  if [ "$bundle_id" != "dev.flightdeck.desktop" ]; then
    echo "Error: Invalid bundle identifier: '$bundle_id' (expected 'dev.flightdeck.desktop')" >&2
    return 1
  fi
  if [ "$display_name" != "FlightDeck" ]; then
    echo "Error: Invalid display name: '$display_name' (expected 'FlightDeck')" >&2
    return 1
  fi
  if [ "$name" != "FlightDeck" ]; then
    echo "Error: Invalid name: '$name' (expected 'FlightDeck')" >&2
    return 1
  fi
  if [ "$executable" != "FlightDeck" ]; then
    echo "Error: Invalid executable: '$executable' (expected 'FlightDeck')" >&2
    return 1
  fi

  if [ ! -x "$app_path/Contents/MacOS/FlightDeck" ]; then
    echo "Error: Main executable missing or not executable: $app_path/Contents/MacOS/FlightDeck" >&2
    return 1
  fi

  if [ ! -x "$app_path/Contents/Resources/flightdeck-cli" ]; then
    echo "Error: CLI resource missing or not executable: $app_path/Contents/Resources/flightdeck-cli" >&2
    return 1
  fi

  if [ ! -x "$app_path/Contents/Resources/flightdeck-server-bundle/bin/flightdeck-server" ]; then
    echo "Error: Server bundle binary missing or not executable: $app_path/Contents/Resources/flightdeck-server-bundle/bin/flightdeck-server" >&2
    return 1
  fi

  local hook_bundle_path="$app_path/Contents/Frameworks/App.framework/Resources/flutter_assets/assets/hooks/pi_flightdeck.ts"
  if [ ! -f "$hook_bundle_path" ]; then
    echo "Error: Bundled Pi hook asset missing at $hook_bundle_path" >&2
    return 1
  fi

  codesign --verify --deep --strict "$app_path"
}

echo "==> Cleaning Rust CLI build artifacts..."
cargo clean --manifest-path "$CLI_DIR/Cargo.toml"

echo "==> Building Rust CLI (flightdeck-cli)..."
cargo build --release --manifest-path "$CLI_DIR/Cargo.toml"
cargo test --manifest-path "$CLI_DIR/Cargo.toml" --quiet

echo "==> Cleaning local Flutter build intermediates..."
cd "$FLIGHTDECK_DIR"
flutter clean

# Isolated, repo-local, git-ignored pub cache — exported AFTER `flutter
# clean` (which deletes the whole `.dart_tool/` directory this lives under)
# so it's created fresh for this run instead of being wiped out from under
# itself. Applies to `pub get` AND `build macos` below (same shell, same
# exported env), and to every invocation of this script, not just --install:
# the default build must never touch the user's global pub-cache.
export PUB_CACHE="$FLIGHTDECK_DIR/.dart_tool/pub-cache"
mkdir -p "$PUB_CACHE"

echo "==> Preparing Flutter dependencies (PUB_CACHE=$PUB_CACHE)..."
flutter pub get

echo "==> Applying macOS patches (media_kit BSD cut)..."
# `create_framework_symlinks.sh` (from media_kit_libs_macos_video /
# media_kit_libs_macos_audio) uses `cut -d '-' -f 1 -f 3`. BSD `cut`
# (macOS's real /usr/bin/cut) accumulates repeated `-f` flags into a union
# field list, so that syntax happens to work there. GNU coreutils' `cut`
# (commonly ahead of /usr/bin on PATH via Homebrew) instead errors outright
# ("only one list may be specified"), and since the script has `set -e`, it
# aborts before creating the `Frameworks/.symlinks/mpv/...` symlinks Xcode's
# linker needs — producing a `framework 'Mpv' not found` link failure with
# no indication the real cause was this cut(1) divergence. `-f 1,3` is
# correct and unambiguous on both.
#
# Patch the LOCAL, isolated PUB_CACHE package source (not the ephemeral
# per-build copy under macos/Flutter/ephemeral/.symlinks/plugins/, and
# never the global pub-cache): `flutter build macos`'s own CocoaPods/plugin
# registration step COPIES this script fresh from the pub-cache package
# into the ephemeral location as part of every build, so patching the
# ephemeral copy ahead of time — as this used to do — gets silently
# clobbered by that copy, especially now that `flutter clean` above
# deletes the ephemeral tree every run and it doesn't exist yet at this
# point in the script. Patching the source it gets copied FROM survives
# that regeneration.
for _pkg in media_kit_libs_macos_video media_kit_libs_macos_audio; do
  for _script in "$PUB_CACHE"/hosted/pub.dev/"$_pkg"-*/macos/create_framework_symlinks.sh; do
    [ -f "$_script" ] || continue
    sed -i '' "s/cut -d '-' -f 1 -f 3/cut -d '-' -f 1,3/g" "$_script" 2>/dev/null || true
  done
done

echo "==> Building macOS release application..."
flutter build macos

BUILT_APP="$FLIGHTDECK_DIR/build/macos/Build/Products/Release/FlightDeck.app"
if [ ! -d "$BUILT_APP" ]; then
  echo "Error: Built app not found at $BUILT_APP" >&2
  exit 1
fi

echo "==> Validating built app identity, resources, and signature..."
validate_app_bundle "$BUILT_APP"

echo "==> Build successful: $BUILT_APP"

if [ "$DO_INSTALL" = true ]; then
  TARGET_APP="$DEST_DIR/FlightDeck.app"
  STAGE_APP="$DEST_DIR/.FlightDeck.app.staging.$$"
  ROLLBACK_APP="$DEST_DIR/.FlightDeck.app.rollback.$$"

  BIN_DIR="$HOME/.flightdeck/bin"
  TARGET_CLI="$BIN_DIR/flightdeck"
  STAGE_CLI="$BIN_DIR/.flightdeck.staging.$$"
  ROLLBACK_CLI="$BIN_DIR/.flightdeck.rollback.$$"

  TARGET_DECK="$BIN_DIR/deck"
  ROLLBACK_DECK="$BIN_DIR/.deck.rollback.$$"

  TARGET_CK="$BIN_DIR/ck"
  ROLLBACK_CK="$BIN_DIR/.ck.rollback.$$"

  HOOK_DIR="$HOME/.pi/agent/extensions"
  TARGET_HOOK="$HOOK_DIR/flightdeck.ts"
  STAGE_HOOK="$HOOK_DIR/.flightdeck.staging.$$"
  ROLLBACK_HOOK="$HOOK_DIR/.flightdeck.rollback.$$"

  APP_BACKED_UP=false
  TARGET_SWAPPING=false

  CLI_BACKED_UP=false
  CLI_SWAPPING=false

  DECK_BACKED_UP=false
  DECK_SWAPPING=false

  CK_BACKED_UP=false

  HOOK_BACKED_UP=false
  HOOK_SWAPPING=false

  COMMITTED=false

  # Removes a single path (file/dir/symlink) if present. Returns nonzero (and
  # logs) on failure instead of aborting — callers accumulate failures into
  # their own `cleanup_errors` flag so every artifact removal is
  # independently attempted regardless of earlier ones failing.
  _try_rm() {
    local path="$1"
    if [ -e "$path" ] || [ -L "$path" ]; then
      if ! rm -rf "$path"; then
        echo "ERROR: Failed to remove $path" >&2
        return 1
      fi
    fi
    return 0
  }

  cleanup() {
    local exit_code=$?
    # Disarm INT/TERM/HUP for the remainder of cleanup so a second signal
    # (e.g. impatient Ctrl-C mashing) cannot interrupt rollback mid-flight
    # and leave artifacts half-restored. No explicit restoration needed
    # afterward since this function always ends by exiting the process.
    # SIGKILL remains inherently uncatchable, by design.
    trap '' INT TERM HUP
    # Every removal/restore below is best-effort and must run regardless of
    # whether an earlier one in this same cleanup failed — under the
    # script-wide `set -e`, an unguarded failing command here would abort
    # cleanup partway through and skip restoring/removing the remaining
    # artifacts.
    set +e

    local cleanup_errors=false

    if [ "$COMMITTED" != true ]; then
      echo "==> Installation failed or interrupted before commit; rolling back all artifacts..." >&2

      _try_rm "$STAGE_APP" || cleanup_errors=true
      _try_rm "$STAGE_CLI" || cleanup_errors=true
      _try_rm "$STAGE_HOOK" || cleanup_errors=true

      # Hook rollback. The restore `mv` is gated on the swapped-in target
      # having actually been removed: `mv` onto an EXISTING directory nests
      # the source inside it instead of replacing it, so if removal fails
      # and we `mv`'d anyway, it could silently "succeed" while leaving the
      # broken new artifact in place with the rollback buried inside it.
      local hook_removed_ok=true
      if [ "$HOOK_SWAPPING" = true ]; then
        _try_rm "$TARGET_HOOK" || { cleanup_errors=true; hook_removed_ok=false; }
      fi
      if [ "$HOOK_BACKED_UP" = true ] && { [ -e "$ROLLBACK_HOOK" ] || [ -L "$ROLLBACK_HOOK" ]; }; then
        if [ "$hook_removed_ok" = true ]; then
          if ! mv "$ROLLBACK_HOOK" "$TARGET_HOOK"; then
            echo "ERROR: Failed to restore $ROLLBACK_HOOK to $TARGET_HOOK! Rollback preserved." >&2
            cleanup_errors=true
          fi
        else
          echo "ERROR: Skipping restore of $ROLLBACK_HOOK because removing $TARGET_HOOK failed; rollback artifact preserved." >&2
        fi
      fi

      # ck rollback
      if [ "$CK_BACKED_UP" = true ] && { [ -e "$ROLLBACK_CK" ] || [ -L "$ROLLBACK_CK" ]; }; then
        if ! mv "$ROLLBACK_CK" "$TARGET_CK"; then
          echo "ERROR: Failed to restore $ROLLBACK_CK to $TARGET_CK! Rollback preserved." >&2
          cleanup_errors=true
        fi
      fi

      # deck symlink rollback (same removal-before-restore gate as above).
      local deck_removed_ok=true
      if [ "$DECK_SWAPPING" = true ]; then
        _try_rm "$TARGET_DECK" || { cleanup_errors=true; deck_removed_ok=false; }
      fi
      if [ "$DECK_BACKED_UP" = true ] && { [ -e "$ROLLBACK_DECK" ] || [ -L "$ROLLBACK_DECK" ]; }; then
        if [ "$deck_removed_ok" = true ]; then
          if ! mv "$ROLLBACK_DECK" "$TARGET_DECK"; then
            echo "ERROR: Failed to restore $ROLLBACK_DECK to $TARGET_DECK! Rollback preserved." >&2
            cleanup_errors=true
          fi
        else
          echo "ERROR: Skipping restore of $ROLLBACK_DECK because removing $TARGET_DECK failed; rollback artifact preserved." >&2
        fi
      fi

      # CLI rollback (same removal-before-restore gate as above).
      local cli_removed_ok=true
      if [ "$CLI_SWAPPING" = true ]; then
        _try_rm "$TARGET_CLI" || { cleanup_errors=true; cli_removed_ok=false; }
      fi
      if [ "$CLI_BACKED_UP" = true ] && { [ -e "$ROLLBACK_CLI" ] || [ -L "$ROLLBACK_CLI" ]; }; then
        if [ "$cli_removed_ok" = true ]; then
          if ! mv "$ROLLBACK_CLI" "$TARGET_CLI"; then
            echo "ERROR: Failed to restore $ROLLBACK_CLI to $TARGET_CLI! Rollback preserved." >&2
            cleanup_errors=true
          fi
        else
          echo "ERROR: Skipping restore of $ROLLBACK_CLI because removing $TARGET_CLI failed; rollback artifact preserved." >&2
        fi
      fi

      # Target App rollback. Gating matters MOST here: TARGET_APP is a
      # directory, so a failed-to-remove app bundle left in place would make
      # `mv "$ROLLBACK_APP" "$TARGET_APP"` nest the entire rollback bundle
      # INSIDE the broken new one (mv-onto-existing-directory semantics)
      # instead of replacing it — an easy-to-miss "successful" mv that
      # actually leaves the wrong app live at the target path.
      local app_removed_ok=true
      if [ "$TARGET_SWAPPING" = true ]; then
        _try_rm "$TARGET_APP" || { cleanup_errors=true; app_removed_ok=false; }
      fi
      if [ "$APP_BACKED_UP" = true ] && { [ -e "$ROLLBACK_APP" ] || [ -L "$ROLLBACK_APP" ]; }; then
        if [ "$app_removed_ok" = true ]; then
          if ! mv "$ROLLBACK_APP" "$TARGET_APP"; then
            echo "ERROR: Failed to restore $ROLLBACK_APP to $TARGET_APP! Rollback preserved." >&2
            cleanup_errors=true
          fi
        else
          echo "ERROR: Skipping restore of $ROLLBACK_APP because removing $TARGET_APP failed; rollback artifact preserved." >&2
        fi
      fi

      if [ "$cleanup_errors" = true ]; then
        echo "ERROR: Rollback encountered errors; one or more rollback/staging artifacts were preserved." >&2
      else
        echo "==> Rollback complete." >&2
      fi
    else
      # Committed: clean up this run's own temp staging/rollback files, plus
      # any stale ones left behind by prior runs (installer-owned hidden
      # paths only — always safe to force-remove with -rf). Every removal is
      # individually tracked: a committed install must not report success
      # while leaving a rollback/staging artifact or the lock behind.
      for path in "$STAGE_APP" "$ROLLBACK_APP" \
                  "$STAGE_CLI" "$ROLLBACK_CLI" "$ROLLBACK_DECK" "$ROLLBACK_CK" \
                  "$STAGE_HOOK" "$ROLLBACK_HOOK"; do
        _try_rm "$path" || cleanup_errors=true
      done

      # Bash array + `nullglob` (saved/restored) instead of `for f in
      # $pattern`: the latter re-splits the already-expanded path on IFS,
      # corrupting any DEST_DIR/BIN_DIR/HOOK_DIR containing a space. An array
      # expansion (`"${stale_paths[@]}"`) never word-splits its elements,
      # and nullglob makes an unmatched pattern contribute zero elements
      # instead of a literal (harmless here, but avoids relying on that).
      local _nullglob_was_set=false
      shopt -q nullglob && _nullglob_was_set=true
      shopt -s nullglob
      local -a stale_paths=(
        "$DEST_DIR"/.FlightDeck.app.staging.*
        "$DEST_DIR"/.FlightDeck.app.rollback.*
        "$BIN_DIR"/.flightdeck.staging.*
        "$BIN_DIR"/.flightdeck.rollback.*
        "$BIN_DIR"/.deck.rollback.*
        "$BIN_DIR"/.ck.rollback.*
        "$HOOK_DIR"/.flightdeck.staging.*
        "$HOOK_DIR"/.flightdeck.rollback.*
      )
      if [ "$_nullglob_was_set" = false ]; then
        shopt -u nullglob
      fi

      for f in "${stale_paths[@]}"; do
        _try_rm "$f" || cleanup_errors=true
      done
    fi

    # No manual lock release needed: fd 9's lockf lock is held by the
    # kernel and dropped automatically when this process exits below,
    # whatever exit code that is.

    if [ "$cleanup_errors" = true ]; then
      # Surface failure to the caller even if the original trigger for this
      # cleanup carried a zero/benign status — exact cleanup must not report
      # success while an artifact or the lock was left behind.
      [ "$exit_code" -eq 0 ] && exit_code=1
    elif [ "$exit_code" -eq 0 ] && [ "$COMMITTED" = true ]; then
      # Only announce success once every cleanup step and the lock release
      # have been verified — never before, at the bottom of the main script
      # body, where EXIT-trap cleanup could still fail afterward.
      echo "==> Successfully installed to $TARGET_APP!"
    fi

    # Disarm the EXIT trap before the explicit exit below so this handler
    # cannot be re-entered.
    trap - EXIT
    exit "$exit_code"
  }

  trap 'exit 130' INT
  trap 'exit 143' TERM
  trap cleanup EXIT

  mkdir -p "$DEST_DIR"

  echo "==> Staging install on destination filesystem..."
  rm -rf "$STAGE_APP"
  ditto "$BUILT_APP" "$STAGE_APP"

  echo "==> Validating staged app identity, resources, and signature..."
  validate_app_bundle "$STAGE_APP"

  echo "==> Checking destination artifact types before any mutation..."
  reject_unexpected_nondir "$TARGET_APP"
  reject_unexpected_dir "$TARGET_CLI"
  reject_unexpected_dir "$TARGET_DECK"
  reject_unexpected_dir "$TARGET_CK"
  reject_unexpected_dir "$TARGET_HOOK"

  echo "==> Moving existing target to rollback..."
  rm -rf "$ROLLBACK_APP"
  if [ -e "$TARGET_APP" ] || [ -L "$TARGET_APP" ]; then
    APP_BACKED_UP=true
    mv "$TARGET_APP" "$ROLLBACK_APP"
  fi

  echo "==> Swapping staged app into place..."
  TARGET_SWAPPING=true
  if ! mv "$STAGE_APP" "$TARGET_APP"; then
    echo "Error: Failed to move staged app to $TARGET_APP" >&2
    exit 1
  fi

  echo "==> Re-validating target application after swap..."
  validate_app_bundle "$TARGET_APP"

  echo "==> Installing CLI from bundle resource to ~/.flightdeck/bin..."
  mkdir -p "$BIN_DIR"
  rm -rf "$STAGE_CLI" "$ROLLBACK_CLI" "$ROLLBACK_DECK" "$ROLLBACK_CK"

  cp "$TARGET_APP/Contents/Resources/flightdeck-cli" "$STAGE_CLI"
  chmod +x "$STAGE_CLI"

  if [ -e "$TARGET_CLI" ] || [ -L "$TARGET_CLI" ]; then
    CLI_BACKED_UP=true
    mv "$TARGET_CLI" "$ROLLBACK_CLI"
  fi
  CLI_SWAPPING=true
  mv "$STAGE_CLI" "$TARGET_CLI"

  if [ -e "$TARGET_DECK" ] || [ -L "$TARGET_DECK" ]; then
    DECK_BACKED_UP=true
    mv "$TARGET_DECK" "$ROLLBACK_DECK"
  fi
  DECK_SWAPPING=true
  ln -sf flightdeck "$TARGET_DECK"

  if [ -e "$TARGET_CK" ] || [ -L "$TARGET_CK" ]; then
    CK_BACKED_UP=true
    mv "$TARGET_CK" "$ROLLBACK_CK"
  fi

  if [ ! -x "$TARGET_CLI" ]; then
    echo "Error: Installed CLI at $TARGET_CLI is not executable" >&2
    exit 1
  fi
  "$TARGET_CLI" --version >/dev/null 2>&1 || {
    echo "Error: Installed CLI at $TARGET_CLI failed execution check" >&2
    exit 1
  }

  BUNDLED_HOOK="$TARGET_APP/Contents/Frameworks/App.framework/Resources/flutter_assets/assets/hooks/pi_flightdeck.ts"
  echo "==> Installing Pi extension from validated bundle..."
  mkdir -p "$HOOK_DIR"
  rm -rf "$STAGE_HOOK" "$ROLLBACK_HOOK"

  cp "$BUNDLED_HOOK" "$STAGE_HOOK"
  if [ -e "$TARGET_HOOK" ] || [ -L "$TARGET_HOOK" ]; then
    HOOK_BACKED_UP=true
    mv "$TARGET_HOOK" "$ROLLBACK_HOOK"
  fi
  HOOK_SWAPPING=true
  mv "$STAGE_HOOK" "$TARGET_HOOK"

  if ! cmp -s "$BUNDLED_HOOK" "$TARGET_HOOK"; then
    echo "Error: Installed hook $TARGET_HOOK does not match bundled asset" >&2
    exit 1
  fi

  echo "==> Removing stale backups and temporary build artifacts..."
  rm -rf "$DEST_DIR/FlightDeck.app.bak"
  rm -rf "$DEST_DIR/FlightDeck.app.tmp."* 2>/dev/null || true
  rm -rf "$BUILT_APP"

  # Marks the transaction committed; the EXIT trap's cleanup() prints the
  # final success message itself, only after every cleanup step and the
  # lock release have been verified to succeed.
  COMMITTED=true
fi
