@echo off
cd %~dp0
echo [%date% %time%] Loaded shell>> logs\dump.log

echo %os_name% v%os_ver%

:command_line
echo.
set /p cmd=%username%@%computer_name%: 
if %cmd% == help goto :help
if %cmd% == sysinfo goto :sysinfo
if %cmd% == shutdown goto :shutdown
if %cmd% == reboot goto :reboot
goto :invalid_command

:invalid_command
if exist %cmd%.bat == (
	echo [%date% %time%] Loaded %cmd%>> logs\dump.log
	call %cmd%.bat
	goto :command_line
) else (
	echo Invalid command
	goto :command_line
)

:help
type help.txt
echo.
goto :command_line

:sysinfo
echo OS: %os_name%
echo Version: v%os_ver%
echo Computer name: %computer_name%
echo Date: %date%
echo Time: %time%
goto :command_line

:shutdown
echo [%date% %time%] The system has shut down>> logs\dump.log
exit /b 1

:reboot
echo [%date% %time%] The system is rebooting>> logs\dump.log
call bootmgr.bat
exit
pause >NUL