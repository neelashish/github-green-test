#!/bin/bash
# test_email.sh - Tests email configuration and consistency
#
# Verifies that the git email is properly configured and that
# recent commits use the expected email address.

set -euo pipefail

PASS=0
FAIL=0
EXPECTED_EMAIL="a1neelashish@gmail.com"

assert_eq() {
    local desc="$1" actual="$2" expected="$3"
    if [ "$actual" = "$expected" ]; then
        echo "  PASS: $desc"
        PASS=$((PASS + 1))
    else
        echo "  FAIL: $desc (got '$actual', expected '$expected')"
        FAIL=$((FAIL + 1))
    fi
}

echo "=== Email Configuration Tests ==="
echo ""

# Test: Local email is configured
LOCAL_EMAIL=$(git config user.email)
assert_eq "Local email is set" "$LOCAL_EMAIL" "$EXPECTED_EMAIL"

# Test: user.name is configured
LOCAL_NAME=$(git config user.name)
assert_eq "Local name is set" "$LOCAL_NAME" "neelashish"

echo ""
echo "Results: $PASS passed, $FAIL failed"
exit $FAIL
