@echo off
cd %~dp0
echo [%date% %time%] Loaded os_info>> logs\dump.log

set os_name=salmonOS
set os_ver=0.1.0
set display_alpha_warning=false
set username=name
set computer_name=pcname