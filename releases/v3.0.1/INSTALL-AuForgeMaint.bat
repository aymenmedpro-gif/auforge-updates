@echo off
cd /d "%~dp0"
echo Joining the AuForge Maint installer from 5 parts...
for %%f in (AuForgeMaint-3.0.1.part1 AuForgeMaint-3.0.1.part2 AuForgeMaint-3.0.1.part3 AuForgeMaint-3.0.1.part4 AuForgeMaint-3.0.1.part5) do if not exist "%%f" (echo Missing file: %%f - put all the parts in the same folder as this file. & pause & exit /b 1)
copy /b AuForgeMaint-3.0.1.part1+AuForgeMaint-3.0.1.part2+AuForgeMaint-3.0.1.part3+AuForgeMaint-3.0.1.part4+AuForgeMaint-3.0.1.part5 AuForgeMaint-Setup-3.0.1.exe >nul
if errorlevel 1 (echo Could not join the parts. & pause & exit /b 1)
certutil -hashfile AuForgeMaint-Setup-3.0.1.exe SHA256 | find /i "c2233e60f7c159859e1a33c950c80727bc4b56188ff7c08917f3dc6509ed97cc" >nul
if errorlevel 1 (echo The joined file is damaged. Download the parts again. & del AuForgeMaint-Setup-3.0.1.exe & pause & exit /b 1)
echo OK - starting the installer.
start "" AuForgeMaint-Setup-3.0.1.exe
