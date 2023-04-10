@echo off
set "params=%*"
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
title Unsupported Windows 11 PC Watermark Remover - v1.0
echo ======================================================
echo = Unsupported Windows 11 PC Watermark Remover - v1.0 =
echo ======================================================
echo =       Made by Jacob Nicked on April 10, 2023       =
echo ======================================================
echo -
echo Hello, %username%! 
echo -
echo This tool will remove the "System requirements not met" watermark.
echo -
echo This tool modifies the registry, which means the OS will be modified.
echo The tool should not break your PC, but if this happens so, I am NOT responsible for that - you use the tool for your own responsibility.
echo -
echo Type 'yes', if you want to get the watermark removed. Type 'no', if you want to exit the tool.
echo Type 'undo', if you want to get the watermark back.
echo -
echo Type the answer:
set/p "answer="

if %answer%==yes goto yes
if %answer%==no goto no
if %answer%==undo goto undo

	:yes
	echo -
    reg add "HKEY_CURRENT_USER\Control Panel\UnsupportedHardwareNotificationCache" /v SV2 /t REG_DWORD /d 2 /f
	echo -
    echo The watermark was just removed! Restart File Explorer or restart your PC. Press any key to exit.
	pause > nul
	exit

	:no 
	exit

	:undo
	echo -
    reg add "HKEY_CURRENT_USER\Control Panel\UnsupportedHardwareNotificationCache" /v SV2 /t REG_DWORD /d 1 /f
	echo -
    echo The watermark is back from now on! Restart File Explorer or restart your PC. Press any key to exit.
	pause > nul
	exit