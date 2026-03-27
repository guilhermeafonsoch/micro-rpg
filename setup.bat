@echo off
setlocal enabledelayedexpansion

echo ============================================
echo   The Hollow Throne - Setup Script
echo   Installing Erlang, Elixir & Dependencies
echo ============================================
echo.

:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] This script requires Administrator privileges.
    echo Right-click the script and select "Run as administrator".
    pause
    exit /b 1
)

:: Check if Chocolatey is installed
where choco >nul 2>&1
if %errorlevel% neq 0 (
    echo [1/5] Installing Chocolatey package manager...
    echo.
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
        "Set-ExecutionPolicy Bypass -Scope Process -Force; ^
         [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; ^
         iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"

    if %errorlevel% neq 0 (
        echo [ERROR] Failed to install Chocolatey.
        pause
        exit /b 1
    )
    :: Refresh PATH
    call refreshenv >nul 2>&1
    set "PATH=%ALLUSERSPROFILE%\chocolatey\bin;%PATH%"
    echo [OK] Chocolatey installed.
) else (
    echo [1/5] Chocolatey already installed. Skipping.
)
echo.

:: Check if Erlang is installed
where erl >nul 2>&1
if %errorlevel% neq 0 (
    echo [2/5] Installing Erlang/OTP...
    echo This may take a few minutes...
    echo.
    choco install erlang -y
    if %errorlevel% neq 0 (
        echo [ERROR] Failed to install Erlang.
        pause
        exit /b 1
    )
    call refreshenv >nul 2>&1
    echo [OK] Erlang installed.
) else (
    echo [2/5] Erlang already installed. Skipping.
)
echo.

:: Check if Elixir is installed
where elixir >nul 2>&1
if %errorlevel% neq 0 (
    echo [3/5] Installing Elixir...
    echo This may take a few minutes...
    echo.
    choco install elixir -y
    if %errorlevel% neq 0 (
        echo [ERROR] Failed to install Elixir.
        pause
        exit /b 1
    )
    call refreshenv >nul 2>&1
    echo [OK] Elixir installed.
) else (
    echo [3/5] Elixir already installed. Skipping.
)
echo.

:: Refresh environment to pick up new PATH entries
call refreshenv >nul 2>&1

:: Verify installations
echo [4/5] Verifying installations...
echo.

where erl >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARNING] Erlang not found in PATH. You may need to restart your terminal.
) else (
    echo   Erlang ... OK
)

where elixir >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARNING] Elixir not found in PATH. You may need to restart your terminal.
) else (
    for /f "tokens=*" %%i in ('elixir --version 2^>^&1 ^| findstr /i "Elixir"') do echo   %%i ... OK
)

where mix >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARNING] Mix not found in PATH. You may need to restart your terminal.
) else (
    echo   Mix ...... OK
)
echo.

:: Install Hex and project dependencies
echo [5/5] Installing project dependencies...
echo.

where mix >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARNING] Mix not available yet. Please restart your terminal and run:
    echo.
    echo   cd %~dp0
    echo   mix local.hex --force
    echo   mix deps.get
    echo   mix compile
    echo   mix play
    echo.
) else (
    cd /d "%~dp0"
    call mix local.hex --force
    call mix deps.get
    call mix compile

    echo.
    echo ============================================
    echo   Setup complete!
    echo.
    echo   To play the game, run:
    echo     cd %~dp0
    echo     mix play
    echo ============================================
)

echo.
pause
