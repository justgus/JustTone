#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/_ac_common.sh"

if [[ $# -ne 1 ]]; then
  echo "Usage: $(basename "$0") <T-XXXX>" >&2
  exit 1
fi

ac_run task packet "$1" --backend canonical --output json
