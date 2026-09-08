#!/bin/bash
# validate_commits.sh - Validates commit authorship and dates
#
# Checks that all commits in the repository use the correct author email
# and that dates are within expected ranges.

set -euo pipefail

echo "=== Commit Validation Report ==="
echo ""

# Check configured email
CONFIGURED_EMAIL=$(git config user.email)
echo "Configured email: $CONFIGURED_EMAIL"
echo ""

# List all unique author emails
echo "Author emails found in history:"
git log --all --pretty=format:"%ae" | sort -u | while read email; do
    COUNT=$(git log --all --author="$email" --oneline | wc -l)
    if [ "$email" = "$CONFIGURED_EMAIL" ]; then
        echo "  $email ($COUNT commits) [MATCHES CONFIG]"
    else
        echo "  $email ($COUNT commits) [WARNING: does not match config]"
    fi
done
echo ""

# Date range summary
echo "Commit date range:"
OLDEST=$(git log --all --pretty=format:"%ad" --date=short | sort | head -1)
NEWEST=$(git log --all --pretty=format:"%ad" --date=short | sort | tail -1)
echo "  Oldest: $OLDEST"
echo "  Newest: $NEWEST"
echo ""

TOTAL=$(git log --all --oneline | wc -l)
echo "Total commits: $TOTAL"
echo ""
echo "=== Detailed Statistics ===

# Commits per month
echo "Commits by month:"
git log --all --pretty=format:"%ad" --date=format:"%Y-%m" | sort | uniq -c | sort -k2 | while read count month; do
    printf "  %s: %3d commits\n" "$month" "$count"
done

echo ""
echo "=== Validation Complete ==="

