@echo off
setlocal

echo.
echo ========================================
echo   Medialog Admin - Tests
echo ========================================
echo.

call flutter test

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ALL TESTS PASSED
    echo ========================================
    echo.
    exit /b 0
)

echo.
echo ========================================
echo   TESTS FAILED
echo ========================================
echo.

exit /b %ERRORLEVEL%