#!/usr/bin/env bash

set -o pipefail

echo
echo "========================================"
echo "  Medialog Admin - Analyze"
echo "========================================"
echo

flutter analyze
RESULT=$?

echo

if [ $RESULT -eq 0 ]; then
    echo "========================================"
    echo "  ANALYZE PASSED"
    echo "========================================"
else
    echo "========================================"
    echo "  ANALYZE FAILED"
    echo "========================================"
fi

echo

exit $RESULT