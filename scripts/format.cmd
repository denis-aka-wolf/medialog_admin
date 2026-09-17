@echo off
setlocal

echo.
echo ========================================
echo   Medialog Admin - Format Check
echo ========================================
echo.

call dart format --output=none --set-exit-if-changed .

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   FORMAT PASSED
    echo ========================================
    echo.
    exit /b 0
)

echo.
echo ========================================
echo   FORMAT FAILED
echo ========================================
echo.
echo Run: dart format .
echo.

exit /b %ERRORLEVEL%