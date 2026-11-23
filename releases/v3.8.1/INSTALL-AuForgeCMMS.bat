@echo off
cd /d "%~dp0"
echo Joining the AuForge CMMS installer from 6 parts...
for %%f in (AuForgeCMMS-3.8.1.part1 AuForgeCMMS-3.8.1.part2 AuForgeCMMS-3.8.1.part3 AuForgeCMMS-3.8.1.part4 AuForgeCMMS-3.8.1.part5 AuForgeCMMS-3.8.1.part6) do if not exist "%%f" (echo Missing file: %%f - put all the parts in the same folder as this file. & pause & exit /b 1)
copy /b AuForgeCMMS-3.8.1.part1+AuForgeCMMS-3.8.1.part2+AuForgeCMMS-3.8.1.part3+AuForgeCMMS-3.8.1.part4+AuForgeCMMS-3.8.1.part5+AuForgeCMMS-3.8.1.part6 AuForgeCMMS-Setup-3.8.1.exe >nul
if errorlevel 1 (echo Could not join the parts. & pause & exit /b 1)
certutil -hashfile AuForgeCMMS-Setup-3.8.1.exe SHA256 | find /i "e1d7b778691c694298f4f964c2f2c1420505f5cef30e8a962f72e870b01459aa" >nul
if errorlevel 1 (echo The joined file is damaged. Download the parts again. & del AuForgeCMMS-Setup-3.8.1.exe & pause & exit /b 1)
echo OK - starting the installer.
start "" AuForgeCMMS-Setup-3.8.1.exe
