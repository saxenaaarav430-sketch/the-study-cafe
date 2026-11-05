@echo off
cd /d "%~dp0"
node server.mjs
if errorlevel 1 (
  echo Node.js 20 or later is needed. Install it from nodejs.org.
  pause
)
