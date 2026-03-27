@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires Administrator privileges.
    echo Right-click and select "Run as administrator".
    pause
    exit /b 1
)

echo Adding Erlang and Elixir to system PATH...

for /f "tokens=2*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path') do set "CURRENT_PATH=%%B"

echo Current PATH: %CURRENT_PATH%

setx /M Path "%CURRENT_PATH%;C:\Program Files\Erlang OTP\bin;C:\Program Files\Elixir\bin"

echo.
echo Done! Close and reopen your terminal, then run:
echo   cd c:\Desenvolvimento\micro-rpg
echo   mix play
echo.
pause
