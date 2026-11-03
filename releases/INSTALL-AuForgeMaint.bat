@echo off
cd /d "%~dp0"
echo Joining the AuForge Maint installer from 5 parts...
for %%f in (AuForgeMaint-2.4.0.part1 AuForgeMaint-2.4.0.part2 AuForgeMaint-2.4.0.part3 AuForgeMaint-2.4.0.part4 AuForgeMaint-2.4.0.part5) do if not exist "%%f" (echo Missing file: %%f - put all the parts in the same folder as this file. & pause & exit /b 1)
copy /b AuForgeMaint-2.4.0.part1+AuForgeMaint-2.4.0.part2+AuForgeMaint-2.4.0.part3+AuForgeMaint-2.4.0.part4+AuForgeMaint-2.4.0.part5 AuForgeMaint-Setup-2.4.0.exe >nul
if errorlevel 1 (echo Could not join the parts. & pause & exit /b 1)
certutil -hashfile AuForgeMaint-Setup-2.4.0.exe SHA256 | find /i "279857b2d7977a9b232bd107e9daf8e8eb4bc2b14c7cafcd8bd42f89f6a0b88d" >nul
if errorlevel 1 (echo The joined file is damaged. Download the parts again. & del AuForgeMaint-Setup-2.4.0.exe & pause & exit /b 1)
echo OK - starting the installer.
start "" AuForgeMaint-Setup-2.4.0.exe
