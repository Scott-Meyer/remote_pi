#!/usr/bin/env bash
set -euo pipefail

# Thin convenience wrapper: publishes a local-update-channel build for the
# FlightDeck dev loop by calling the canonical scripts/build-flightdeck.sh
# with --publish-local-update. All staging/manifest/cleanup logic lives in
# THAT script, inside its own held build lock — see the comment there for
# why (a wrapper that copied/deleted the shared build/ output AFTER that
# script's lock was already released would race a second concurrent
# build). This file exists only so the everyday command is short.
#
# Usage: scripts/flightdeck-publish-local-update.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec "$SCRIPT_DIR/build-flightdeck.sh" --publish-local-update
