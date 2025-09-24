#!/usr/bin/env bash

set -euo pipefail
STEP="${1:-}"; [[ -z "$STEP" ]] && { echo "Usage: scripts/goto-step.sh step-XX-name"; exit 1; }
git fetch upstream --tags --prune
if git show-ref --verify --quiet "refs/remotes/upstream/$STEP"; then
  git switch -C "$STEP" "upstream/$STEP"
elif git rev-parse -q --verify "refs/tags/$STEP" >/dev/null; then
  git switch -C "$STEP" "$STEP"
else
  echo "❌ Step '$STEP' not found in upstream branches or tags."; exit 1
fi
echo "✅ Now on local branch $STEP"
