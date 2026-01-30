@echo off
cd /d "%~dp0"
%windir%\system32\whoami.exe /USER | find /i "S-1-5-18" 1>nul || (
echo ============================================================
echo ERROR: Use the outer Uninstaller.cmd to launch the process.
echo ============================================================
echo.
echo.
echo Press any key to exit...
pause >nul
goto :eof
)
echo.
echo Deleting schedule tasks...
wevtutil cl "Media Center" >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\ActivateWindowsSearch" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\ConfigureInternetTimeService" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\DispatchRecoveryTasks" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\ehDRMInit" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\InstallPlayReady" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\mcupdate" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\mcupdate_scheduled" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\MediaCenterRecoveryTask" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\ObjectStoreRecoveryTask" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\OCURActivate" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\OCURDiscovery" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\PBDADiscovery" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\PBDADiscoveryW1" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\PBDADiscoveryW2" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\PeriodicScanRetry" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\PvrRecoveryTask" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\PvrScheduleTask" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\RecordingRestart" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\RegisterSearch" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\ReindexSearchRoot" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\SqlLiteRecoveryTask" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\StartRecording" /f >nul 2>&1
schtasks /delete /tn "\Microsoft\Windows\Media Center\UpdateRecordPath" /f >nul 2>&1
%windir%\system32\reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Microsoft\Windows\Media Center" /f >nul 2>&1
echo.
echo Uninstalling assemblies...
set _ngen=%windir%\Microsoft.NET\Framework64\v4.0.30319\ngen.exe
%_ngen% uninstall "Microsoft.MediaCenter.Mheg, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "ehiwmp, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.Bml, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "mcstoredb, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.iTv.Hosting, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "mcstore, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "mcglidhostobj, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiiTV, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "mcepg, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.iTV.Media, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "ehshell, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehCIR, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehexthost, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.Playback, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiVidCtl, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiUserXp, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "loadmxf, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiActivScp, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.Sports, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.Interop, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.TV.Tuners.Interop, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "ehiExtens, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "mcupdate, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "ehiWUapi, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.ITVVM, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiTVMSMusic, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiProxy, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "BDATunePIA, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.Shell, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "mcplayerinterop, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "ehiBmlDataCarousel, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiUPnP, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.UI, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Mcx2Dvcs, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.iTV, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehRecObj, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.Mheg, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "ehiwmp, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.Bml, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "mcstoredb, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.iTv.Hosting, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "mcstore, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "mcglidhostobj, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiiTV, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "mcepg, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.iTV.Media, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "ehshell, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehCIR, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehexthost, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.Playback, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiVidCtl, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiUserXp, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "loadmxf, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiActivScp, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.Sports, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.Interop, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.TV.Tuners.Interop, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "ehiExtens, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "mcupdate, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "ehiWUapi, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.ITVVM, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiTVMSMusic, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiProxy, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "BDATunePIA, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.Shell, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "mcplayerinterop, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "ehiBmlDataCarousel, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehiUPnP, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.UI, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Mcx2Dvcs, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.iTV, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "ehRecObj, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
set _ngen=%windir%\Microsoft.NET\Framework\v4.0.30319\ngen.exe
%_ngen% uninstall "BDATunePIA, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=x86" >nul 2>&1
%_ngen% uninstall "mcstoredb, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=x86" >nul 2>&1
%_ngen% uninstall "ehexthost32, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=x86" >nul 2>&1
%_ngen% uninstall "ehiExtens, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.UI, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "BDATunePIA, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=x86" >nul 2>&1
%_ngen% uninstall "mcstoredb, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=x86" >nul 2>&1
%_ngen% uninstall "ehexthost32, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=x86" >nul 2>&1
%_ngen% uninstall "ehiExtens, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
%_ngen% uninstall "Microsoft.MediaCenter.UI, Version=10.0.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" >nul 2>&1
echo.
echo Deleting services...
%windir%\system32\sc.exe query ehRecvr | find /i "RUNNING" >nul 2>&1
if %ERRORLEVEL% EQU 0 net stop ehRecvr /y >nul 2>&1
%windir%\system32\sc.exe query ehSched | find /i "RUNNING" >nul 2>&1
if %ERRORLEVEL% EQU 0 net stop ehSched >nul 2>&1
%windir%\system32\sc.exe query Mcx2Svc | find /i "RUNNING" >nul 2>&1
if %ERRORLEVEL% EQU 0 net stop Mcx2Svc /y >nul 2>&1
%windir%\system32\sc.exe delete ehRecvr >nul 2>&1
%windir%\system32\sc.exe delete ehSched >nul 2>&1
%windir%\system32\sc.exe delete Mcx2Svc >nul 2>&1
echo.
echo Removing registry settings...
%windir%\system32\reg.exe import Uninstall.reg >nul 2>&1
echo.
echo Deleting files...
taskkill /t /f /IM mcupdate.exe >nul 2>&1
taskkill /t /f /IM ehrecvr.exe >nul 2>&1
taskkill /t /f /IM ehsched.exe >nul 2>&1
taskkill /t /f /IM ehshell.exe >nul 2>&1
taskkill /t /f /IM ehtray.exe >nul 2>&1
del /f /s /q %SystemRoot%\ehome\* >nul 2>&1
del /f /q %SystemRoot%\ehome >nul 2>&1
rmdir /s /q %ProgramData%\Microsoft\eHome >nul 2>&1
rmdir /s /q "%SystemDrive%\Users\Default\AppData\Roaming\Media Center Programs" >nul 2>&1
rmdir /s /q "%SystemRoot%\System32\Tasks\Microsoft\Windows\Media Center" >nul 2>&1
rmdir /s /q %SystemRoot%\ehome >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_32\BDATunePIA >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_32\ehexthost32 >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_32\mcstoredb >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_64\BDATunePIA >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_64\mcplayerinterop >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_64\mcstoredb >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_64\mcupdate >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_64\Mcx2Dvcs >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_64\Microsoft.MediaCenter.Interop >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_64\Microsoft.MediaCenter.iTV.Media >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_64\Microsoft.MediaCenter.Mheg >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_64\Microsoft.MediaCenter.TV.Tuners.Interop >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehCIR >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehexthost >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiActivScp >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiBmlDataCarousel >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiExtens >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiiTV >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiProxy >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiTVMSMusic >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiUPnP >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiUserXp >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiVidCtl >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiwmp >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiWUapi >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehRecObj >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehshell >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\loadmxf >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\mcepg >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\mcglidhostobj >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\mcstore >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.Bml >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.iTV >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.iTv.Hosting >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.ITVVM >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.Playback >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.Shell >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.Sports >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.UI >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Policy.6.0.ehRecObj >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Policy.6.0.Microsoft.MediaCenter >nul 2>&1
rmdir /s /q %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Policy.6.0.Microsoft.MediaCenter.UI >nul 2>&1
del /f /q %SystemRoot%\System32\iTVData.dll >nul 2>&1
del /f /q %SystemRoot%\System32\mcmde.dll >nul 2>&1
del /f /q %SystemRoot%\System32\mcsrchPH.dll >nul 2>&1
del /f /q %SystemRoot%\System32\Mcx2Svc.dll >nul 2>&1
del /f /q %SystemRoot%\System32\mspbda.dll >nul 2>&1
del /f /q %SystemRoot%\System32\MsPbdaCoInst.dll >nul 2>&1
del /f /q %SystemRoot%\System32\sysprepMCE.dll >nul 2>&1
del /f /q %SystemRoot%\System32\spp\tokens\ppdlic\MCLicense-ppdlic.xrm-ms >nul 2>&1
del /f /q %SystemRoot%\System32\spp\tokens\ppdlic\MediaCenter-ppdlic.xrm-ms >nul 2>&1
del /f /q %SystemRoot%\SysWOW64\iTVData.dll >nul 2>&1
del /f /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Accessories\Windows Media Center.lnk" >nul 2>&1
del /f /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp\Windows Media Center Systray.lnk" >nul 2>&1
del /f /q "%SystemDrive%\Users\Public\Desktop\Windows Media Center.lnk" >nul 2>&1
echo.
echo.
echo Done.
echo A reboot is recommended before trying to install the pack again.
echo.
echo Press any key to exit.
pause >nul
exit