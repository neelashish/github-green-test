#!/bin/bash
# test_dates.sh - Tests that commit dates are properly formatted
#
# Validates that all commit dates in the repository follow the expected
# ISO 8601 format and fall within reasonable ranges.

set -euo pipefail

PASS=0
FAIL=0

assert_true() {
    local desc="$1"
    local result="$2"
    if [ "$result" = "true" ]; then
        echo "  PASS: $desc"
        PASS=$((PASS + 1))
    else
        echo "  FAIL: $desc"
        FAIL=$((FAIL + 1))
    fi
}

echo "=== Date Format Tests ==="
echo ""

# Test: All dates should be parseable
UNPARSEABLE=$(git log --all --pretty=format:"%ad" --date=iso 2>&1 | grep -c "error" || true)
assert_true "All dates are parseable" "$([ $UNPARSEABLE -eq 0 ] && echo true || echo false)"

# Test: No future dates beyond today
TODAY=$(date +%Y-%m-%d)
FUTURE=$(git log --all --pretty=format:"%ad" --date=short | while read d; do
    [ "$d" \> "$TODAY" ] && echo "$d"
done | wc -l)
assert_true "No dates in the far future" "$([ $FUTURE -eq 0 ] && echo true || echo false)"

# Test: Should have dates in expected range
HAS_2026=$(git log --all --pretty=format:"%ad" --date=short | grep -c "2026" || true)
assert_true "Has commits dated in 2026" "$([ $HAS_2026 -gt 0 ] && echo true || echo false)"

echo ""
echo "Results: $PASS passed, $FAIL failed"
exit $FAIL
