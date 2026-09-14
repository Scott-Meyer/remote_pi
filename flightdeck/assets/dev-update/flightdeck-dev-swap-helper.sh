#!/usr/bin/env bash
set -euo pipefail

# FlightDeck local-update swap helper. Bundled as a signed asset of the
# app that spawns it (Contents/Frameworks/App.framework/Resources/
# flutter_assets/assets/dev-update/) — the OLD, already-running, already-
# trusted app decides a swap is safe and does it with its OWN copy of this
# script, not one sitting next to the untrusted candidate.
#
# Usage: flightdeck-dev-swap-helper.sh <old_pid> <expected_build_id> <expected_app_framework_sha256>
#
# v1: single fixed staging slot, atomic same-device renames for the swap,
# rollback preserved on any failure. Not defending against adversarial
# input (this is one developer's own machine); DOES guard against the
# failure modes that would actually happen here: a build that never
# finishes copying, a relaunch that never comes up, this script's own
# restore step failing partway through.

OLD_PID="${1:?missing old_pid}"
EXPECTED_BUILD_ID="${2:?missing expected_build_id}"
EXPECTED_APP_FRAMEWORK_SHA256="${3:-}"

UPDATES_ROOT="$HOME/.flightdeck/updates"
STAGED_APP="$UPDATES_ROOT/staged/FlightDeck.app"
MANIFEST="$UPDATES_ROOT/latest.json"
DEST_DIR="$HOME/Applications"
TARGET_APP="$DEST_DIR/FlightDeck.app"
ROLLBACK_APP="$DEST_DIR/.FlightDeck.app.dev-update-rollback.$$"

LOG_DIR="$HOME/.flightdeck/logs"
mkdir -p "$LOG_DIR"
exec >>"$LOG_DIR/dev-update-swap.log" 2>&1
log() { echo "[$(date -u +%Y-%m-%dT%H:%M:%SZ)] $*"; }

APP_BACKED_UP=false
TARGET_SWAPPED=false
NEW_GUI_LAUNCHED=false
COMMITTED=false

# Gracefully stops whatever is currently running at $TARGET_APP (idempotent;
# no-op if nothing's running there). Used before rollback removes the
# bundle: a stuck/hung newly-relaunched process still holding the socket
# file (or PTYs, tunnels, etc.) must actually be gone first, or overwriting
# its bundle out from under it just recreates the exact stale-process/
# socket problem this app has hit before — rm -rf on a running app's
# bundle doesn't stop the process, it just orphans it.
quit_target_if_running() {
  if ! pgrep -f "$TARGET_APP/Contents/MacOS/FlightDeck" >/dev/null 2>&1; then
    return 0
  fi
  /usr/bin/osascript -e 'tell application id "dev.flightdeck.desktop" to quit' >/dev/null 2>&1 || true
  local _i
  for _i in $(seq 1 20); do
    pgrep -f "$TARGET_APP/Contents/MacOS/FlightDeck" >/dev/null 2>&1 || return 0
    sleep 1
  done
  local pids
  pids="$(pgrep -f "$TARGET_APP/Contents/MacOS/FlightDeck" 2>/dev/null || true)"
  if [ -n "$pids" ]; then
    kill -TERM $pids 2>/dev/null || true
    for _i in $(seq 1 10); do
      pgrep -f "$TARGET_APP/Contents/MacOS/FlightDeck" >/dev/null 2>&1 || return 0
      sleep 1
    done
  fi
  pgrep -f "$TARGET_APP/Contents/MacOS/FlightDeck" >/dev/null 2>&1 && return 1
  return 0
}

cleanup() {
  local exit_code=$?
  set +e
  if [ "$COMMITTED" = true ]; then
    exit "$exit_code"
  fi

  log "Rolling back (exit_code=$exit_code)"
  if [ "$NEW_GUI_LAUNCHED" = true ]; then
    if ! quit_target_if_running; then
      # Do NOT fall through to touching the filesystem: a still-running
      # process (even after TERM) means rm -rf on its live bundle would
      # just orphan it while it keeps holding the socket/PTYs/tunnels —
      # exactly the stale-process problem this whole check exists to
      # prevent. Leave BOTH the (stuck) target and the rollback bundle on
      # disk untouched and bail loudly; this needs a human, not a script
      # guessing at a filesystem swap underneath a process it can't stop.
      log "ERROR: new GUI still running after graceful quit + SIGTERM; aborting rollback WITHOUT touching the filesystem. Target left as-is at $TARGET_APP (likely still running the failed build); previous good app PRESERVED at $ROLLBACK_APP for manual recovery."
      exit "$exit_code"
    fi
  fi
  if [ "$TARGET_SWAPPED" = true ]; then
    rm -rf "$TARGET_APP"
  fi
  if [ "$APP_BACKED_UP" = true ] && [ -d "$ROLLBACK_APP" ]; then
    if mv "$ROLLBACK_APP" "$TARGET_APP"; then
      log "Restored previous app; relaunching it."
      /usr/bin/open "$TARGET_APP" 2>/dev/null || true
    else
      log "ERROR: failed to restore rollback to $TARGET_APP — rollback PRESERVED at $ROLLBACK_APP, not deleted."
    fi
  fi
  exit "$exit_code"
}
trap cleanup EXIT

log "Waiting for old PID $OLD_PID to exit..."
for _i in $(seq 1 60); do
  kill -0 "$OLD_PID" 2>/dev/null || break
  sleep 1
done
if kill -0 "$OLD_PID" 2>/dev/null; then
  log "ERROR: old PID $OLD_PID still alive after 60s; aborting (nothing touched)."
  exit 1
fi

[ -d "$STAGED_APP" ] || { log "ERROR: no staged app at $STAGED_APP"; exit 1; }
[ -f "$MANIFEST" ] || { log "ERROR: no manifest at $MANIFEST"; exit 1; }

manifest_build_id=$(python3 -c "import json; print(json.load(open('$MANIFEST')).get('buildId',''))" 2>/dev/null || echo "")
if [ "$manifest_build_id" != "$EXPECTED_BUILD_ID" ]; then
  log "ERROR: manifest buildId '$manifest_build_id' != expected '$EXPECTED_BUILD_ID'"
  exit 1
fi
if [ -n "$EXPECTED_APP_FRAMEWORK_SHA256" ]; then
  staged_hash=$(/usr/bin/shasum -a 256 "$STAGED_APP/Contents/Frameworks/App.framework/App" 2>/dev/null | awk '{print $1}')
  if [ "$staged_hash" != "$EXPECTED_APP_FRAMEWORK_SHA256" ]; then
    log "ERROR: staged App.framework hash mismatch"
    exit 1
  fi
fi

# Same-device swap: both renames below are atomic (single syscall on the
# whole bundle), never a partial-copy window.
if [ "$(/usr/bin/stat -f %d "$STAGED_APP")" != "$(/usr/bin/stat -f %d "$DEST_DIR")" ]; then
  log "ERROR: staged app and $DEST_DIR are on different filesystems; cannot swap atomically."
  exit 1
fi

if [ -d "$TARGET_APP" ]; then
  rm -rf "$ROLLBACK_APP"
  mv "$TARGET_APP" "$ROLLBACK_APP"
  APP_BACKED_UP=true
fi

TARGET_SWAPPED=true
mv "$STAGED_APP" "$TARGET_APP"

log "Swap done. Relaunching..."
/usr/bin/open "$TARGET_APP"
NEW_GUI_LAUNCHED=true

# Give it a moment to come up, then confirm via the CLI it's actually the
# build we just swapped in (not just that a socket file exists).
CLI="$HOME/.flightdeck/bin/flightdeck"
READY=false
for _i in $(seq 1 30); do
  if [ -x "$CLI" ]; then
    got=$("$CLI" build-info --json 2>/dev/null | python3 -c "import json,sys; print(json.load(sys.stdin).get('buildId',''))" 2>/dev/null || echo "")
    if [ "$got" = "$EXPECTED_BUILD_ID" ]; then
      READY=true
      break
    fi
  fi
  sleep 1
done

if [ "$READY" != true ]; then
  log "ERROR: relaunched app never confirmed buildId $EXPECTED_BUILD_ID within 30s; rolling back."
  exit 1
fi

log "Confirmed running buildId $EXPECTED_BUILD_ID. Done."
rm -rf "$ROLLBACK_APP"
COMMITTED=true
