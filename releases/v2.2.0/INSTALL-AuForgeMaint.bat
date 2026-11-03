@echo off
cd /d "%~dp0"
echo Joining the AuForge Maint installer from 5 parts...
for %%f in (AuForgeMaint-2.2.0.part1 AuForgeMaint-2.2.0.part2 AuForgeMaint-2.2.0.part3 AuForgeMaint-2.2.0.part4 AuForgeMaint-2.2.0.part5) do if not exist "%%f" (echo Missing file: %%f - put all the parts in the same folder as this file. & pause & exit /b 1)
copy /b AuForgeMaint-2.2.0.part1+AuForgeMaint-2.2.0.part2+AuForgeMaint-2.2.0.part3+AuForgeMaint-2.2.0.part4+AuForgeMaint-2.2.0.part5 AuForgeMaint-Setup-2.2.0.exe >nul
if errorlevel 1 (echo Could not join the parts. & pause & exit /b 1)
certutil -hashfile AuForgeMaint-Setup-2.2.0.exe SHA256 | find /i "63b626f9df1bf3c714c8666b6e58872b79607e470a79ce73c3a2f93fa0f4d394" >nul
if errorlevel 1 (echo The joined file is damaged. Download the parts again. & del AuForgeMaint-Setup-2.2.0.exe & pause & exit /b 1)
echo OK - starting the installer.
start "" AuForgeMaint-Setup-2.2.0.exe
