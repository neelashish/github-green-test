#!/bin/bash
# daily_summary.sh - Generates a summary of today's git activity
#
# Shows commits made today, files changed, and current branch status.

set -euo pipefail

TODAY=$(date +%Y-%m-%d)

echo "=== Daily Summary for $TODAY ==="
echo ""

# Current branch
BRANCH=$(git branch --show-current)
echo "Branch: $BRANCH"
echo ""

# Today's commits
echo "Commits today:"
COMMITS=$(git log --after="${TODAY}T00:00:00" --before="${TODAY}T23:59:59" --oneline 2>/dev/null || true)
if [ -z "$COMMITS" ]; then
    echo "  (none)"
else
    echo "$COMMITS" | while read line; do
        echo "  $line"
    done
fi
echo ""

# Uncommitted changes
CHANGES=$(git status --short)
if [ -z "$CHANGES" ]; then
    echo "Working directory: clean"
else
    echo "Uncommitted changes:"
    echo "$CHANGES" | while read line; do
        echo "  $line"
    done
fi

echo ""
echo "=== End Summary ==="
