@echo off
call start-config.bat
title Template

..\cheat\php\php.exe -f ..\cheat\cheat.php ..\token\tokenTemplate.txt
pause
