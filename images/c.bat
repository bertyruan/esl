@echo off
setlocal enabledelayedexpansion

:: --- Configuration ---
:: Set quality (0-100). 75 is recommended for high compression with low visible loss.
<<<<<<< HEAD
set QUALITY=10
=======
set QUALITY=40
>>>>>>> bd811d84ddbba2ca6fcb59c81afee75bd63eecd2

echo Starting in-place lossy compression...
echo WARNING: This will overwrite your original files.
echo.

:: Loop through all .webp files
for %%f in (*.webp) do (
    echo Processing: %%f
    
    :: Run compression to a temp file
    cwebp -q %QUALITY% "%%f" -o "%%f.tmp"
    
    :: If the temp file exists, move it over the original
    if exist "%%f.tmp" (
        move /y "%%f.tmp" "%%f" >nul
    ) else (
        echo [ERROR] Failed to process %%f
    )
)

echo.
echo Done! All images have been compressed and overwritten.
pause