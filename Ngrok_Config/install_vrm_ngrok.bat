@echo off
title Install VRM Ngrok and open ngrok.yml
setlocal EnableDelayedExpansion
echo.

:: Step 1: Check if VRM Ngrok is installed globally
echo Checking for VRM Ngrok...

npm list -g vrm-ngrok >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo [INFO] VRM Ngrok not found. Installing...
    npm install -g vrm-ngrok
) ELSE (
    echo [INFO] VRM Ngrok is already installed.
)

:: Step 2: Set path to ngrok.yml
set "NGROK_YML=%USERPROFILE%\.ngrok2\ngrok.yml"

:: Create folder if it doesn't exist
IF NOT EXIST "%USERPROFILE%\.ngrok2" (
    mkdir "%USERPROFILE%\.ngrok2"
)

:: Create ngrok.yml if it doesn't exist
IF NOT EXIST "!NGROK_YML!" (
    echo [INFO] Creating empty ngrok.yml file...
    echo # VRM Ngrok configuration > "!NGROK_YML!"
)

:: Open ngrok.yml
echo [INFO] Opening ngrok.yml...
start "" "!NGROK_YML!"

echo.
echo [DONE] Script completed. You can close this window or type exit.
cmd /k
