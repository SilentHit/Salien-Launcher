@echo off
title Update Salien Cheat
echo Updating script...
echo.

set backupPath=zip\
set scriptPath=..\cheat\

md temp
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri https://github.com/SilentHit/Salien-Cheat/archive/master.zip -OutFile temp\Salien-Cheat-master.zip"
powershell -Command "Expand-Archive -LiteralPath temp\Salien-Cheat-master.zip -DestinationPath temp\ -Force"

for %%i in (%scriptPath%*) do (
	if not %%i == %scriptPath%token.txt (
		del %%i
	)
)

copy temp\Salien-Cheat-master\* %scriptPath% >nul
echo Folder %scriptPath% updated

if not exist "%backupPath%" (
	md %backupPath%
)

if exist %backupPath%Salien-Cheat-old.zip (
	if exist %backupPath%Salien-Cheat-master.zip (
		del %backupPath%Salien-Cheat-old.zip
	)
)

if exist %backupPath%Salien-Cheat-master.zip (
	move %backupPath%Salien-Cheat-master.zip %backupPath%Salien-Cheat-old.zip >nul
)

move temp\Salien-Cheat-master.zip %backupPath% >nul
rd /s /q temp\

echo.
echo Update script done!
pause
