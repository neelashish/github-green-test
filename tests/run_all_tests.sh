#!/bin/bash
# run_all_tests.sh - Runs all test scripts and reports results
#
# Usage: bash tests/run_all_tests.sh

set -euo pipefail

TOTAL_PASS=0
TOTAL_FAIL=0
TESTS_RUN=0

echo "========================================="
echo "  Running All Tests"
echo "========================================="
echo ""

for test_file in tests/test_*.sh; do
    TESTS_RUN=$((TESTS_RUN + 1))
    echo "--- $test_file ---"
    if bash "$test_file"; then
        echo "  >> Suite PASSED"
    else
        echo "  >> Suite FAILED"
        TOTAL_FAIL=$((TOTAL_FAIL + 1))
    fi
    echo ""
done

TOTAL_PASS=$((TESTS_RUN - TOTAL_FAIL))

echo "========================================="
echo "  Test Summary"
echo "========================================="
echo "  Suites run:    $TESTS_RUN"
echo "  Suites passed: $TOTAL_PASS"
echo "  Suites failed: $TOTAL_FAIL"
echo "========================================="

exit $TOTAL_FAIL
