#!/usr/bin/env bash

set -o pipefail

echo
echo "========================================"
echo "  Medialog Admin - Format Check"
echo "========================================"
echo

dart format --output=none --set-exit-if-changed .
RESULT=$?

echo

if [ $RESULT -eq 0 ]; then
    echo "========================================"
    echo "  FORMAT PASSED"
    echo "========================================"
else
    echo "========================================"
    echo "  FORMAT FAILED"
    echo "========================================"
    echo
    echo "Run: dart format ."
fi

echo

exit $RESULT