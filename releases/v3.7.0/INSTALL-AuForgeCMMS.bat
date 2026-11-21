@echo off
cd /d "%~dp0"
echo Joining the AuForge CMMS installer from 5 parts...
for %%f in (AuForgeCMMS-3.7.0.part1 AuForgeCMMS-3.7.0.part2 AuForgeCMMS-3.7.0.part3 AuForgeCMMS-3.7.0.part4 AuForgeCMMS-3.7.0.part5) do if not exist "%%f" (echo Missing file: %%f - put all the parts in the same folder as this file. & pause & exit /b 1)
copy /b AuForgeCMMS-3.7.0.part1+AuForgeCMMS-3.7.0.part2+AuForgeCMMS-3.7.0.part3+AuForgeCMMS-3.7.0.part4+AuForgeCMMS-3.7.0.part5 AuForgeCMMS-Setup-3.7.0.exe >nul
if errorlevel 1 (echo Could not join the parts. & pause & exit /b 1)
certutil -hashfile AuForgeCMMS-Setup-3.7.0.exe SHA256 | find /i "9839141396c1b2a76be92e7cb992c925b9b2eb3598e6ed4be35959e1b01fe2bf" >nul
if errorlevel 1 (echo The joined file is damaged. Download the parts again. & del AuForgeCMMS-Setup-3.7.0.exe & pause & exit /b 1)
echo OK - starting the installer.
start "" AuForgeCMMS-Setup-3.7.0.exe
