#!/bin/bash
# date_range.sh - Creates commits across a range of dates
#
# Usage: ./date_range.sh <start-date> <end-date>
# Example: ./date_range.sh 2026-08-01 2026-08-15
#
# Creates one commit per day in the given range. Each commit appends
# an entry to activity.txt.

set -euo pipefail

START="${1:?Usage: $0 <start-date> <end-date>}"
END="${2:?Usage: $0 <start-date> <end-date>}"

echo "Creating commits from $START to $END"

current="$START"
count=0

while [[ "$current" < "$END" || "$current" == "$END" ]]; do
    echo "Activity: $current" >> activity.txt
    git add activity.txt

    GIT_AUTHOR_DATE="${current}T12:00:00 +0000" \
    GIT_COMMITTER_DATE="${current}T12:00:00 +0000" \
    git commit -m "Daily activity: $current"

    current=$(date -d "$current + 1 day" +%Y-%m-%d)
    count=$((count + 1))
done

echo ""
echo "Done. Created $count commits."
