#!/bin/bash
# green-test.sh - Original contribution test script
#
# Creates daily activity commits within a specified date range.
# Each commit appends a line to activity.txt and uses the target
# date as both the author and committer date.
#
# Prerequisites:
#   - Git configured with correct user.name and user.email
#   - The email must match your GitHub account
#
# Usage: bash green-test.sh

set -euo pipefail

START="2026-09-20"
END="2026-09-24"

echo "Starting contribution test from $START to $END"
echo "Using git email: $(git config user.email)"
echo ""

current="$START"

while [[ "$current" < "$END" || "$current" == "$END" ]]; do
    echo "Test contribution for $current" >> activity.txt

    git add activity.txt

    GIT_AUTHOR_DATE="$current 12:00:00" \
    GIT_COMMITTER_DATE="$current 12:00:00" \
    git commit -m "Test contribution $current"

    echo "  Created commit for $current"
    current=$(date -d "$current + 1 day" +%Y-%m-%d)
done

echo ""
echo "Done. Push with: git push"
