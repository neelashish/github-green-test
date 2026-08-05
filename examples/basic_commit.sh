#!/bin/bash
# basic_commit.sh - Demonstrates creating a commit with a specific date
#
# Usage: ./basic_commit.sh "2026-08-01" "Your commit message"
#
# The date format should be YYYY-MM-DD. A default time of 12:00:00 UTC is used.

set -euo pipefail

DATE="${1:?Usage: $0 <YYYY-MM-DD> <message>}"
MESSAGE="${2:?Usage: $0 <YYYY-MM-DD> <message>}"
TIMESTAMP="${DATE}T12:00:00 +0000"

echo "Creating commit for date: $DATE"
echo "Message: $MESSAGE"

# Make a small change to track the commit
echo "Activity: $DATE" >> activity.txt

git add activity.txt

GIT_AUTHOR_DATE="$TIMESTAMP" \
GIT_COMMITTER_DATE="$TIMESTAMP" \
git commit -m "$MESSAGE"

echo "Done. Commit created with date $DATE"
