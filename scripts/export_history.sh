#!/bin/bash
# export_history.sh - Exports commit history to a CSV file
#
# Useful for analysis in spreadsheets or data tools.
#
# Usage: bash scripts/export_history.sh > commits.csv

set -euo pipefail

echo "date,author_email,message"

git log --all --pretty=format:"%ad,%ae,%s" --date=short | while IFS= read -r line; do
    # Escape any commas in the message
    date_part=$(echo "$line" | cut -d',' -f1)
    email_part=$(echo "$line" | cut -d',' -f2)
    msg_part=$(echo "$line" | cut -d',' -f3-)
    # Wrap message in quotes if it contains commas
    if echo "$msg_part" | grep -q ','; then
        msg_part="\"$msg_part\""
    fi
    echo "$date_part,$email_part,$msg_part"
done
