#!/usr/bin/env python3
"""Failure-injection tests for flightdeck-dev-swap-helper.sh's rollback
state machine. See scripts/test-flightdeck-dev-swap-helper.sh (the runner
that should be used instead of invoking this file directly).

Extracts the `log()` function and the `APP_BACKED_UP=false ... trap cleanup
EXIT` state-machine block verbatim from the real script (not a hand-copied
duplicate) and drives it against mock directories standing in for the real
`~/Applications` and staged app.
"""
import subprocess
import sys
import tempfile
import os
import shutil


def extract_state_code(helper_path):
    with open(helper_path) as f:
        content = f.read()
    log_start = content.index("log() {")
    log_end = content.index("}", log_start) + 1
    log_fn = content[log_start:log_end]
    start = content.index("APP_BACKED_UP=false")
    end = content.index("trap cleanup EXIT") + len("trap cleanup EXIT")
    return log_fn + "\n" + content[start:end]


def run(sh):
    return subprocess.run(["bash", "-c", sh], capture_output=True, text=True)


def scenario(state_code, name, existing_target, restore_should_fail=False, commit=False):
    tmp = tempfile.mkdtemp(prefix=f"swaptest_{name}_")
    try:
        dest = os.path.join(tmp, "Applications")
        os.makedirs(dest)
        target = os.path.join(dest, "FlightDeck.app")
        if existing_target:
            os.makedirs(target)
            with open(os.path.join(target, "marker"), "w") as f:
                f.write("OLD-GOOD-APP")
        staged = os.path.join(tmp, "staged.app")
        os.makedirs(staged)
        with open(os.path.join(staged, "marker"), "w") as f:
            f.write("new-build")

        fail_line = f'chmod 500 "{dest}"' if restore_should_fail else ""
        commit_lines = 'COMMITTED=true\nrm -rf "$ROLLBACK_APP"' if commit else "exit 1"

        sh = f"""
        set -euo pipefail
        TARGET_APP="{target}"; ROLLBACK_APP="{dest}/.rollback.$$"
        {state_code}
        if [ -d "$TARGET_APP" ]; then rm -rf "$ROLLBACK_APP"; mv "$TARGET_APP" "$ROLLBACK_APP"; APP_BACKED_UP=true; fi
        TARGET_SWAPPED=true
        mv "{staged}" "$TARGET_APP"
        {fail_line}
        {commit_lines}
        """
        res = run(sh)
        os.chmod(dest, 0o700)
        entries = sorted(os.listdir(dest))
        marker_content = None
        marker_path = os.path.join(target, "marker")
        if os.path.exists(marker_path):
            with open(marker_path) as f:
                marker_content = f.read()
        return res, entries, marker_content
    finally:
        os.chmod(dest, 0o700)
        shutil.rmtree(tmp)


def main():
    if len(sys.argv) != 2:
        print("usage: test-flightdeck-dev-swap-helper.py <path-to-helper.sh>", file=sys.stderr)
        return 2
    state_code = extract_state_code(sys.argv[1])
    failures = []

    print("=== T1: first install, readiness fails (no prior app) ===")
    res, entries, marker = scenario(state_code, "t1", existing_target=False)
    if entries != []:
        failures.append(f"T1: expected target cleanly removed, got {entries}")
    else:
        print("PASS")

    print("=== T2: existing app, readiness fails -> restore ===")
    res, entries, marker = scenario(state_code, "t2", existing_target=True)
    if entries != ["FlightDeck.app"] or marker != "OLD-GOOD-APP":
        failures.append(f"T2: expected old app restored, got entries={entries} marker={marker!r}")
    else:
        print("PASS")

    print("=== T3: restore itself fails -> rollback preserved ===")
    res, entries, marker = scenario(state_code, "t3", existing_target=True, restore_should_fail=True)
    rollback_present = any(e.startswith(".rollback.") for e in entries)
    if not rollback_present or "PRESERVED" not in res.stdout:
        failures.append(
            f"T3: expected rollback preserved + 'PRESERVED' logged, got entries={entries} stdout={res.stdout!r}"
        )
    else:
        print("PASS")

    print("=== T4: success path -> rollback deleted, new content live ===")
    res, entries, marker = scenario(state_code, "t4", existing_target=True, commit=True)
    if entries != ["FlightDeck.app"] or marker != "new-build":
        failures.append(f"T4: expected committed new content, got entries={entries} marker={marker!r}")
    else:
        print("PASS")

    if failures:
        print("\nFAILURES:", file=sys.stderr)
        for f in failures:
            print(f" - {f}", file=sys.stderr)
        return 1

    print("\nALL 4 SCENARIOS PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())
