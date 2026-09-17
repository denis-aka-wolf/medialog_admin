@echo off
setlocal

echo.
echo ========================================
echo   Medialog Admin - Full Check
echo ========================================
echo.

echo [1/3] Checking format...
call scripts\format.cmd
if %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

echo.
echo [2/3] Running analyzer...
call scripts\analyze.cmd
if %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

echo.
echo [3/3] Running tests...
call scripts\test.cmd
if %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

echo.
echo ========================================
echo   ALL CHECKS PASSED
echo ========================================
echo.

exit /b 0