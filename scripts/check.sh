#!/usr/bin/env bash

set -o pipefail

echo
echo "========================================"
echo "  Medialog Admin - Full Check"
echo "========================================"
echo

echo "[1/3] Checking format..."
./scripts/format.sh || exit $?

echo
echo "[2/3] Running analyzer..."
./scripts/analyze.sh || exit $?

echo
echo "[3/3] Running tests..."
./scripts/test.sh || exit $?

echo
echo "========================================"
echo "  ALL CHECKS PASSED"
echo "========================================"
echo

exit 0