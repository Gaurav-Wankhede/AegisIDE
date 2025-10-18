# 🏏 Thala for a Reason - Port 7777 Dashboard
# Real-time Memory Bank Dashboard Server (PowerShell)

Set-Location -Path (Join-Path $PSScriptRoot "..")

Write-Host "🏏 Starting Real-time Dashboard on Port 7777 - Thala for a Reason!" -ForegroundColor Cyan
Write-Host "⚡ 500ms polling with smart change detection" -ForegroundColor Green
Write-Host "🔥 Instant JSON updates without reload" -ForegroundColor Yellow
Write-Host ""
Write-Host "📊 Dashboard URL: http://localhost:7777/visualize/dashboard.html" -ForegroundColor Magenta
Write-Host ""
Write-Host "Press CTRL+C to stop the server" -ForegroundColor Gray
Write-Host ""

npx http-server -p 7777 -c-1 --cors
