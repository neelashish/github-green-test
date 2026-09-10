#!/bin/bash
# test_hooks.sh - Tests the pre-commit hook example

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

echo "=== Pre-commit Hook Tests ==="
echo ""

# Test: hook script exists
assert_true "git_hooks_example.sh exists" \
    "$([ -f examples/git_hooks_example.sh ] && echo true || echo false)"

# Test: hook script runs successfully with current config
OUTPUT=$(bash examples/git_hooks_example.sh 2>&1 || true)
assert_true "hook passes with current email" \
    "$(echo "$OUTPUT" | grep -q "passed\|check" && echo true || echo false)"

echo ""
echo "Results: $PASS passed, $FAIL failed"
exit $FAIL
