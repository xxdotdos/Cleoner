@Echo off
:: BatchGotAdmin
:-------------------------------------
REM --> Check for permissions
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Requesting Admin Perms To Clean Fortnite...
goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params= %*
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:gotAdmin
pushd "%CD%"
CD /D "%~dp0"

TASKKILL /F /IM BEService.exe > nul
TASKKILL /F /IM BEServices.exe > nul
TASKKILL /F /IM BattleEye.exe > nul
TASKKILL /F /IM CrashReportClient.exe > nul
TASKKILL /F /IM EpicWebHelper.exe > nul
TASKKILL /F /IM EasyAntiCheat.exe > nul
TASKKILL /F /IM EpicGamesLauncher.exe > nul
TASKKILL /F /IM FortniteClient-Win64-Shipping_EAC.exe > nul
TASKKILL /F /IM FortniteClient-Win64-Shipping_BE.exe > nul
TASKKILL /F /IM FortniteClient-Win64-Shipping.exe > nul
TASKKILL /F /IM FortniteLauncher.exe > nul

cls

Reg Delete "HKLM\SYSTEM\ControlSet001\Services\EpicOnlineServices" /f
Reg Delete "HKCU\SOFTWARE\Epic Games" /f
Reg Delete "HKLM\SOFTWARE\Classes\com.epicgames.launcher" /f
Reg Delete "HKLM\SYSTEM\ControlSet001\Services\BEService" /f
Reg Delete "HKLM\SYSTEM\ControlSet001\Services\BEDaisy" /f
Reg Delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat" /f
Reg Delete "HKLM\SYSTEM\CurrentControlSet\Services\BEService" /f
Reg Delete "HKLM\SYSTEM\CurrentControlSet\Services\BEDaisy" /f
Reg Delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat" /f
Reg Delete "HKLM\SOFTWARE\WOW6432Node\EasyAntiCheat" /f
Reg Delete "HKLM\SOFTWARE\WOW6432Node\Epic Games" /f
Reg Delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\NonPackaged" /f
Reg Delete "HKLM\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications" /f
Reg Delete "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\com.epicgames.launcher" /f
Reg Delete "HKCR\com.epicgames.eos" /f
Reg Delete "HKLM\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications" /f
Reg Delete "HKLM\SOFTWARE\EpicGames" /f
Reg Delete "HKEY_USERS\S-1-5-18\Software\Epic Games" /f

cls

RMDIR /S /Q "%SystemDrive%\Users\%UserName%\AppData\Local\EpicGamesLauncher"
RMDIR /S /Q "%SystemDrive%\Users\%UserName%\AppData\Local\FortniteGame"
RMDIR /S /Q "%SystemDrive%\Users\%UserName%\AppData\Local\Epic Games"
RMDIR /S /Q "%SystemDrive%\Users\%UserName%\AppData\Local\NVIDIA Corporation"
RMDIR /S /Q "%SystemDrive%\Users\%UserName%\AppData\Roaming\EasyAntiCheat"
RMDIR /S /Q "%SystemDrive%\Users\%UserName%\AppData\Local\UnrealEngine"
RMDIR /S /Q "%SystemDrive%\Users\%UserName%\AppData\Local\UnrealEngineLauncher"
RMDIR /S /Q "%SystemDrive%\ProgramData\Epic\EpicOnlineServices"
RMDIR /S /Q "%SystemDrive%\Program Files (x86)\Epic Games\Epic Online Services\service"
RMDIR /S /Q "%SystemDrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\Shared Files"
RMDIR /S /Q "%SystemDrive%\Program Files (x86)\Common Files\BattlEye"
RMDIR /S /Q "%SystemDrive%\Program Files (x86)\EasyAntiCheat"

cls

DEL /F "%SystemDrive%\ProgramData\Epic\EpicGamesLauncher\Data\EMS\current"
DEL /F "%SystemDrive%\Users\All Users\Epic\EpicGamesLauncher\Data\EMS\current"

cls

del /q "%SystemDrive%\Users\%UserName%\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\"
for /d %%x in (%SystemDrive%\Users\%UserName%\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Windows\System32\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\"
for /d %%x in (%SystemDrive%\Windows\System32\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Users\%UserName%\AppData\Local\Microsoft\Feeds\"
for /d %%x in (%SystemDrive%\Users\%UserName%\AppData\Local\Microsoft\Feeds\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Users\%UserName%\AppData\Local\Microsoft\Windows\INetCache\"
for /d %%x in (%SystemDrive%\Users\%UserName%\AppData\Local\Microsoft\Windows\INetCache\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\"
for /d %%x in (%SystemDrive%\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Users\%UserName%\AppData\Local\AMD\CN\GameReport\"
for /d %%x in (%SystemDrive%\Users\%UserName%\AppData\Local\AMD\CN\GameReport\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\ProgramData\Microsoft\Windows\WER\Temp\"
for /d %%x in (%SystemDrive%\ProgramData\Microsoft\Windows\WER\Temp\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Users\%UserName%\AppData\Local\D3DSCache\"
for /d %%x in (%SystemDrive%\Users\%UserName%\AppData\Local\D3DSCache\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Windows\System32\config\systemprofile\AppData\Local\D3DSCache\"
for /d %%x in (%SystemDrive%\Windows\System32\config\systemprofile\AppData\Local\D3DSCache\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Windows\System32\config\systemprofile\AppData\Local\AMD\DxCache\"
for /d %%x in (%SystemDrive%\Windows\System32\config\systemprofile\AppData\Local\AMD\DxCache\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Users\%UserName%\AppData\Local\AMD\DxCache\"
for /d %%x in (%SystemDrive%\Users\%UserName%\AppData\Local\AMD\DxCache\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Users\%UserName%\AppData\Local\CrashReportClient\"
for /d %%x in (%SystemDrive%\Users\%UserName%\AppData\Local\CrashReportClient\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Users\%UserName%\AppData\Local\AMD\"
for /d %%x in (%SystemDrive%\Users\%UserName%\AppData\Local\AMD\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Users\%UserName%\AppData\Local\AMD_Common\"
for /d %%x in (%SystemDrive%\Users\%UserName%\AppData\Local\AMD_Common\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Windows\System32\AMD\EeuDumps\"
for /d %%x in (%SystemDrive%\Windows\System32\AMD\EeuDumps\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Windows\System32\AMD\MmdDumps\"
for /d %%x in (%SystemDrive%\Windows\System32\AMD\MmdDumps\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Windows\SoftwareDistribution\Download\"
for /d %%x in (%SystemDrive%\Windows\SoftwareDistribution\Download\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\ProgramData\Microsoft\Windows\WER\ReportArchive\"
for /d %%x in (%SystemDrive%\ProgramData\Microsoft\Windows\WER\ReportArchive\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\AMD\"
for /d %%x in (%SystemDrive%\AMD\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\PerfLogs\"
for /d %%x in (%SystemDrive%\PerfLogs\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\$Recycle.bin\"
for /d %%x in (%SystemDrive%\$Recycle.bin\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Windows\Prefetch\"
for /d %%x in (%SystemDrive%\Windows\Prefetch\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Windows\Temp\*
for /d %%x in (%SystemDrive%\Windows\Temp\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Windows\temp\"
for /d %%x in (%SystemDrive%\Windows\temp\*) do @rd /s /q "%%x"

del /q "%SystemDrive%\Users\%UserName%\AppData\Local\Temp\"
for /d %%x in (%SystemDrive%\Users\%UserName%\AppData\Local\Temp\*) do @rd /s /q "%%x"

cls

netsh advfirewall reset

cls

echo Fortnite Tracers Cleaned!!

pause