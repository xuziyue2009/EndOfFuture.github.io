@echo off
title DNA Translation Tool - Local Server

echo.
echo   DNA Translation Tool
echo   ====================
echo.

:: Try Python first
where python >nul 2>nul
if %errorlevel% equ 0 (
    echo   [OK] Python HTTP server
    echo   URL: http://localhost:8080
    echo   Close this window to stop the server
    echo.
    start "" "http://localhost:8080"
    python -m http.server 8080
    goto :end
)

:: Try Node.js / npx
where npx >nul 2>nul
if %errorlevel% equ 0 (
    echo   [OK] Node.js serve
    echo   URL: http://localhost:8080
    echo   Close this window to stop the server
    echo.
    start "" "http://localhost:8080"
    npx serve . -p 8080 --no-clipboard
    goto :end
)

:: Neither found
echo   [ERROR] Python or Node.js not found
echo.
echo   Please install one of the following:
echo     - Python 3:  https://www.python.org/downloads/
echo     - Node.js:   https://nodejs.org/
echo.
echo   Then double-click this script again.
echo.
pause
:end
