#!/bin/bash

START="2026-09-20"
END="2026-09-24"

current="$START"

while [[ "$current" < "$END" || "$current" == "$END" ]]; do
    echo "Test contribution for $current" >> activity.txt

    git add activity.txt

    GIT_AUTHOR_DATE="$current 12:00:00" \
    GIT_COMMITTER_DATE="$current 12:00:00" \
    git commit -m "Test contribution $current"

    current=$(date -d "$current + 1 day" +%Y-%m-%d)
done

git push
