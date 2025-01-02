@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Add your commands below
echo Running as administrator...
DISM /Online /Enable-Feature /FeatureName:NetFx3 /All
pause