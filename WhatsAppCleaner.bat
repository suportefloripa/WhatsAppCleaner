@echo off
chcp 65001 >nul
cls

setlocal enabledelayedexpansion
set "base_path=%USERPROFILE%\AppData\Local\Packages\5319275A.WhatsAppDesktop_cv1g1gvanyjgm\LocalState\shared\transfers"

if not exist "%base_path%" (
    echo O diretório "%base_path%" não foi encontrado.
    pause
    exit /b
)

:: Verifica se o WhatsApp está em execução
set "whatsapp_running=false"
tasklist /fi "imagename eq WhatsApp.exe" | find /i "WhatsApp.exe" >nul 2>&1
if %errorlevel% equ 0 set "whatsapp_running=true"

:: Calcula o tamanho total via PowerShell
for /f %%a in ('
    powershell -Command "(Get-ChildItem -Path '%base_path%' -Recurse -File | Measure-Object -Property Length -Sum).Sum"
') do set "total_size=%%a"

if "%total_size%"=="" set "total_size=0"

:: Converte para MB e GB
for /f %%b in ('
    powershell -Command "[math]::Round(%total_size% / 1MB, 2)"
') do set "total_mb=%%b"

for /f %%c in ('
    powershell -Command "[math]::Round(%total_size% / 1GB, 2)"
') do set "total_gb=%%c"

echo Total de espaço ocupado pelos arquivos: %total_mb% MB (%total_gb% GB)

set /p confirm=Tem certeza que deseja apagar todos os arquivos? (s/n): 
if /i "!confirm!" neq "s" (
    echo Operação cancelada pelo usuário.
    pause
    exit /b
)

if "%whatsapp_running%"=="true" (
    echo Fechando o WhatsApp...
    taskkill /im WhatsApp.exe /f >nul 2>&1
    echo WhatsApp foi fechado com sucesso.
)

del /s /q "%base_path%\*.*" 2>nul
for /d %%i in ("%base_path%\*") do rd /s /q "%%i" 2>nul

echo Todos os arquivos foram apagados com sucesso.
echo Espaço liberado: %total_mb% MB (%total_gb% GB)

if "%whatsapp_running%"=="true" (
    echo Reabrindo o WhatsApp...
    ping 127.0.0.1 -n 3 >nul
    start "" "whatsapp://"
    ping 127.0.0.1 -n 6 >nul
    tasklist /fi "imagename eq WhatsApp.exe" | find /i "WhatsApp.exe" >nul 2>&1
    if %errorlevel% equ 0 (
        echo WhatsApp foi reaberto com sucesso.
    ) else (
        echo Não foi possível reabrir o WhatsApp. Por favor, abra-o manualmente.
    )
)

pause