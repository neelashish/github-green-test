#!/bin/bash
# test_export.sh - Tests the CSV export script

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

echo "=== Export Script Tests ==="
echo ""

# Test: export script exists
assert_true "export_history.sh exists" \
    "$([ -f scripts/export_history.sh ] && echo true || echo false)"

# Test: export produces CSV output
OUTPUT=$(bash scripts/export_history.sh 2>&1)
assert_true "export produces output" \
    "$([ -n "$OUTPUT" ] && echo true || echo false)"

# Test: first line is CSV header
HEADER=$(echo "$OUTPUT" | head -1)
assert_true "first line is CSV header" \
    "$([ "$HEADER" = "date,author_email,message" ] && echo true || echo false)"

# Test: output has multiple lines
LINE_COUNT=$(echo "$OUTPUT" | wc -l)
assert_true "output has multiple lines" \
    "$([ $LINE_COUNT -gt 10 ] && echo true || echo false)"

echo ""
echo "Results: $PASS passed, $FAIL failed"
exit $FAIL
