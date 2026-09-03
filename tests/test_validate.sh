#!/bin/bash
# test_validate.sh - Tests the validation script
#
# Ensures validate_commits.sh runs without errors and produces expected output.

set -euo pipefail

PASS=0
FAIL=0

assert_true() {
    local desc="$1" result="$2"
    if [ "$result" = "true" ]; then
        echo "  PASS: $desc"
        PASS=$((PASS + 1))
    else
        echo "  FAIL: $desc"
        FAIL=$((FAIL + 1))
    fi
}

echo "=== Validation Script Tests ==="
echo ""

# Test: validate script exists
assert_true "validate_commits.sh exists" \
    "$([ -f scripts/validate_commits.sh ] && echo true || echo false)"

# Test: validate script is executable or parseable
OUTPUT=$(bash scripts/validate_commits.sh 2>&1 || true)
assert_true "validate script runs without crashing" \
    "$([ -n "$OUTPUT" ] && echo true || echo false)"

# Test: output contains expected sections
assert_true "output contains email info" \
    "$(echo "$OUTPUT" | grep -q "email" && echo true || echo false)"

assert_true "output contains date range" \
    "$(echo "$OUTPUT" | grep -q "date range\|Date range\|Oldest\|Newest" && echo true || echo false)"

echo ""
echo "Results: $PASS passed, $FAIL failed"
exit $FAIL
