@echo off
cd /d "%~dp0"
echo Joining the AuForge CMMS installer from 6 parts...
for %%f in (AuForgeCMMS-3.8.2.part1 AuForgeCMMS-3.8.2.part2 AuForgeCMMS-3.8.2.part3 AuForgeCMMS-3.8.2.part4 AuForgeCMMS-3.8.2.part5 AuForgeCMMS-3.8.2.part6) do if not exist "%%f" (echo Missing file: %%f - put all the parts in the same folder as this file. & pause & exit /b 1)
copy /b AuForgeCMMS-3.8.2.part1+AuForgeCMMS-3.8.2.part2+AuForgeCMMS-3.8.2.part3+AuForgeCMMS-3.8.2.part4+AuForgeCMMS-3.8.2.part5+AuForgeCMMS-3.8.2.part6 AuForgeCMMS-Setup-3.8.2.exe >nul
if errorlevel 1 (echo Could not join the parts. & pause & exit /b 1)
certutil -hashfile AuForgeCMMS-Setup-3.8.2.exe SHA256 | find /i "ce0e2fe23709f812b39d6e11971a9165add8f048f5b7348132f7dc73d1f91db4" >nul
if errorlevel 1 (echo The joined file is damaged. Download the parts again. & del AuForgeCMMS-Setup-3.8.2.exe & pause & exit /b 1)
echo OK - starting the installer.
start "" AuForgeCMMS-Setup-3.8.2.exe
