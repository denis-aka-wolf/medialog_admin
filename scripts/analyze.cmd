@echo off
setlocal

echo.
echo ========================================
echo   Medialog Admin - Analyze
echo ========================================
echo.

call flutter analyze

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ANALYZE PASSED
    echo ========================================
    echo.
    exit /b 0
)

echo.
echo ========================================
echo   ANALYZE FAILED
echo ========================================
echo.

exit /b %ERRORLEVEL%