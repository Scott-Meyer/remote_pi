#!/usr/bin/env bash
set -euo pipefail

# Failure-injection tests for the swap-helper's rollback state machine
# (flightdeck/assets/dev-update/flightdeck-dev-swap-helper.sh). Does NOT
# run the real script end-to-end (that needs a real app bundle, a real
# running process to wait on, and a real CLI to poll) — instead extracts
# the state-machine/cleanup portion verbatim from the real file and drives
# it against mock directories, so a change to that logic is exercised by
# this file automatically without hand-duplicating it.
#
# Covers:
#   T1 first install, readiness fails -> target cleanly removed, no rollback existed
#   T2 existing app, readiness fails -> old app restored
#   T3 restore itself fails (dest made read-only) -> rollback PRESERVED, not deleted
#   T4 success path -> rollback deleted, new content live
#
# Usage: scripts/test-flightdeck-dev-swap-helper.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HELPER="$SCRIPT_DIR/../flightdeck/assets/dev-update/flightdeck-dev-swap-helper.sh"

bash -n "$HELPER"

python3 "$SCRIPT_DIR/test-flightdeck-dev-swap-helper.py" "$HELPER"
