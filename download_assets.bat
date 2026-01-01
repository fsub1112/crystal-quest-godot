@echo off
REM Crystal Quest - Asset Downloader (Windows Batch)
REM For Windows users

setlocal enabledelayedexpansion

echo ==========================================================
echo 🎮 CRYSTAL QUEST - Automated Asset Downloader
echo ==========================================================
echo.

REM Check if we're in the project directory
if not exist "project.godot" (
    echo ❌ Error: project.godot not found!
    echo 📁 Please run this script from the project root directory.
    pause
    exit /b 1
)

REM Check for Python
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Error: Python not found!
    echo 📥 Please install Python from: https://www.python.org/downloads/
    echo.
    echo After installing Python, run this script again.
    pause
    exit /b 1
)

echo ✅ Python found! Running Python downloader...
echo.

REM Run the Python downloader
python download_assets.py

if %errorlevel% equ 0 (
    echo.
    echo ✅ Download process completed!
) else (
    echo.
    echo ⚠️ Download process had some issues.
)

echo.
echo Press any key to exit...
pause >nul
