@echo off
title Update Salien Cheat
echo Updating script...
echo.

set backupPath=zip\
set scriptPath=Salien-Cheat\ Salien-Cheat2\

md temp
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri https://github.com/SteamDatabase/SalienCheat/archive/master.zip -OutFile temp\SalienCheat-master.zip"
powershell -Command "Expand-Archive -LiteralPath temp\SalienCheat-master.zip -DestinationPath temp\ -Force"

for %%p in (%scriptPath%) do (
	for %%i in (%%p*) do (if not %%i == %%ptoken.txt del %%i)
	copy temp\SalienCheat-master\* %%p >nul
	echo Folder %%p updated
)

if not exist "%backupPath%" (
	md %backupPath%
)

if exist %backupPath%SalienCheat-old.zip (
	if exist %backupPath%SalienCheat-master.zip (
		del %backupPath%SalienCheat-old.zip
	)
)

if exist %backupPath%SalienCheat-master.zip (
	move %backupPath%SalienCheat-master.zip %backupPath%SalienCheat-old.zip >nul
)

move temp\SalienCheat-master.zip %backupPath% >nul
rd /s /q temp\

echo.
echo Update script done!
pause
