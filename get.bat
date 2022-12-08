@echo off

SET PATH=%PATH%;C:\WINDOWS\SYSTEM32

bcdedit >>nul 
if %errorlevel% == 1 goto noadmin

set current_path=%~dp0
echo Current Path  : %current_path%

echo.
set /p variable_IP="IP Address:"
set /p variable_user="Username: "
set /p variable_location="Location: "

set SAVE_DIR=%current_path%00_%variable_IP%\

set SAVE_FILE=%SAVE_DIR%result.txt
set SAVE_DIR_EXPORT=%SAVE_DIR%\export

mkdir %SAVE_DIR%
mkdir %SAVE_DIR_EXPORT%

echo . 
echo Logfile = "%SAVE_FILE%" 
echo.

echo. > %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo PC  >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
echo Datetime : "%date% %time%" >> %SAVE_FILE%
echo PC User : %variable_user% >> %SAVE_FILE%
echo PC Location: %variable_location% >> %SAVE_FILE%
echo. >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo WHOAMI >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
whoami  >> %SAVE_FILE%
echo. >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo SET  >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
set >> %SAVE_FILE%
echo. >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo ARP >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
arp -a  >> %SAVE_FILE%
echo. >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo SYSTEMINFO >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
systeminfo  >> %SAVE_FILE%
echo. >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo NET USER >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
net share >> %SAVE_FILE%
net user  >> %SAVE_FILE%
echo. >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo IPCONFIG /ALL >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
ipconfig /all >> %SAVE_FILE%
echo. >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo tasklist >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
tasklist /v>> %SAVE_FILE%
tasklist /m>> %SAVE_FILE%
tasklist /svc>> %SAVE_FILE%
echo. >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo dir "temp"t >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
dir %temp% /od /a >> %SAVE_FILE%
echo. >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo netstat -nao >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
netstat -nao >> %SAVE_FILE%
echo. >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo prefetch file list >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
dir c:\windows\prefetch /OD >> %SAVE_FILE%
echo. >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo RunMRU >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" >> %SAVE_FILE%
echo. >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo reg query Compatibility Assistant\Store >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
reg query "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" >> %SAVE_FILE%
reg query "HKLM\SYSTEM\ControlSet001\Control\Session Manager\AppCompatCache" >> %SAVE_FILE%
echo. >> %SAVE_FILE%
reg query "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" >> %SAVE_FILE%

echo ******************************************************************************** >> %SAVE_FILE%
echo SRUDB.dat >> %SAVE_FILE%
echo ******************************************************************************** >> %SAVE_FILE%
copy %SYSTEM%\sru\srudb.dat %SAVE_DIR%
echo. >> %SAVE_FILE%

> hostname
> systeminfo
> net user
> query user
> route print
> ipconfig /all
> arp -a
> netstat -ano
> tasklist
> tasklist /svc



echo ""
echo "*********************************************************************************************************************"
echo "************************************************* End  *************************************************************"
echo "*********************************************************************************************************************"

pause
exit

:noadmin 
echo "run administrator command mode"
echo.
pause 
exit
