@echo off
REM go to users quota directory
F:
cd SafeBox
dir /b > C:\Users\user\Desktop\output.txt


REM rescan all users quota
for /f "delims=" %%x in (C:\Users\user\Desktop\output.txt) do Dirquota quota scan /Path:F:\SafeBox\%%x

echo "User quota scan completed"
pause
