#!/usr/bin/env bash

set -o pipefail

echo
echo "========================================"
echo "  Medialog Admin - Tests"
echo "========================================"
echo

flutter test
RESULT=$?

echo

if [ $RESULT -eq 0 ]; then
    echo "========================================"
    echo "  ALL TESTS PASSED"
    echo "========================================"
else
    echo "========================================"
    echo "  TESTS FAILED"
    echo "========================================"
fi

echo

exit $RESULT