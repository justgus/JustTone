#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/_ac_common.sh"

ac_run task next --backend canonical --output json
