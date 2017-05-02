set language=NotDefined
if exist C:\Users\%username%\Desktop\DebugPatcher.txt goto debug_failsafe_begin
goto begin
:begin
set dragandrop_func=0

set patchingok=1
set version=1.0
set /a beta=0
if not exist %appdata%\WiimmfiPatcher\temp\ md %appdata%\WiimmfiPatcher\temp\
set /a cor=0
set /a patchingnumber=1
set /a repeatvbs=0
if not exist %appdata%\WiimmfiPatcher\temp\vbs.vbs echo x=msgbox("When the operation will be done, click any button." ,64, "Wiimmfi WAD Patcher") >>%appdata%\WiimmfiPatcher\temp\vbs.vbs
@echo off
title Wiimmfi Patcher for WAD's
cls

if not exist %appdata%\WiimmfiPatcher\tempfil md %appdata%\WiimmfiPatcher\tempfil >NUL
if not exist %appdata%\WiimmfiPatcher\tempfil\Sharpii.exe copy Sharpii.exe %appdata%\WiimmfiPatcher\tempfil >NUL
if not exist %appdata%\WiimmfiPatcher\tempfil\libWiiSharp.dll copy libWiiSharp.dll %appdata%\WiimmfiPatcher\tempfil >NUL
if not exist %appdata%\WiimmfiPatcher\tempfil\lzx.exe copy lzx.exe %appdata%\WiimmfiPatcher\tempfil >NUL
if not exist %appdata%\WiimmfiPatcher\tempfil\WadInstaller.dll copy WadInstaller.dll %appdata%\WiimmfiPatcher\tempfil >NUL
if not exist %appdata%\WiimmfiPatcher\tempfil\WiiwarePatcher.exe copy WiiwarePatcher.exe %appdata%\WiimmfiPatcher\tempfil >NUL

if not "%~1"=="" copy "%~1" %appdata%\WiimmfiPatcher\tempfil\
if not "%~1"=="" cd %appdata%\WiimmfiPatcher\tempfil

if %language%==NotDefined goto set_language

if not exist Sharpii.exe goto files_req_err
if not exist libWiiSharp.dll goto files_req_err
if not exist lzx.exe goto files_req_err
if not exist WadInstaller.dll goto files_req_err
if not exist WiiwarePatcher.exe goto files_req_err

if not exist %appdata%\WiimmfiPatcher md %appdata%\WiimmfiPatcher
if not exist %appdata%\WiimmfiPatcher\firststart.id goto firststart
if exist %appdata%\WiimmfiPatcher\firststart.id goto letsbegin
if exist %appdata%\WiimmfiPatcher\ndlaunch.id goto ndstart
goto firststart
:set_language
cls
echo Wiimmfi patcher
echo ------------------------------
echo @Larsenv, @PokeAcer, @KcrPL
echo Please select your language.
echo.
echo 1. English (Author: KcrPL)
echo 2. Polish (Author: KcrPL)
echo 3. Deutsch (Author: TimNook)
echo 4. French (Author: iDroid)

set /p s=Choose: 
if %s%==1 goto set_language_eng
if %s%==2 goto set_language_pol
if %s%==3 goto set_language_deu
if %s%==4 goto set_language_fr
goto set_language
:set_language_fr
set text1=Il y a eu une erreur durant l'execution du programme
set text2=Un des fichiers necessaires pour executer le programme n'a pas ete trouve
set text3=Appuyer sur n'importe quelle touche pour terminer le programme
set text4=Commencons
set text10=Il y a eu une erreur durant le patch des fichiers.
set text13=Fermeture du patcher...

set text5=En fait, vous savez. Commencons par ceci, afin de patcher un WAD, j'ai besoin du fichier WAD
set text6=Donc, si vous pouviez s'il vous plait copier le fichier WAD à patcher dans le dossier ou je suis.

set text7=En attente d'un fichier WAD

set text8=Patchage des fichiers...
set text9=Nombre de fichiers:

set text10=Le patchage est termine.
set text11=Les fichiers patches se trouvent dans le dossier wiimmfi-wads
set text12=Les fichiers originaux se trouvent dans le dossier backup-wads

set language=1
goto begin
:set_language_deu
set text1=Es gab einen Fehler während das Programm ausgeführt wurde
set text2=Einige Dateien die das Programm braucht um zu funktionieren wurden nicht gefunden
set text3=Drücke irgendeinen Knopf um das Programm zu schließen.
set text4=Lass uns loslegen.
set text10=Es gab einen Fehler während die Dateien gepatcht wurden.
set text13=Schließe den Patcher in...

set text5=Lass uns loslegen. Damit ich eine wad-Datei patchen kann brauche ich eine wad-Datei!
set text6=Konntest du bitte jede wad-Datei in den selben Ordner verschieben wo ich auch bin.

set text7=Warte auf die .wad Dateien

set text8=Patche Datei:
set text9=Gesamtmenge der Dateien:

set text10=Alle Dateien wurden gepatcht!.
set text11=Die gepatchten Dateien sind im "wiimmfi-wads" Ordner
set text12=Die archivierten .wad Dateien sind im "backup-wads" Ordner


set language=1
goto begin
:set_language_pol
set text1=Podczas korzystania z programu wystapil blad
set text2=Kilka plikow potrzebnych do uruchomienia programu nie zostalo znalezionych
set text3=Nacisnij dowolny przycisk aby zamknac program.
set text4=Zacznijmy.
set text10=Wystapil blad podczas patchowania plikow.
set text13=Zamykanie patchera za...

set text5=Zacznijmy od tego, zeby zaczac patchowac pliki .wad - potrzebuje pliku .wad
set text6=Wiec jezeli mozesz, skopiuj jakis plik .wad do folderu w ktorym jestem

set text7=Oczekiwanie na plik .wad

set text8=Patchowanie pliku:
set text9=Laczna liczba plikow:

set text10=Patchowanie przebieglo sukcesem.
set text11=Zpatchowane pliki sa w folderze "wiimmfi-wads"
set text12=Kopia zapasowa plikow .wad jest w folderze "backup-wads"

set language=1
goto begin
:set_language_eng
cls
set text1=There was an error while running the program
set text2=Some of the files needed to run this program were not found
set text3=Click any button to close the program.
set text4=Let's begin.
set text10=There was an error while patching the files.
set text13=Exiting the patcher in...

set text5=Actually, you know. Let's begin from that, in order to patch wad file, I need an wad file
set text6=So, if you can please copy any wad file to this directory where I am.

set text7=Waiting for .wad files

set text8=Patching file:
set text9=Total amount of files:

set text10=Patching is done.
set text11=Patched files are in wiimmfi-wads folder
set text12=Backed up wads are in backup-wads folder



set language=1
goto begin


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
rmdir %appdata%\WiimmfiPatcher /s /q
set output=OK! It seems that database is deleted, try restarting this program.
goto debug_1
:debug_patched_Del
cls
echo Executing command...
rmdir backup-wads /s /q
rmdir wiimmfi-wads /s /q
set output=OK! It seems that 2 folders has been deleted
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
if %exist%==1 set output=OK! It seems that every file is in it's place.
goto debug_1
:debug_check_comp
cls
echo Wait... Executing command
set check=1
timeout 3 /nobreak >NUL || set check=0 

if %check%==1 set output=OK! Program will work correctly
if %check%==0 set output=FAIL! Legacy PC found, some commands may not work correct but the program will work and do it's job.
goto debug_1 
:files_req_err
cls
echo Wiimmfi patcher
echo ------------------------------
echo @Larsenv, @PokeAcer, @KcrPL
echo.
echo :------------------------------------------------------------:
echo  %text1%
echo  %text2%
echo   ERROR CODE: 333 -  req failed
echo :------------------------------------------------------------:
echo %text3%
pause>NUL
set patchingok=0
goto end
:ndstart
cls
echo Hi.
ping localhost -n 3 >NUL
goto intro2_frs2
:firststart
cls
ping localhost -n 2 >NUL
echo H
ping localhost -n 1 >NUL
cls
echo Hi
ping localhost -n 1 >NUL
cls
echo Hi.
ping localhost -n 3 >NUL
cls
echo Hi.
echo Th
ping localhost -n 1 >NUL
cls
echo Hi.
echo Than
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks f
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for 
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for ch
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for chec
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checki
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wi
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiim
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/Ri
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiC
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiCon
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConne
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
ping localhost -n 2 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo Th
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This pa
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patc
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patche
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is 
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is fo
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for p
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patc
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patchi
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WA
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Fi
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD File
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to ma
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make th
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them s
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them sup
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them suppor
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them support
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them support Wi
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them support Wii
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them support Wiimm
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them support Wiimmfi
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them support Wiimmfi se
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them support Wiimmfi ser
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them support Wiimmfi serve
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them support Wiimmfi servers
ping localhost -n 1 >NUL
cls
echo Hi.
echo Thanks for checking out Wiimmfi/RiiConnect24
echo. 
echo This patcher is for patching WAD Files to make them support Wiimmfi servers.
ping localhost -n 4 >NUL
goto intro2_frs2
:intro2_frs2
cls
echo.
echo.
echo.
echo This patcher is for patching WAD files to make them support Wiimmfi servers.
ping localhost -n 1 >NUL
cls
echo @Larsenv, @PokeAcer, @KcrPL
echo.
echo.
echo This patcher is for patching WAD files to make them support Wiimmfi servers.
ping localhost -n 1 >NUL
cls
echo ------------------------------
echo @Larsenv, @PokeAcer, @KcrPL
echo.
echo This patcher is for patching WAD files to make them support Wiimmfi servers.
ping localhost -n 1 >NUL
cls
echo Wiimmfi patcher
echo ------------------------------
echo @Larsenv, @PokeAcer, @KcrPL
echo.
echo %text4%
ping localhost -n 4 >NUL
echo 3e >>%appdata%\WiimmfiPatcher\firststart.id
goto letsbegin
:letsbegin_error
cls
if %beta%==1 echo THIS IS NOT OFFICIAL RELEASE YET, SOME THING MIGHT BE BUGED. BETA VERSION %VERSION%
echo Wiimmfi patcher
echo ------------------------------
echo @Larsenv, @PokeAcer, @KcrPL
echo.
echo %text4%
echo.
echo %text5%
echo %text6%
echo.
if %rep%==1 if exist *.wad set /a cor=1
if %rep%==1 if exist *.wad goto letsbegin
if %rep%==1 echo %text7%.
if %rep%==2 echo %text7%..
if %rep%==3 echo %text7%...
if %rep%==4 echo %text7%....
if %rep%==4 set /a rep=0
set /a rep=%rep%+1
ping localhost -n 3 >NUL
goto letsbegin_error
:dragandropinstall
rem ### This part of code is abandoned ###
rem ### ERROR - DEBUG - not working
cls
copy "%~1" %appdata%\WiimmfiPatcher\tempfil\ >NUL
cd %appdata%\WiimmfiPatcher\tempfil\
if exist backup-wads rmdir backup-wads /s /q
if exist wiimmfi-wads rmdir wiimmfi-wads /s /q
if exist temp rmdir temp /s /q
echo Wiimmfi patcher
echo ------------------------------
echo @Larsenv, @PokeAcer, @KcrPL
echo.
echo Patching file: %~1
if not exist temp md temp
if not exist wiimmfi-wads md wiimmfi-wads
if not exist backup-wads md backup-wads
Sharpii.exe WAD -u "%~1" temp >NUL
move temp\00000001.app 00000001.app >NUL
set patchdebug=%~1
WiiWarePatcher.exe || goto error_ok
move 00000001.app temp\00000001.app >NUL
if not exist "C:\Users\%username%\Desktop\WiiWarePatcher\" md "C:\Users\%username%\Desktop\WiiWarePatcher\"
if not exist "C:\Users\%username%\Desktop\WiiWarePatcher\backup-wads" md "C:\Users\%username%\Desktop\WiiWarePatcher\backup-wads"
if not exist "C:\Users\%username%\Desktop\WiiWarePatcher\wiimmfi-wads" md "C:\Users\%username%\Desktop\WiiWarePatcher\wiimmfi-wads"
copy "%~1" "C:\Users\%username%\Desktop\WiiWarePatcher\backup-wads\"
Sharpii.exe WAD -p temp "wiimmfi-wads\%~1"
pause
rmdir temp /s /q
pause
copy "wiimmfi-wads\%~1" "C:\Users\%username%\Desktop\WiiWarePatcher\wiimmfi-wads
pause
copy "%~1" "C:\Users\%username%\Desktop\WiiWarePatcher\backup-wads
set patchingok=2
pause
goto end
:letsbegin
rem DRAG AN DROP - warning, abandoned
if %dragandrop_func%==1 if not "%~1"=="" goto dragandropinstall
rem ##########
for %%f in ("*.wad") do set /a file_counter+=1
set /a repeat=1
set /a errorrep=0
set /a rep=0
cls
if %beta%==1 echo THIS IS NOT OFFICIAL RELEASE YET, SOME THING MIGHT BE BUGED. BETA VERSION %VERSION%
echo Wiimmfi patcher
echo ------------------------------
echo @Larsenv, @PokeAcer, @KcrPL
echo.
if %cor%==0 echo %text4%
if %cor%==1 echo %text4%
ping localhost -n 3 >NUL
if not exist *.wad goto letsbegin_error
echo.

rmdir temp /s /q
if not exist temp md temp
if not exist wiimmfi-wads md wiimmfi-wads
if not exist backup-wads md backup-wads
for %%f in ("*.wad") do (
cls
if %beta%==1 echo THIS IS NOT OFFICIAL RELEASE YET, SOME THING MIGHT BE BUGED. BETA VERSION %VERSION%
echo Wiimmfi patcher
echo ------------------------------
echo @Larsenv, @PokeAcer, @KcrPL
echo.
echo %text8%: %%~nf
echo %text9%: %file_counter%
echo.
copy /b "%%f" backup-wads >NUL
Sharpii.exe WAD -u "%%f" temp >NUL
move temp\00000001.app 00000001.app >NUL

if %repeatvbs%==0 start %appdata%\WiimmfiPatcher\temp\vbs.vbs
set patchdebug=%%~nf
WiiWarePatcher.exe || goto error_ok
move 00000001.app temp\00000001.app >NUL 
del "%%f"
Sharpii.exe WAD -p temp "wiimmfi-wads/%%f"
rmdir temp /s /q

set /a repeatvbs=1
)
goto end
:error_ok
cls
echo Wiimmfi patcher
echo ------------------------------
echo @Larsenv, @PokeAcer, @KcrPL
echo.
echo :------------------------------------------:
echo   %text10% 
echo   ERROR CODE: 404 -  %patchdebug%
echo :------------------------------------------:
echo %text3%
pause>NUL
set patchingok=0
goto end
:end
if not exist %appdata%\WiimmfiPatcher\ndlaunch.id echo e >>%appdata%\WiimmfiPatcher\ndlaunch.id
set /a exiting=10
set /a timeouterror=1
timeout 1 /nobreak >NUL && set /a timeouterror=0
:end1
cls
if %beta%==1 echo THIS IS NOT OFFICIAL RELEASE YET, SOME THING MIGHT BE BUGED. BETA VERSION %VERSION%
echo Wiimmfi patcher
echo ------------------------------
echo @Larsenv, @PokeAcer, @KcrPL
echo.
if %patchingok%==1 echo %text10%
if %patchingok%==1 echo.
if %patchingok%==1 echo %text11%
if %patchingok%==1 echo %text12%
if %patchingok%==1 echo.

if %patchingok%==2 echo Patching is done.
if %patchingok%==2 echo Pached files are on your Desktop in folder WiiWarePatcher.
echo %text13%
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
