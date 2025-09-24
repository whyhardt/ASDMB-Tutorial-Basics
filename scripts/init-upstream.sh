#!/usr/bin/env bash

set -euo pipefail

UPSTREAM_URL="${1:-}"
[[ -z "$UPSTREAM_URL" ]] && { echo "Usage: scripts/init-upstream.sh <upstream-url>"; exit 1; }
git remote remove upstream 2>/dev/null || true
git remote add upstream "$UPSTREAM_URL"
git fetch upstream --tags --prune
echo "✅ Upstream set to $UPSTREAM_URL"
