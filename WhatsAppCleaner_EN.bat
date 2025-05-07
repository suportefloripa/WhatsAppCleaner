@echo off
chcp 65001 >nul
cls

setlocal enabledelayedexpansion
set "base_path=%USERPROFILE%\AppData\Local\Packages\5319275A.WhatsAppDesktop_cv1g1gvanyjgm\LocalState\shared\transfers"

if not exist "%base_path%" (
    echo Directory "%base_path%" not found.
    pause
    exit /b
)

:: Check if WhatsApp is running
set "whatsapp_running=false"
tasklist /fi "imagename eq WhatsApp.exe" | find /i "WhatsApp.exe" >nul 2>&1
if %errorlevel% equ 0 set "whatsapp_running=true"

:: Calculate total size using PowerShell
for /f %%a in ('
    powershell -Command "(Get-ChildItem -Path '%base_path%' -Recurse -File | Measure-Object -Property Length -Sum).Sum"
') do set "total_size=%%a"

if "%total_size%"=="" set "total_size=0"

:: Convert to MB and GB
for /f %%b in ('
    powershell -Command "[math]::Round(%total_size% / 1MB, 2)"
') do set "total_mb=%%b"

for /f %%c in ('
    powershell -Command "[math]::Round(%total_size% / 1GB, 2)"
') do set "total_gb=%%c"

echo Total space occupied by files: %total_mb% MB (%total_gb% GB)

set /p confirm=Are you sure you want to delete all files? (y/n): 
if /i "!confirm!" neq "y" (
    echo Operation canceled by user.
    pause
    exit /b
)

if "%whatsapp_running%"=="true" (
    echo Closing WhatsApp...
    taskkill /im WhatsApp.exe /f >nul 2>&1
    echo WhatsApp closed successfully.
)

del /s /q "%base_path%\*.*" 2>nul
for /d %%i in ("%base_path%\*") do rd /s /q "%%i" 2>nul

echo All files deleted successfully.
echo Space freed: %total_mb% MB (%total_gb% GB)

if "%whatsapp_running%"=="true" (
    echo Reopening WhatsApp...
    ping 127.0.0.1 -n 3 >nul
    start "" "whatsapp://"
    ping 127.0.0.1 -n 6 >nul
    tasklist /fi "imagename eq WhatsApp.exe" | find /i "WhatsApp.exe" >nul 2>&1
    if %errorlevel% equ 0 (
        echo WhatsApp reopened successfully.
    ) else (
        echo Failed to reopen WhatsApp. Please open it manually.
    )
)

pause