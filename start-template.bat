@echo off
call start-config.bat
title Template

..\php\php.exe -f ..\Cheat\cheat.php ..\token\tokenTemplate.txt
pause
