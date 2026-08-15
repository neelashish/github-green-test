#!/bin/bash
# check_email.sh - Verifies git email configuration
#
# Compares the locally configured git email against the emails
# used in the commit history and warns about mismatches.

set -euo pipefail

echo "=== Email Configuration Check ==="
echo ""

LOCAL_EMAIL=$(git config user.email 2>/dev/null || echo "(not set)")
GLOBAL_EMAIL=$(git config --global user.email 2>/dev/null || echo "(not set)")

echo "Local repo email:  $LOCAL_EMAIL"
echo "Global git email:  $GLOBAL_EMAIL"
echo ""

echo "Emails found in commit history:"
git log --all --pretty=format:"%ae" | sort -u | while read email; do
    count=$(git log --all --author="$email" --oneline | wc -l)
    marker=""
    if [ "$email" = "$LOCAL_EMAIL" ]; then
        marker=" <-- matches local config"
    fi
    echo "  $email ($count commits)$marker"
done

echo ""
echo "Tip: Make sure your commit email matches one of the emails"
echo "     listed at https://github.com/settings/emails"
