@echo off
REM 🏏 Thala for a Reason - Port 7777 Dashboard
REM Real-time Memory Bank Dashboard Server (Windows)

cd /d "%~dp0\.."

echo 🏏 Starting Real-time Dashboard on Port 7777 - Thala for a Reason!
echo ⚡ 500ms polling with smart change detection
echo 🔥 Instant JSON updates without reload
echo.
echo 📊 Dashboard URL: http://localhost:7777/visualize/dashboard.html
echo.
echo Press CTRL+C to stop the server
echo.

npx http-server -p 7777 -c-1 --cors
