@echo off
mode 120,30
chcp 65001
set language=NotDefined
if exist C:\Users\%username%\Desktop\DebugPatcher.txt goto debug_failsafe_begin
goto begin
:begin
set patchingok=1
if not exist %appdata%\WiimmfiPatcher\temp\ md %appdata%\WiimmfiPatcher\temp\
set /a cor=0
set /a patchingnumber=1
set /a repeatvbs=0
if not exist %appdata%\WiimmfiPatcher\temp\vbs.vbs echo x=msgbox("When the operation will be done, click any button." ,64, "Wiimmfi WAD Patcher") >>%appdata%\WiimmfiPatcher\temp\vbs.vbs
@echo off
title Wiimmfi Patcher for WAD's
cls

if %language%==NotDefined goto set_language

if not exist Sharpii.exe goto files_req_err
if not exist libWiiSharp.dll goto files_req_err
if not exist lzx.exe goto files_req_err
if not exist WadInstaller.dll goto files_req_err
if not exist WiiwarePatcher.exe goto files_req_err

if not exist %appdata%\WiimmfiPatcher md %appdata%\WiimmfiPatcher
if not exist %appdata%\WiimmfiPatcher\firststart.id goto letsbegin
if exist %appdata%\WiimmfiPatcher\firststart.id goto letsbegin
if exist %appdata%\WiimmfiPatcher\ndlaunch.id goto letsbegin
goto firststart
:set_language
cls
cls
echo.
echo                                      WiiWarePatcher - @KcrPL, @PokeAcer, @Larsenv
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo Please select your language.
echo.
echo 1. English (Author: KcrPL) (Correction: Seriel)
echo 2. Polish (Author: KcrPL)
echo 3. Deutsch (Author: TimNook)
echo 4. French (Author: iDroid)
echo 5. Italian (Author: GameCube)
echo 6. Spanish (Author: Artuto)
echo 7. Portuguese (Author: Rafael)
echo.
set /p s=Choose: 
if %s%==1 goto set_language_eng
if %s%==2 goto set_language_pol
if %s%==3 goto set_language_deu
if %s%==4 goto set_language_fr
if %s%==5 goto set_language_it
if %s%==6 goto set_language_es
if %s%==7 goto set_language_braz
goto set_language
:set_language_braz
set text1=Ocorreu um erro enquanto abriamos o programa
set text2=Alguns dos arquivos necessários para o programa, não foram encontrados.
set text3=Clique em qualquer botão para fechar o programa.
set text4=Vamos começar.
set text10=Ocorreu um erro durante o patch dos arquivos.
set text13=Saindo do patcher em...
set text5=Agora, você sabe. Vamos começar com aquilo, em ordem para o patch do arquivo wad, eu preciso do arquivo wad
set text6=Então se você puder copiar o arquivo wad para a pasta aonde estou.
set text7=Esperando pelos arquivos .wad
set text8=Patch do arquivo em progresso:
set text9=Total de arquivos:
set text10=Patching foi finalizado.
set text11=Arquivos com Patch estão na pasta wiimmfi-wads 
set text12=Os arquivos originais estão na pasta backup-wads 

set language=1
goto begin
:set_language_es
set text1=Ha occurido un problema al ejecutar este programa.
set text2=Algunos de los archivos necesarios para ejecutar este programa no se han encontrado.
set text3=Presiona cualquier tecla para cerrar el programa.
set text4=Empecemos.
set text10=Ha ocurrido un problema al parchear los archivos.
set text13=Cerrando el parcheador...
set text5=No se si lo sepas, pero para parchear el archivo WAD, necesito un archivo WAD...
set text6=Entonces, puedes copiar un WAD a mi carpeta?.
set text7=Esperando por archivos .wad
set text8=Parcheando archivo:
set text9=Cantidad total de archivos:
set text10=Parcheo completado.
set text11=Los WADs parcheados estan en la carpeta "wiimmfi-wads"
set text12=Las copias de seguridad estan en la carpeta "backup-wads"

set language=1
goto begin
:set_language_it
set text1=Si e verificato un errore durante l'esecuzione del programma
set text2=Alcuni dei file necessari per eseguire questo programma non sono stati trovati
set text3=Fare clic su qualsiasi pulsante per chiudere questo programma.
set text4=Permetta Cominciamo.
set text10=Si e verificato un errore durante la patch dei file.
set text13=Uscire dal patcher in ...
set text5=Veramente, lo sai. Cominciamo da questo, al fine di patch wad file ho bisogno di un file wad.
set text6=Quindi, se puoi copiare qualsiasi file wad in questa directory io sono.
set text7=In attesa di file .wad
set text8=Patching dei file:
set text9=Totale quantita di file:
set text10=Patching e fatto.
set text11=File patch e in wiimmfi-wads cartella
set text12=originale wads e nella di backup-wads cartella

set language=1
goto begin
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
set text1=Es gab einen Fehler wahrend das Programm ausgefuhrt wurde
set text2=Einige Dateien die das Programm braucht um zu funktionieren wurden nicht gefunden
set text3=Drucke irgendeinen Knopf um das Programm zu schliesen.
set text4=Lass uns loslegen.
set text10=Es gab einen Fehler während die Dateien gepatcht wurden.
set text13=Schliese den Patcher in...
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
set text1=Podczas korzystania z programu wystąpil bład
set text2=Kilka plików potrzebnych do uruchomienia programu nie zostalo znalezionych
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
if not exist %appdata%\WiimmfiPatcher set output=OK! It seems that database is deleted, try restarting this program.
if exist %appdata%\WiimmfiPatcher set output=FAIL! The Database has not been deleted.
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
echo Executing command...
set check=1
timeout 3 /nobreak >NUL || set check=0 
if %check%==1 set output=OK! Program will work correctly
if %check%==0 set output=FAIL! Legacy PC found, some commands may not work correct but the program will work and do it's job.
goto debug_1 
:files_req_err
cls
cls
echo.
echo                                      WiiWarePatcher - @KcrPL, @PokeAcer, @Larsenv
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
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
goto firststart

:letsbegin_error
cls
echo.
echo                                      WiiWarePatcher - @KcrPL, @PokeAcer, @Larsenv
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
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
:letsbegin
for %%f in ("*.wad") do set /a file_counter+=1
set /a repeat=1
set /a errorrep=0
set /a rep=0
cls

cls
echo.
echo                                      WiiWarePatcher - @KcrPL, @PokeAcer, @Larsenv
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
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

cls
echo.
echo                                      WiiWarePatcher - @KcrPL, @PokeAcer, @Larsenv
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
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
cls
echo.
echo                                      WiiWarePatcher - @KcrPL, @PokeAcer, @Larsenv
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
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
goto end1
:end1
cls
cls
echo.
echo                                      WiiWarePatcher - @KcrPL, @PokeAcer, @Larsenv
echo ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
echo.
if %patchingok%==1 echo %text10%
if %patchingok%==1 echo.
if %patchingok%==1 echo %text11%
if %patchingok%==1 echo %text12%
if %patchingok%==1 echo.
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
