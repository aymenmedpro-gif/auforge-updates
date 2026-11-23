@echo off
cd /d "%~dp0"
echo Joining the AuForge CMMS installer from 6 parts...
for %%f in (AuForgeCMMS-3.8.3.part1 AuForgeCMMS-3.8.3.part2 AuForgeCMMS-3.8.3.part3 AuForgeCMMS-3.8.3.part4 AuForgeCMMS-3.8.3.part5 AuForgeCMMS-3.8.3.part6) do if not exist "%%f" (echo Missing file: %%f - put all the parts in the same folder as this file. & pause & exit /b 1)
copy /b AuForgeCMMS-3.8.3.part1+AuForgeCMMS-3.8.3.part2+AuForgeCMMS-3.8.3.part3+AuForgeCMMS-3.8.3.part4+AuForgeCMMS-3.8.3.part5+AuForgeCMMS-3.8.3.part6 AuForgeCMMS-Setup-3.8.3.exe >nul
if errorlevel 1 (echo Could not join the parts. & pause & exit /b 1)
certutil -hashfile AuForgeCMMS-Setup-3.8.3.exe SHA256 | find /i "7b5b17cfa831f9ba7f7cc0805a4f7093c7b94b2bcc9ad4519cf459aa0d679c67" >nul
if errorlevel 1 (echo The joined file is damaged. Download the parts again. & del AuForgeCMMS-Setup-3.8.3.exe & pause & exit /b 1)
echo OK - starting the installer.
start "" AuForgeCMMS-Setup-3.8.3.exe
