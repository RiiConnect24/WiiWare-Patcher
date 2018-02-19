@echo off
if exist "C:\Users\%username%\Desktop\DebugPatcher.txt" goto debug_failsafe_begin
goto begin
:begin
if not exist "%appdata%\WiimmfiPatcher\temp\" md "%appdata%\WiimmfiPatcher\temp\"
set patchingok=1
set mode=126,35
mode %mode%
set /a cor=0
set /a patchingnumber=1
set /a repeatvbs=0
set /a temperrorlev=0
::
set last_build=2017/12/14
set at=2:25
:: ===========================================================================
:: WiiWare Patcher for Windows
set version=2.1.6
:: AUTHORS: KcrPL, Larsenv and PokeAcer
:: ***************************************************************************
:: Copyright (c) 2017 RiiConnect24, and its (Lead) Developers
:: ===========================================================================

if not exist "%appdata%\WiimmfiPatcher\temp\vbs.vbs" echo x=msgbox("Please click OK when the patching has finished.") >>"%appdata%\WiimmfiPatcher\temp\vbs.vbs"
@echo off
title Wiimmfi Patcher for WADs v.%version% Created by @KcrPL, @Larsenv, @PokeAcer
cls

set /a patherror=0
if "%cd%"=="%windir%\system32" set /a patherror=1
if %patherror%==0 if not exist "patcher.bat" set /a patherror=2

:: ### Auto Update ###
set /a WiiWarePatcher_Update_Activate=1
set /a whatsnew=1
set /a offlinestorage=0
set FilesHostedOn=https://raw.githubusercontent.com/KcrPL/KcrPL.github.io/master/Patchers_Auto_Update/WiiWare-Patcher
set MainFolder=%appdata%\WiiWare-Patcher
set TempStorage=%appdata%\WiiWare-Patcher\internet\temp


if exist temp.bat del temp.bat /q
goto begin_main
:begin_main
mode 126,40
cls
echo Wiimmfi WiiWarePatcher - (C) Larsenv, (C) KcrPL, (C) PokeAcer. v%version%. (Compiled on %last_build% at %at%)
if %WiiWarePatcher_Update_Activate%==1 if %patherror%==0 echo              `..````
if %WiiWarePatcher_Update_Activate%==1 if %patherror%==0 echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`
if %WiiWarePatcher_Update_Activate%==1 if %patherror%==0 echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs
if %WiiWarePatcher_Update_Activate%==1 if %patherror%==0 echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd

if %patherror%==1 echo :----------------------------------------------------------------:
if %patherror%==1 echo : Warning: Please run this application without admin privilages. :
if %patherror%==1 echo :----------------------------------------------------------------:

if %patherror%==2 echo :---------------------------------------------------------------------------------------------------------:
if %patherror%==2 echo : Warning: patcher.bat not found. You may be running this application from an unknown and untrusted source:
if %patherror%==2 echo :---------------------------------------------------------------------------------------------------------:

if %WiiWarePatcher_Update_Activate%==0 echo :------------------------------------------------------------------------------------------------------:
if %WiiWarePatcher_Update_Activate%==0 echo : Warning: Auto updates are disabled.                                                                  :
if %WiiWarePatcher_Update_Activate%==0 echo :------------------------------------------------------------------------------------------------------:

echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+    Wiimmfi WADs Patcher.
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN   Play Wii games online after Nintendo WFC shutdown!
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd    Press any button to continue
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+ 
echo             mmmmms smMMMMMMMMMmddMMmmNmNMMMMMMMMMMMM: 
echo            `mmmmmo hNMMMMMMMMMmddNMMMNNMMMMMMMMMMMMM.  Please mail us at support@riiconnect24.net if
echo            -mmmmm/ dNMMMMMMMMMNmddMMMNdhdMMMMMMMMMMN   you encounter any problems while patching.
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
:startup_script
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

if %offlinestorage%==0 if exist "%TempStorage%\version.txt" del "%TempStorage%\version.txt" /q
if %offlinestorage%==0 if exist "%TempStorage%\version.txt`" del "%TempStorage%\version.txt`" /q
if %offlinestorage%==0 if exist "%TempStorage%\whatsnew.txt" del "%TempStorage%\whatsnew.txt" /q
if %offlinestorage%==0 if exist "%TempStorage%\whatsnew.txt`" del "%TempStorage%\whatsnew.txt`" /q

if not exist "%TempStorage%" md "%TempStorage%"	
if %WiiWarePatcher_Update_Activate%==1 if %offlinestorage%==0 call powershell -command "(new-object System.Net.WebClient).DownloadFile('"%FilesHostedOn%/whatsnew.txt"', '"%TempStorage%/whatsnew.txt"')"
if %WiiWarePatcher_Update_Activate%==1 if %offlinestorage%==0 call powershell -command "(new-object System.Net.WebClient).DownloadFile('"%FilesHostedOn%/version.txt"', '"%TempStorage%/version.txt"')"

	if %offlinestorage%==0 set /a temperrorlev=%errorlevel%

set /a updateserver=1
	::Bind error codes to errors here
	if %offlinestorage%==0 if not %errorlevel%==0 set /a updateserver=0


if exist "%TempStorage%\version.txt`" ren "%TempStorage%\version.txt`" "version.txt"
if exist "%TempStorage%\whatsnew.txt`" ren "%TempStorage%\whatsnew.txt`" "whatsnew.txt"

if exist "%TempStorage%\version.txt" set /p updateversion=<"%TempStorage%\version.txt"
if not exist "%TempStorage%\version.txt" set /a updateavailable=0
if %WiiWarePatcher_Update_Activate%==1 if exist "%TempStorage%\version.txt" set /a updateavailable=1
if %updateversion%==%version% set /a updateavailable=0

if %WiiWarePatcher_Update_Activate%==1 if %updateavailable%==1 set /a updateserver=2
if %WiiWarePatcher_Update_Activate%==1 if %updateavailable%==1 goto update_notice

if not exist Sharpii.exe goto files_req_err
if not exist libWiiSharp.dll goto files_req_err
if not exist lzx.exe goto files_req_err
if not exist WadInstaller.dll goto files_req_err
if not exist WiiwarePatcher.exe goto files_req_err

set /a errorwinxp=0
timeout -0 /nobreak >NUL || set /a errorwinxp=1
if %errorwinxp%==1 goto winxp_notice

goto main_fade_out
:main_fade_out
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
echo.
ping localhost -n 3 >NUL
goto choose_patch_type
:update_notice
set /a update=1
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
echo    /---\   An Update is available.
echo   /     \  An Update for this program is available. We suggest updating the WiiWare Patcher to the latest version.
echo  /   !   \
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
if %s%==2 goto choose_patch_type
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
if exist WadInstaller.dll` del WadInstaller.dll` /q 2> nul
if exist WiiwarePatcher.exe` del wget.exe` /q 2> nul
if exist lzx.exe` del xdelta3.exe` 2> nul
if exist patcher.bat` del patch.bat` /q 2> nul
if exist libWiiSharp.dll` del  libWiiSharp.dll` /q 2> nul
if exist Sharpii.exe` del Sharpii.exe` /q 2> nul

call powershell -command "(new-object System.Net.WebClient).DownloadFile('"%FilesHostedOn%/WadInstaller.dll"', '"WadInstaller.dll`"')"
call powershell -command "(new-object System.Net.WebClient).DownloadFile('"%FilesHostedOn%/WiiwarePatcher.exe"', '"WiiwarePatcher.exe`"')"
call powershell -command "(new-object System.Net.WebClient).DownloadFile('"%FilesHostedOn%/lzx.exe"', '"lzx.exe`"')"
call powershell -command "(new-object System.Net.WebClient).DownloadFile('"%FilesHostedOn%/patcher.bat"', '"patcher.bat`"')"
call powershell -command "(new-object System.Net.WebClient).DownloadFile('"%FilesHostedOn%/libWiiSharp.dll"', '"libWiiSharp.dll`"')"
call powershell -command "(new-object System.Net.WebClient).DownloadFile('"%FilesHostedOn%/Sharpii.exe"', '"Sharpii.exe`"')"

if %update%==1 if not exist WadInstaller.dll` goto error_update_not_available
if %update%==1 if not exist WiiwarePatcher.exe` goto error_update_not_available
if %update%==1 if not exist lzx.exe` goto error_update_not_available
if %update%==1 if not exist patcher.bat` goto error_update_not_available
if %update%==1 if not exist libWiiSharp.dll` goto error_update_not_available
if %update%==1 if not exist Sharpii.exe` goto error_update_not_available

if exist WadInstaller.dll del WadInstaller.dll /q
if exist WiiwarePatcher.exe del WiiwarePatcher.exe /q
if exist lzx.exe del lzx.exe /q
if exist libWiiSharp.dll del libWiiSharp.dll /q
if exist Sharpii.exe del Sharpii.exe /q

ren WadInstaller.dll` WadInstaller.dll
ren WiiwarePatcher.exe` WiiwarePatcher.exe
ren lzx.exe` lzx.exe
ren libWiiSharp.dll` libWiiSharp.dll
ren Sharpii.exe` Sharpii.exe

echo echo off >>temp.bat
echo ping localhost -n 2^>NUL >>temp.bat
echo del patcher.bat /q >>temp.bat
echo ren patcher.bat` patcher.bat >>temp.bat
echo start patcher.bat >>temp.bat
echo exit >>temp.bat
start temp.bat
exit
exit
exit
:whatsnew
cls
if not exist "%TempStorage%\whatsnew.txt" goto whatsnew_notexist
echo Wiimmfi WiiWarePatcher - (C) Larsenv, (C) KcrPL, (C) PokeAcer. v%version%. (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------
echo.
echo What's new in update %updateversion%?
echo.
type "%TempStorage%\whatsnew.txt"
pause>NUL
goto update_notice
:whatsnew_notexist
cls
echo Wiimmfi WiiWarePatcher - (C) Larsenv, (C) KcrPL, (C) PokeAcer. v%version%. (Compiled on %last_build% at %at%)
echo -----------------------------------------------------------------------------------------------------------------------------
echo.
echo What's new is not available right now.
echo.
echo Press any button to go back.
pause>NUL
goto update_notice

:debug_failsafe_begin
echo initiating debug
set output=No output
set debug=1
@echo off
cls
goto debug_1
:debug_1
cls
echo Wiimmfi WAD Patcher debug menu
echo @Larsenv, @PokeAcer, @KcrPL
echo.
echo --- Output ---
echo %output%
echo --------------
echo.
echo 1. Reset program
echo 2. Reset database
echo 3. Delete patched files
echo 4. exit
echo 5. open command prompt
echo 6. Files check
echo 7. Check for program compatibility on this computer
echo.
set /p s=Choose:
if %s%==1 goto begin
if %s%==2 goto debug_reset_database
if %s%==3 goto debug_patched_Del
if %s%==4 exit
if %s%==5 goto debug_cmd
if %s%==6 goto debug_file_check
if %s%==7 goto debug_check_comp
set output=command_Not_recognized
goto debug_1
:debug_reset_database
cls
echo Executing command...
rmdir "%appdata%\WiimmfiPatcher" /s /q
if not exist "%appdata%\WiimmfiPatcher" set output=OK! It seems that the database is deleted, try restarting this program.
if exist "%appdata%\WiimmfiPatcher" set output=FAIL! The Database has not been deleted.
goto debug_1
:debug_patched_Del
cls
echo Executing command...
rmdir "backup-wads" /s /q
rmdir "wiimmfi-wads" /s /q
set output=OK! 2 folders have been deleted.
goto debug_1
:debug_cmd
cls
echo Type "exit" to return to debug menu
echo :---------------------------------------:
cmd
goto debug_1
:debug_file_check
cls
echo Executing command...
set exist=1
if not exist Sharpii.exe set exist=0
if not exist libWiiSharp.dll set exist=0
if not exist lzx.exe set exist=0
if not exist WadInstaller.dll set exist=0
if not exist WiiwarePatcher.exe set exist=0
if %exist%==0 set output=FAIL! Files are corrupted. Redownload the package.
if %exist%==1 set output=OK! All files seem to be in their corresponding places.
goto debug_1
:debug_check_comp
cls
echo Executing command...
set check=1
timeout 3 /nobreak >NUL || set check=0
if %check%==1 set output=OK! Program will work correctly
if %check%==0 set output=FAIL! Legacy PC found, some commands may not work correctly, but the program will still work and do its job.
goto debug_1
:files_req_err
set /a update=0
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
echo   /     \  Some files needed to run this program weren't found.
echo  /   !   \ Press any button to download these files.
echo  ---------
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
pause>NUL
goto update_files
:ndstart
cls
echo Hi.
ping localhost -n 3 >NUL
goto intro2_frs2
:firststart
cls
goto firststart
:choose_patch_type
cls
echo.
echo :===========================================================:
echo : WiiWare Patcher Update System.                            :
if %updateserver%==1 echo : The latest version is installed. Press C to read more.    :
if %updateserver%==2 echo : An Update is available. Press C to read more.             :
if %updateserver%==0 echo : The Update Server is not available. Press C to read more. :
echo :===========================================================:
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.
	echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+
echo ------------------------------------------------------------------------------------------------------------------------------
echo     Please choose what you want to patch.
echo.
echo.
echo  1. I want to patch normal games.  2. I want to patch Wii Speak.
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
if %s%==c goto more_info_update
if %s%==C goto more_info_update
goto choose_patch_type
:more_info_update
cls
echo Wiimmfi WiiWarePatcher - (C) Larsenv, (C) KcrPL, (C) PokeAcer. v%version%. (Compiled on %last_build% at %at%)
echo.
if %updateserver%==1 echo The latest version of WiiWare Patcher is now installed. (v%version%)
if %updateserver%==2 goto update_notice

if %updateserver%==0 echo Update server is not available.
if %updateserver%==0 echo We could not connect to the update server. Please check your internet connection. 
if %updateserver%==0 echo This could also mean that the server is undergoing maintenance at the moment.
pause>NUL
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
echo     Please choose the Wii Speak WAD region to download and patch.
echo.
echo.
echo     1. USA  2. PAL  3. JPN  4. KOR  5. Go back.
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
echo     Please wait... We are now downloading and patching the Wii Speak Channel ;)
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

sharpii NUSD -id %regiontype_speak% -v 512 -all >NUL

move "%regiontype_speak%v512\%regiontype_speak%v512.wad" "Wii_Speak_Channel_%region%.wad" >NUL

rmdir /s /q %regiontype_speak%v512 >NUL

if %regiontype_speak%==NUL set /a temperrorlev=1
if %regiontype_speak%==NUL set /a modul=Variables mismatch
if %regiontype_speak%==NUL goto error_patching

goto letsbegin
:letsbegin_error
cls
echo.
echo Wiimmfi WiiWarePatcher - (C) Larsenv, (C) KcrPL, (C) PokeAcer. v%version%. Compiled on %last_build% at %at%
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo Let's begin.
echo.
echo In order to patch a wad file, I will need one first.
echo Please copy it to the location where I am.
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
echo.
echo Wiimmfi WiiWarePatcher - (C) Larsenv, (C) KcrPL, (C) PokeAcer. v%version%. Compiled on %last_build% at %at%
echo ------------------------------------------------------------------------------------------------------------------------
echo.
if %cor%==0 echo Let's begin.
if %cor%==1 echo Let's begin.
ping localhost -n 3 >NUL
if not exist "*.wad" goto letsbegin_error
echo.
set modul=NUL
rmdir temp /s /q

if not exist temp md temp
if not exist wiimmfi-wads md wiimmfi-wads
if not exist backup-wads md backup-wads

for %%f in ("*.wad") do (
cls
echo Wiimmfi WiiWarePatcher - Larsenv, KcrPL, PokeAcer. v%version%. Compiled on %last_build% at %at%
echo ------------------------------------------------------------------------------------------------------------------------

echo.
echo File to patch:              %%~nf
echo Amount of files to patch:   %file_counter%
echo.
copy /b "%%f" backup-wads >NUL
set /a temperrorlev=%errorlevel%
set modul=copy.exe
if not %temperrorlev%==0 goto error_patching

Sharpii.exe WAD -u "%%f" temp >NUL
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching

move temp\00000001.app 00000001.app >NUL
set /a temperrorlev=%errorlevel%
set modul=move.exe
if not %temperrorlev%==0 goto error_patching

if %repeatvbs%==0 start %appdata%\WiimmfiPatcher\temp\vbs.vbs
set patchdebug=%%~nf
WiiWarePatcher.exe
set /a temperrorlev=%errorlevel%
set modul=WiiWarePatcher.exe
if not %temperrorlev%==0 goto error_patching

move 00000001.app temp\00000001.app >NUL
set /a temperrorlev=%errorlevel%
set modul=move.exe
if not %temperrorlev%==0 goto error_patching

del "%%f"
set /a temperrorlev=%errorlevel%
set modul=del.exe
if not %temperrorlev%==0 goto error_patching

Sharpii.exe WAD -p temp "wiimmfi-wads/%%f"
set /a temperrorlev=%errorlevel%
set modul=Sharpii.exe
if not %temperrorlev%==0 goto error_patching

rmdir temp /s /q
set /a repeatvbs=1
)
cd wiimmfi-wads
for %%a in (*.wad) do ren "%%~a" "%%~na_Wiimmfi%%~xa"
cd wiimmfi-wads
cd..
pause
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
echo ---------------------------------------------------------------------------------------------------------------------------
echo    /---\   ERROR.
echo   /     \  There was an error while patching.
echo  /   !   \ Error Code: %temperrorlev%
echo  --------- Failing module: %modul%
echo.
if not %temperrorlev%==-532459699 echo.
if %temperrorlev%==-532459699 echo  Please check your internet connection.
echo       Press any key to retry.
echo ---------------------------------------------------------------------------------------------------------------------------
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
:end
if not exist "%appdata%\WiimmfiPatcher\ndlaunch.id" echo e >>"%appdata%\WiimmfiPatcher\ndlaunch.id"
set /a exiting=10
set /a timeouterror=1
timeout 1 /nobreak >NUL && set /a timeouterror=0
goto end1
:end1
cls
cls
echo.
echo Wiimmfi WiiWarePatcher - (C) Larsenv, (C) KcrPL, (C) PokeAcer. v%version%. Compiled on %last_build% at %at%
echo ------------------------------------------------------------------------------------------------------------------------
echo.
if %patchingok%==1 echo The patched files should be in the "wiimmfi-wads" folder.
if %patchingok%==1 echo Backed up wads are in the "backup-wads" folder.
if %patchingok%==1 echo.
echo Exiting the patcher in...
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
if %exiting%==0 exit
if %timeouterror%==0 timeout 1 /nobreak >NUL
if %timeouterror%==1 ping localhost -n 2 >NUL
set /a exiting=%exiting%-1
goto end1
