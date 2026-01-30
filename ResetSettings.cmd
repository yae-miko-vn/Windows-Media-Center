@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if "%errorlevel%" NEQ "0" (
	echo: Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	echo: UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs" &	exit 
)
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
)
choice /C YN /N /M "Media Center's settings will be cleared, do you want to proceed? [y/n]: "
IF ERRORLEVEL 2 exit
IF ERRORLEVEL 1 goto :run1


:run1
%SystemRoot%\ehome\mcupdate.exe -MediaCenterRecoveryTask
pause 5

rmdir /s /q %ProgramData%\Microsoft\eHome >nul 2>&1


goto :end

:end
echo.
echo.
echo Press any key to exit.
pause >nul
exit