@echo off
title Burgies I Cleaner
color F

set "DOWNLOADS_PATH=%USERPROFILE%\Downloads"
del /Q "%DOWNLOADS_PATH%\*"
for /d %%x in ("%DOWNLOADS_PATH%\*") do @rd /s /q "%%x"
del /q /f /s "%TEMP%\*"
for /d %%p in ("%TEMP%\*.*") do rmdir "%%p" /s /q
del /q /f /s "C:\Windows\Temp\*"
for /d %%p in ("C:\Windows\Temp\*.*") do rmdir "%%p" /s /q

if exist "C:\Windows\Prefetch" (
    echo Cleaning C:\Windows\Prefetch directory...
    del /q /f /s "C:\Windows\Prefetch\*"
    echo Prefetch Files Cleaned.
) else (
    echo Already Cleaned
)

set RECENT_PATH=%APPDATA%\Microsoft\Windows\Recent

if exist "%RECENT_PATH%" (
    echo Cleaning %RECENT_PATH% directory...
    del /q /f /s "%RECENT_PATH%\*"
    echo Recent Files Cleaned.
) else (
    echo Already Cleaned
)
exit