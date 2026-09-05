#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
AICOCKPIT="$REPO_ROOT/../Airframe/demos/LiveDemo/bin/aicockpit"
AC_CONFIG="$REPO_ROOT/.airframe/airframe-workspace.json"

if [[ ! -x "$AICOCKPIT" ]]; then
  echo "error: aicockpit binary not found at $AICOCKPIT" >&2
  exit 1
fi

ac_run() {
  "$AICOCKPIT" "$@" --config "$AC_CONFIG"
}
