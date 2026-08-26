#!/bin/bash
# test_setup.sh - Tests that the repository is correctly set up

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

echo "=== Setup Tests ==="
echo ""

# Test: git is available
assert_true "git is installed" "$(command -v git &>/dev/null && echo true || echo false)"

# Test: user.email is configured
EMAIL=$(git config user.email 2>/dev/null || echo "")
assert_true "user.email is configured" "$([ -n "$EMAIL" ] && echo true || echo false)"

# Test: user.name is configured
NAME=$(git config user.name 2>/dev/null || echo "")
assert_true "user.name is configured" "$([ -n "$NAME" ] && echo true || echo false)"

# Test: remote origin exists
REMOTE=$(git remote get-url origin 2>/dev/null || echo "")
assert_true "remote origin is configured" "$([ -n "$REMOTE" ] && echo true || echo false)"

# Test: on main branch
BRANCH=$(git branch --show-current)
assert_true "on main branch" "$([ "$BRANCH" = "main" ] && echo true || echo false)"

echo ""
echo "Results: $PASS passed, $FAIL failed"
exit $FAIL
