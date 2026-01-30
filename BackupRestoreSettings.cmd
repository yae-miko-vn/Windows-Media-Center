@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if "%errorlevel%" NEQ "0" (
	echo: Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	echo: UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs" &	exit 
)
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
)
cd /d "%~dp0"
if exist ".\SettingsBackup\*" if exist Settings.reg goto :restore
if not exist "%ProgramData%\Microsoft\eHome\*" echo.&echo eHome ProgramData directory is not found on system&goto :end
%windir%\system32\sc.exe query ehRecvr | find /i "RUNNING" 1>nul && net stop ehRecvr /y >nul 2>&1
%windir%\system32\sc.exe query ehSched | find /i "RUNNING" 1>nul && net stop ehSched /y >nul 2>&1
%windir%\system32\sc.exe query Mcx2Svc | find /i "RUNNING" 1>nul && net stop Mcx2Svc /y >nul 2>&1
xcopy %ProgramData%\Microsoft\eHome\* .\SettingsBackup\ /cheriky >nul 2>&1
%windir%\system32\reg.exe export "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Media Center" Settings.reg
goto :end

:restore
if not exist "%windir%\eHome\ehshell.exe" goto :check
choice /C YN /N /M "A backup already exist, do you want to restore it? [y/n]: "
IF ERRORLEVEL 2 exit
IF ERRORLEVEL 1 goto :run1

:check
choice /C YN /N /M "MCE is not installed, do you want to restore settings anyway? [y/n]: "
IF ERRORLEVEL 2 exit
IF ERRORLEVEL 1 goto :run1

:run1
%windir%\system32\sc.exe query ehRecvr | find /i "RUNNING" 1>nul && net stop ehRecvr /y >nul 2>&1
%windir%\system32\sc.exe query ehSched | find /i "RUNNING" 1>nul && net stop ehSched /y >nul 2>&1
%windir%\system32\sc.exe query Mcx2Svc | find /i "RUNNING" 1>nul && net stop Mcx2Svc /y >nul 2>&1
xcopy .\SettingsBackup\* %ProgramData%\Microsoft\eHome\ /cheriky >nul 2>&1
%windir%\system32\reg.exe import Settings.reg
goto :end

:end
echo.
echo.
echo Press any key to exit.
pause >nul
exit