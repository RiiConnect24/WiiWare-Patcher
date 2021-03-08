@echo off
REM --- Important for file counter to work ---
setlocal ENABLEDELAYEDEXPANSION
rem ---
cd /d "%~dp0"
set currentPath=%cd%
goto begin
:begin
if not exist "%appdata%\WiimmfiPatcher\temp\" md "%appdata%\WiimmfiPatcher\temp\"
set patchingok=1
set mode=128,37
mode %mode%
set /a cor=0
set /a patchingnumber=1
set /a temperrorlev=0
::
set last_build=2021/03/08
set at=10:21
:: ===========================================================================
:: WiiWare Patcher for Windows
set version=2.2.1
:: AUTHORS: KcrPL,
:: ***************************************************************************
:: Copyright (c) 2021 RiiConnect24, and it's (Lead) Developers
:: ===========================================================================

@echo off
set title=Wiimmfi Patcher for WAD's v%version% Created by @KcrPL
title %title%
cls

set /a patherror=0
if "%cd%"=="%windir%\system32" set /a patherror=1
if %patherror%==0 if not exist "patcher.bat" set /a patherror=2

:: ### Auto Update ###
set /a Update_Activate=1
set /a whatsnew=1
set /a offlinestorage=0
:: set FilesHostedOn=https://raw.githubusercontent.com/KcrPL/KcrPL.github.io/master/Patchers_Auto_Update/WiiWare-Patcher
set FilesHostedOn=https://patcher.rc24.xyz/update/WiiWare-Patcher/v1
set FilesHostedOn_update_assistant=https://patcher.rc24.xyz/update/RiiConnect24-Patcher/v1
set MainFolder=%appdata%\WiiWare-Patcher
set TempStorage=%appdata%\WiiWare-Patcher\internet\temp
set header=Wiimmfi WiiWarePatcher - (C) KcrPL v%version% (Updated on %last_build% at %at%)
set header_loop=Wiimmfi WiiWarePatcher - KcrPL v%version% Updated on %last_build% at %at%
set aio_assisted=0
set useragent_curl=--user-agent "WiiWare Patcher v%version%"

if exist temp.bat del temp.bat /q

if exist RC24PATCHER_START_PATCHING_SCRIPT goto rc24_aio_patcher_script_enable

goto begin_main

:rc24_aio_patcher_script_enable
set /a aio_assisted=1
set /a errorwinxp=0
set /a updateserver=1
goto choose_patch_type


:begin_main
if %aio_assisted%==1 exit
mode %mode%
cls
echo %header%
echo              `..````
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+    Wiimmfi WADs Patcher.
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN   Play Wii games online after Nintendo WFC shutdown!
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd    Press any button to continue
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+  (Please mail us at support@riiconnect24.net if you have problems)
echo             mmmmms smMMMMMMMMMmddMMmmNmNMMMMMMMMMMMM:
echo            `mmmmmo hNMMMMMMMMMmddNMMMNNMMMMMMMMMMMMM.
echo            -mmmmm/ dNMMMMMMMMMNmddMMMNdhdMMMMMMMMMMN
echo            :mmmmm-`mNMMMMMMMMNNmmmNMMNmmmMMMMMMMMMMd
echo            +mmmmN.-mNMMMMMMMMMNmmmmMMMMMMMMMMMMMMMMy
echo            smmmmm`/mMMMMMMMMMNNmmmmNMMMMNMMNMMMMMNmy.
echo            hmmmmd`omMMMMMMMMMNNmmmNmMNNMmNNNNMNdhyhh.
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`
echo                                   -odhhhhyddmmmmmNNmhs/:`
echo                                     :syhdyyyyso+/-`
pause>NUL
if %patherror%==1 goto begin_main
goto startup_script

:begin_main_download_curl
cls
echo %header%
echo.
echo              `..````                                     :-------------------------:
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`    Downloading curl... Please wait.
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd    This can take some time...
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs   :-------------------------:
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+   
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:   File 1 [3.5MB] out of 1
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.   0%% [          ]
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+
echo             mmmmms smMMMMMMMMMmddMMmmNmNMMMMMMMMMMMM:
echo            `mmmmmo hNMMMMMMMMMmddNMMMNNMMMMMMMMMMMMM.
echo            -mmmmm/ dNMMMMMMMMMNmddMMMNdhdMMMMMMMMMMN
echo            :mmmmm-`mNMMMMMMMMNNmmmNMMNmmmMMMMMMMMMMd
echo            +mmmmN.-mNMMMMMMMMMNmmmmMMMMMMMMMMMMMMMMy
echo            smmmmm`/mMMMMMMMMMNNmmmmNMMMMNMMNMMMMMNmy.
echo            hmmmmd`omMMMMMMMMMNNmmmNmMNNMmNNNNMNdhyhh.
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`
echo                                   -odhhhhyddmmmmmNNmhs/:`
echo                                     :syhdyyyyso+/-`
call powershell -command (new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/curl.exe', 'curl.exe')
set /a temperrorlev=%errorlevel%
if not %temperrorlev%==0 goto begin_main_download_curl_error

goto startup_script
:begin_main_download_curl_error
cls
echo %header%                                                                
echo              `..````                                                  
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd                
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+        
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN            
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd                 
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo ---------------------------------------------------------------------------------------------------------------------------
echo    /---\   ERROR.              
echo   /     \  There was an error while downloading curl.
echo  /   ^!   \ 
echo  --------- We will now open a website that will download curl.exe.
echo            Please move curl.exe to the folder where RiiConnect24 Patcher is and restart the patcher.
echo.
echo       Press any key to open download page in browser and to return to menu.
echo ---------------------------------------------------------------------------------------------------------------------------
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm                     
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+                    
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm                    
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+                   
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm                   
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/    
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy   
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`   
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`        
echo                                   -odhhhhyddmmmmmNNmhs/:`             
echo                                     :syhdyyyyso+/-`                   
pause>NUL
start %FilesHostedOn%/curl.exe
goto begin_main


:startup_script

curl
if not %errorlevel%==2 goto begin_main_download_curl

mode %mode%
cls
echo.
echo              `..````
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+
echo             mmmmms smMMMMMMMMMmddMMmmNmNMMMMMMMMMMMM:
echo            `mmmmmo hNMMMMMMMMMmddNMMMNNMMMMMMMMMMMMM.
echo            -mmmmm/ dNMMMMMMMMMNmddMMMNdhdMMMMMMMMMMN
echo            :mmmmm-`mNMMMMMMMMNNmmmNMMNmmmMMMMMMMMMMd
echo            +mmmmN.-mNMMMMMMMMMNmmmmMMMMMMMMMMMMMMMMy
echo            smmmmm`/mMMMMMMMMMNNmmmmNMMMMNMMNMMMMMNmy.
echo            hmmmmd`omMMMMMMMMMNNmmmNmMNNMmNNNNMNdhyhh.
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`
echo                                   -odhhhhyddmmmmmNNmhs/:`
echo                                     :syhdyyyyso+/-`
echo                                                                        Please wait...
set updateversion=0.0.0

:: Update script.
set updateversion=0.0.0
:: Delete version.txt and whatsnew.txt
if %offlinestorage%==0 if exist "%TempStorage%\version.txt" del "%TempStorage%\version.txt" /q
if %offlinestorage%==0 if exist "%TempStorage%\whatsnew.txt" del "%TempStorage%\whatsnew.txt" /q

if not exist "%TempStorage%" md "%TempStorage%"
:: Commands to download files from server.

		title %string78% :-         :

call curl -f -L -s --insecure "http://www.msftncsi.com/ncsi.txt">NUL
	if "%errorlevel%"=="6" title %title%& goto no_internet_connection

		title %string78% :--        :

For /F "Delims=" %%A In ('call curl -f -L -s %useragent_curl% --insecure "https://patcher.rc24.xyz/connection_test.txt"') do set "connection_test=%%A"
	set /a temperrorlev=%errorlevel%
	
	if not "%connection_test%"=="OK" title %title%& goto server_dead
	
		title %string78% :---       :

if %Update_Activate%==1 if %offlinestorage%==0 call curl -f -L -s -S %useragent_curl% --insecure "%FilesHostedOn%/UPDATE/whatsnew.txt" --output "%TempStorage%\whatsnew.txt"
if %Update_Activate%==1 if %offlinestorage%==0 call curl -f -L -s -S %useragent_curl% --insecure "%FilesHostedOn%/UPDATE/version.txt" --output "%TempStorage%\version.txt"
	set /a temperrorlev=%errorlevel%

		title %string78% :-----     :
		
set /a updateserver=1
	::Bind exit codes to errors here

	if not %temperrorlev%==0 set /a updateserver=0

if exist "%TempStorage%\version.txt`" ren "%TempStorage%\version.txt`" "version.txt"
if exist "%TempStorage%\whatsnew.txt`" ren "%TempStorage%\whatsnew.txt`" "whatsnew.txt"
:: Copy the content of version.txt to variable.

		title %string78% :------    :

if exist "%TempStorage%\version.txt" set /p updateversion=<"%TempStorage%\version.txt"
if not exist "%TempStorage%\version.txt" set /a updateavailable=0
if %Update_Activate%==1 if exist "%TempStorage%\version.txt" set /a updateavailable=1
:: If version.txt doesn't match the version variable stored in this batch file, it means that update is available.
if %updateversion%==%version% set /a updateavailable=0

		title %string78% :-------   :

if %Update_Activate%==1 if %updateavailable%==1 set /a updateserver=2
if %Update_Activate%==1 if %updateavailable%==1 title %title%& goto update_notice

set /a maintenance_info=0
set /a maintenance_block=0

		title %string78% :--------- :

For /F "Delims=" %%A In ('call curl -f -L -s -S %useragent_curl% --insecure "%FilesHostedOn%/UPDATE/maintenance_info.txt"') do set "maintenance_info=%%A"
For /F "Delims=" %%A In ('call curl -f -L -s -S %useragent_curl% --insecure "%FilesHostedOn%/UPDATE/maintenance_block.txt"') do set "maintenance_block=%%A"

	title %title%

if "%maintenance_block%"=="1" goto maintenance_block
if "%maintenance_info%"=="1" goto maintenance_info


set /a errorwinxp=0
timeout -0 /nobreak >NUL || set /a errorwinxp=1

goto main_fade_out
:no_internet_connection
cls
echo %header%                                                                
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.
echo ---------------------------------------------------------------------------------------------------------------------------
echo    /---\   ERROR.
echo   /     \  There is no internet connection.
echo  /   ^^!   \ 
echo  --------- Could not connect to remote server.
echo            Check your internet connection or check if your firewall isn't blocking curl.
echo.
echo       Press any key to return to main menu.
echo ---------------------------------------------------------------------------------------------------------------------------
pause>NUL
goto begin_main
:server_dead
cls
echo %header%
echo -----------------------------------------------------------------------------------------------------------------------------
echo.
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.
echo ---------------------------------------------------------------------------------------------------------------------------
echo    /---\   Warning.
echo   /     \  RiiConnect24 Servers are currently offline.
echo  /   ^^!   \ 
echo  --------- It appears that you have an active Internet connection but RiiConnect24 Server is currently offline.
echo            Please come back later^^!
echo.
echo            Press any key to return to main menu.
echo ---------------------------------------------------------------------------------------------------------------------------
pause>NUL
goto begin_main
:maintenance_block
cls
echo %header%                                                                
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.
echo ---------------------------------------------------------------------------------------------------------------------------
echo    /---\   Warning.
echo   /     \  There is currently maintenance in progress on our servers.
echo  /   ^^!   \ 
echo  --------- Developer requested that access to the program will be prohibited until the maintenance is done.
echo            Please try again later.
echo.
echo            Press any key to return to main menu.
echo ---------------------------------------------------------------------------------------------------------------------------
pause>NUL
goto begin_main

:maintenance_info
cls
echo %header%                                                                
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.                 
echo.
echo ---------------------------------------------------------------------------------------------------------------------------
echo    /---\   Warning.
echo   /     \  There is currently background maintenance in progress on our servers.
echo  /   ^^!   \ 
echo  --------- Some functionality may be limited or not functioning until the maintenance is done.
echo.
echo            Press any key to continue.
echo ---------------------------------------------------------------------------------------------------------------------------
pause>NUL
goto main_fade_out

:main_fade_out
goto files_req_err
:update_notice
set /a update=1
cls
echo %header%
echo -----------------------------------------------------------------------------------------------------------------------------
echo.
echo              `..````
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+
echo ------------------------------------------------------------------------------------------------------------------------------
echo    /---\   An Update is available.
echo   /     \  An Update for this program is available. We suggest updating the WiiWare Patcher to the latest version.
echo  /   ^^!   \
echo  ---------  Current version: %version%
echo             New version: %updateversion%
echo                       1. Update                      2. Dismiss               3. What's new in this update?
echo ------------------------------------------------------------------------------------------------------------------------------
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`
echo                                   -odhhhhyddmmmmmNNmhs/:`
echo                                     :syhdyyyyso+/-`
set /p s=
if %s%==1 goto update_files
if %s%==2 goto files_req_err
if %s%==3 goto whatsnew
goto update_notice
:update_files
cls
cls
echo.
echo              `..````
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+
echo ------------------------------------------------------------------------------------------------------------------------------
echo    /---\   Updating.
echo   /     \  Please wait...
echo  /   !   \
echo  --------- WiiWare Patcher will restart shortly...
echo.
echo.
echo ------------------------------------------------------------------------------------------------------------------------------
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`
echo                                   -odhhhhyddmmmmmNNmhs/:`
echo                                     :syhdyyyyso+/-`
:update_1
curl -f -L -s -S %useragent_curl% --insecure "%FilesHostedOn_update_assistant%/UPDATE/update_assistant.bat" --output "update_assistant.bat"
	set temperrorlev=%errorlevel%
	if not %temperrorlev%==0 goto error_updating
start update_assistant.bat -WiiWare_Patcher
exit
:error_updating
cls
echo %header%
echo.                                                                       
echo              `..````                                                  
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd                
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+        
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN            
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd                 
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo ------------------------------------------------------------------------------------------------------------------------------
echo    /---\   ERROR.
echo   /     \  There was an error while downloading the update assistant.
echo  /   ^!   \ 
echo  --------- Press any key to return to main menu.
echo.  
echo.
echo ------------------------------------------------------------------------------------------------------------------------------
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys                  
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-                  
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm                     
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+                    
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm                    
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+                   
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm                   
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/    
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy   
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`   
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`        
echo                                   -odhhhhyddmmmmmNNmhs/:`             
echo                                     :syhdyyyyso+/-`
pause>NUL
goto begin_main
:whatsnew
cls
if not exist "%TempStorage%\whatsnew.txt" goto whatsnew_notexist
echo %header%
echo ------------------------------------------------------------------------------------------------------------------------------
echo.
echo What's new in update %updateversion%?
echo.
type "%TempStorage%\whatsnew.txt"
pause>NUL
goto update_notice
:whatsnew_notexist
cls
echo %header%
echo -----------------------------------------------------------------------------------------------------------------------------
echo.
echo What's new is not available right now.
echo.
echo Press any button to go back.
pause>NUL
goto update_notice
:files_req_err
cls
echo %header%
echo -----------------------------------------------------------------------------------------------------------------------------
echo.
echo Downloading files... give me a second.

if exist WiiWarePatcher rmdir /s /q WiiWarePatcher
md WiiWarePatcher
curl -f -L -s -S %useragent_curl% --insecure "%FilesHostedOn%/WiiWarePatcher/libWiiSharp.dll" --output "WiiWarePatcher/libWiiSharp.dll"
set /a temperrorlev=%errorlevel%
if not %temperrorlev%==0 goto files_download_error
echo 20%%
curl -f -L -s -S %useragent_curl% --insecure "%FilesHostedOn%/WiiWarePatcher/lzx.exe" --output "WiiWarePatcher/lzx.exe"
set /a temperrorlev=%errorlevel%
if not %temperrorlev%==0 goto files_download_error
echo 40%%
curl -f -L -s -S %useragent_curl% --insecure "%FilesHostedOn%/WiiWarePatcher/Sharpii.exe" --output "WiiWarePatcher/Sharpii.exe"
set /a temperrorlev=%errorlevel%
if not %temperrorlev%==0 goto files_download_error
echo 60%%
curl -f -L -s -S %useragent_curl% --insecure "%FilesHostedOn%/WiiWarePatcher/WadInstaller.dll" --output "WiiWarePatcher/WadInstaller.dll"
set /a temperrorlev=%errorlevel%
if not %temperrorlev%==0 goto files_download_error
echo 80%%
curl -f -L -s -S %useragent_curl% --insecure "%FilesHostedOn%/WiiWarePatcher/WiiWarePatcher.exe" --output "WiiWarePatcher/WiiWarePatcher.exe"
set /a temperrorlev=%errorlevel%
if not %temperrorlev%==0 goto files_download_error

goto choose_patch_type
:files_download_error
cls
echo %header%
echo -----------------------------------------------------------------------------------------------------------------------------
echo.
echo There was an error while downloading files needed by the WiiWare Patcher.
echo Please check your Internet connection and try again.
echo.
echo Press any key to continue.
pause>NUL
goto begin_main


:choose_patch_type
cls
echo %header%
echo -----------------------------------------------------------------------------------------------------------------------------
echo.
echo              `..````
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+
echo ------------------------------------------------------------------------------------------------------------------------------
echo     Please choose what you want to patch.
echo.
echo.
if %aio_assisted%==0 echo  1. I want to patch normal games.  2. I want to patch Wii Speak.
if %aio_assisted%==1 echo  1. I want to patch normal games.  2. I want to patch Wii Speak. 3. Return to RiiConnect24 Patcher
echo ------------------------------------------------------------------------------------------------------------------------------
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`
echo                                   -odhhhhyddmmmmmNNmhs/:`
echo                                     :syhdyyyyso+/-`
set /p s=
if %s%==1 goto letsbegin
if %s%==2 goto wii_speak_patch
if %aio_assisted%==1 if %s%==3 GOTO:EOF
goto choose_patch_type
:wii_speak_patch
set /a wii_speak_region=NUL
cls
echo.
echo              `..````
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+
echo ------------------------------------------------------------------------------------------------------------------------------
echo     Please choose your Wii Speak WAD region to download and patch.
echo.
echo.
echo  1. USA  2. PAL  3. JPN  4. KOR  5. Go back.
echo ------------------------------------------------------------------------------------------------------------------------------
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`
echo                                   -odhhhhyddmmmmmNNmhs/:`
echo                                     :syhdyyyyso+/-`
set /p s=
if %s%==5 goto choose_patch_type

if %s%==1 set regiontype_speak=0001000148434645
if %s%==1 set region=USA

if %s%==2 set regiontype_speak=0001000148434650
if %s%==2 set region=PAL

if %s%==3 set regiontype_speak=0001000148434645
if %s%==3 set region=JPN

if %s%==4 set regiontype_speak=000100014843464B
if %s%==4 set region=KOR

if not %regiontype_speak%==NUL goto wii_speak_patch_1

goto wii_speak_patch
:wii_speak_patch_1
cls
echo.
echo              `..````
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+
echo ------------------------------------------------------------------------------------------------------------------------------
echo     Please wait. We are now downloading and patching the Wii Speak Channel ;)...
echo.
echo.
echo.
echo ------------------------------------------------------------------------------------------------------------------------------
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`
echo                                   -odhhhhyddmmmmmNNmhs/:`
echo                                     :syhdyyyyso+/-`

WiiWarePatcher\Sharpii.exe NUSD -id %regiontype_speak% -v 512 -all >NUL
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching

move "%regiontype_speak%v512\%regiontype_speak%v512.wad" "Wii_Speak_Channel_%region%.wad" >NUL

rmdir /s /q %regiontype_speak%v512 >NUL

if %regiontype_speak%==NUL set /a temperrorlev=1
if %regiontype_speak%==NUL set /a modul=Variables mismatch
if %regiontype_speak%==NUL goto error_patching

goto letsbegin
:letsbegin_error
cls
echo %header%
echo ------------------------------------------------------------------------------------------------------------------------------
echo.
echo Let's begin.
echo.
echo In order to patch wad file, I need a wad file.
if %aio_assisted%==0 echo So, if you can, please copy any wad file to this directory where I am.
if %aio_assisted%==1 echo Please copy the .WAD file to WiiWare-Patcher folder that was made by RiiConnect24 Patcher.
echo.
if %rep%==1 if exist "*.wad" set /a cor=1
if %rep%==1 if exist "*.wad" goto letsbegin
if %rep%==1 echo Waiting for .wad files.
if %rep%==2 echo Waiting for .wad files..
if %rep%==3 echo Waiting for .wad files...
if %rep%==4 echo Waiting for .wad files....
if %rep%==4 set /a rep=0
set /a rep=%rep%+1
ping localhost -n 3 >NUL
goto letsbegin_error
:letsbegin
for %%f in ("*.wad") do set /a file_counter+=1
set /a repeat=1
set /a errorrep=0
set /a rep=0
cls

cls
echo %header%
echo ------------------------------------------------------------------------------------------------------------------------------
echo.
if %cor%==0 echo Let's begin.
if %cor%==1 echo Let's begin.
ping localhost -n 3 >NUL
if not exist "*.wad" goto letsbegin_error
echo.
set modul=NUL
set /a patching_file=1
rmdir temp /s /q

if not exist temp md temp
if not exist wiimmfi-wads md wiimmfi-wads
if not exist backup-wads md backup-wads

for %%f in ("*.wad") do (
cls
echo %header_loop%
echo ------------------------------------------------------------------------------------------------------------------------------
echo.
echo Patching file [!patching_file!] out of [%file_counter%]
echo File name: %%~nf
echo.
copy /b "%%f" backup-wads >NUL
set /a temperrorlev=%errorlevel%
set modul=copy.exe
if not %temperrorlev%==0 goto error_patching

WiiWarePatcher\Sharpii.exe WAD -u "%%f" temp >NUL
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching

move temp\00000001.app WiiWarePatcher\00000001.app >NUL
set /a temperrorlev=%errorlevel%
set modul=move.exe
if not %temperrorlev%==0 goto error_patching

cd WiiWarePatcher
call WiiWarePatcher.exe
set /a temperrorlev=%errorlevel%
cd ..
set modul=WiiWarePatcher.exe
if not %temperrorlev%==0 goto error_patching

move WiiWarePatcher\00000001.app temp\00000001.app >NUL
set /a temperrorlev=%errorlevel%
set modul=move.exe
if not %temperrorlev%==0 goto error_patching
del "%%f" >NUL
set /a temperrorlev=%errorlevel%
set modul=del.exe
if not %temperrorlev%==0 goto error_patching

WiiWarePatcher\Sharpii.exe WAD -p temp "wiimmfi-wads/%%f" >NUL
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching

set /a patching_file=%patching_file%+1

rmdir temp /s /q >NUL
)
cd wiimmfi-wads
for %%a in (*.wad) do ren "%%~a" "%%~na_Wiimmfi%%~xa" >NUL
cd..
goto end
:error_patching
cls
cls
echo.
echo              `..````
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+
echo ------------------------------------------------------------------------------------------------------------------------------
echo    /---\   ERROR.
echo   /     \  There was an error while patching.
echo  /   !   \ Error Code: %temperrorlev%
echo  --------- Failing module: %modul%
echo.
if %temperrorlev%==-532459699 echo Please check your internet connection.
if %temperrorlev%==-2146232576 echo Please install .NET Framework 3.5, then try to patch again.
if %temperrorlev%==-1073741515 echo Sharpii general failure. Try to install .NET Framework 3.5 and try again.
if %aio_assisted%==0 echo       Press any key to return to main menu.
if %aio_assisted%==1 echo       Press any key to return to RiiConnect24 Patcher.
echo ------------------------------------------------------------------------------------------------------------------------------
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`
echo                                   -odhhhhyddmmmmmNNmhs/:`
echo                                     :syhdyyyyso+/-`
pause>NUL
if %aio_assisted%==0 goto begin_main
if %aio_assisted%==1 GOTO:EOF
:end
if not exist "%appdata%\WiimmfiPatcher\ndlaunch.id" echo e >>"%appdata%\WiimmfiPatcher\ndlaunch.id"
set /a exiting=10
set /a timeouterror=1
timeout 1 /nobreak >NUL && set /a timeouterror=0
goto end1
:end1
rmdir /s /q WiiWarePatcher
cls
echo %header%
echo ------------------------------------------------------------------------------------------------------------------------------
echo.
if %patchingok%==1 echo Patched files are in wiimmfi-wads folder
if %patchingok%==1 echo Original wads are in backup-wads folder
if %patchingok%==1 echo.
echo All done^^! Press any key to exit.
pause>NUL
:end2
cls
echo %header%
echo ------------------------------------------------------------------------------------------------------------------------------
echo.

if %aio_assisted%==0 echo Exiting the patcher in...
if %aio_assisted%==1 echo Returning to RiiConnect24 Patcher in...

if %exiting%==10 echo :----------: 10
if %exiting%==9 echo :--------- : 9
if %exiting%==8 echo :--------  : 8
if %exiting%==7 echo :-------   : 7
if %exiting%==6 echo :------    : 6
if %exiting%==5 echo :-----     : 5
if %exiting%==4 echo :----      : 4
if %exiting%==3 echo :---       : 3
if %exiting%==2 echo :--        : 2
if %exiting%==1 echo :-         : 1
if %exiting%==0 echo :          :
if %exiting%==0 if %patchingok%==2 start "C:\Users\%username%\Desktop\WiiWarePatcher\"

if %aio_assisted%==0 if %exiting%==0 exit /b 0
if %aio_assisted%==1 if %exiting%==0 GOTO:EOF

if %timeouterror%==0 timeout 1 /nobreak >NUL
if %timeouterror%==1 ping localhost -n 2 >NUL
set /a exiting=%exiting%-1
goto end2
