@echo off
cd /d "%~dp0"
echo Joining the AuForge Maint installer from 5 parts...
for %%f in (AuForgeMaint-3.0.0.part1 AuForgeMaint-3.0.0.part2 AuForgeMaint-3.0.0.part3 AuForgeMaint-3.0.0.part4 AuForgeMaint-3.0.0.part5) do if not exist "%%f" (echo Missing file: %%f - put all the parts in the same folder as this file. & pause & exit /b 1)
copy /b AuForgeMaint-3.0.0.part1+AuForgeMaint-3.0.0.part2+AuForgeMaint-3.0.0.part3+AuForgeMaint-3.0.0.part4+AuForgeMaint-3.0.0.part5 AuForgeMaint-Setup-3.0.0.exe >nul
if errorlevel 1 (echo Could not join the parts. & pause & exit /b 1)
certutil -hashfile AuForgeMaint-Setup-3.0.0.exe SHA256 | find /i "5dadaa8ab8e07884fa02e4d72ed4166a90daca88c926e3f80b2a1a76e48510f0" >nul
if errorlevel 1 (echo The joined file is damaged. Download the parts again. & del AuForgeMaint-Setup-3.0.0.exe & pause & exit /b 1)
echo OK - starting the installer.
start "" AuForgeMaint-Setup-3.0.0.exe
