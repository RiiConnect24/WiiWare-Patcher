@echo off
mode 120,30
set /a crashing=0
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
echo ------------------------------------------------------------------------------------------------------------------------
echo Please select your language.
echo.
echo R. Open RiiConnect24 site in your default browser.
if %crashing%==0 echo C. [ ] If the program is crashing try selecting this option.
if %crashing%==1 echo C. [X] If the program is crashing try selecting this option.
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
if %s%==c goto change_crashing_var
if %s%==C goto change_crashing_var
if %s%==r start www.rc24.xyz
if %s%==R start www.rc24.xyz
if %s%==1 goto set_language_eng
if %s%==2 goto set_language_pol
if %s%==3 goto set_language_deu
if %s%==4 goto set_language_fr
if %s%==5 goto set_language_it
if %s%==6 goto set_language_es
if %s%==7 goto set_language_braz
goto set_language
:change_crashing_var
if %crashing%==0 goto cr_var_1
if %crashing%==1 goto cr_var_0
goto set_language
:cr_var_1
set /a crashing=1
goto set_language
:cr_var_0
set /a crashing=0
goto set_language

:error_crashing
cls
echo.
echo IOS Patcher for RiiConnect24 - @Larsenv, @KcrPL. v%version%
echo ------------------------------------------------------------------------------------------------------------------------
echo  [*] Info.
echo.
echo The Anti-Crash function cannot be used with this language. Please use another language.
echo.
echo Sorry for the inconvenience. :(
echo.
echo Press any key to go back to language select menu.
pause>NUL
goto set_language
:set_language_braz
if %crashing%==0 set text1=Ocorreu um erro enquanto abriamos o programa
if %crashing%==0 set text2=Alguns dos arquivos necessários para o programa, não foram encontrados.
if %crashing%==0 set text3=Clique em qualquer botão para fechar o programa.
if %crashing%==0 set text4=Vamos começar.
if %crashing%==0 set text10=Ocorreu um erro durante o patch dos arquivos.
if %crashing%==0 set text13=Saindo do patcher em...
if %crashing%==0 set text5=Agora, você sabe. Vamos começar com aquilo, em ordem para o patch do arquivo wad, eu preciso do arquivo wad
if %crashing%==0 set text6=Então se você puder copiar o arquivo wad para a pasta aonde estou.
if %crashing%==0 set text7=Esperando pelos arquivos .wad
if %crashing%==0 set text8=Patch do arquivo em progresso:
if %crashing%==0 set text9=Total de arquivos:
if %crashing%==0 set text10=Patching foi finalizado.
if %crashing%==0 set text11=Arquivos com Patch estão na pasta wiimmfi-wads 
if %crashing%==0 set text12=Os arquivos originais estão na pasta backup-wads 

if %crashing%==1 set text1=Ocorreu um erro enquanto abriamos o programa
if %crashing%==1 set text2=Alguns dos arquivos necessarios para o programa, nao foram encontrados.
if %crashing%==1 set text3=Clique em qualquer botao para fechar o programa.
if %crashing%==1 set text4=Vamos comecar.
if %crashing%==1 set text10=Ocorreu um erro durante o patch dos arquivos.
if %crashing%==1 set text13=Saindo do patcher em...
if %crashing%==1 set text5=Agora, voce sabe. Vamos começar com aquilo, em ordem para o patch do arquivo wad, eu preciso do arquivo wad
if %crashing%==1 set text6=Entao se voce puder copiar o arquivo wad para a pasta aonde estou.
if %crashing%==1 set text7=Esperando pelos arquivos .wad
if %crashing%==1 set text8=Patch do arquivo em progresso:
if %crashing%==1 set text9=Total de arquivos:
if %crashing%==1 set text10=Patching foi finalizado.
if %crashing%==1 set text11=Arquivos com Patch estao na pasta wiimmfi-wads 
if %crashing%==1 set text12=Os arquivos originais estao na pasta backup-wads 
set language=1
goto begin
:set_language_es
if %crashing%==0 set text1=Ha occurido un problema al ejecutar este programa.
if %crashing%==0 set text2=Algunos de los archivos necesarios para ejecutar este programa no se han encontrado.
if %crashing%==0 set text3=Presiona cualquier tecla para cerrar el programa.
if %crashing%==0 set text4=Empecemos.
if %crashing%==0 set text10=Ha ocurrido un problema al parchear los archivos.
if %crashing%==0 set text13=Cerrando el parcheador...
if %crashing%==0 set text5=No se si lo sepas, pero para parchear el archivo WAD, necesito un archivo WAD...
if %crashing%==0 set text6=Entonces, puedes copiar un WAD a mi carpeta?.
if %crashing%==0 set text7=Esperando por archivos .wad
if %crashing%==0 set text8=Parcheando archivo:
if %crashing%==0 set text9=Cantidad total de archivos:
if %crashing%==0 set text10=Parcheo completado.
if %crashing%==0 set text11=Los WADs parcheados estan en la carpeta "wiimmfi-wads"
if %crashing%==0 set text12=Las copias de seguridad estan en la carpeta "backup-wads"

if %crashing%==1 set text1=Ha occurido un problema al ejecutar este programa.
if %crashing%==1 set text2=Algunos de los archivos necesarios para ejecutar este programa no se han encontrado.
if %crashing%==1 set text3=Presiona cualquier tecla para cerrar el programa.
if %crashing%==1 set text4=Empecemos.
if %crashing%==1 set text10=Ha ocurrido un problema al parchear los archivos.
if %crashing%==1 set text13=Cerrando el parcheador...
if %crashing%==1 set text5=No se si lo sepas, pero para parchear el archivo WAD, necesito un archivo WAD...
if %crashing%==1 set text6=Entonces, puedes copiar un WAD a mi carpeta?.
if %crashing%==1 set text7=Esperando por archivos .wad
if %crashing%==1 set text8=Parcheando archivo:
if %crashing%==1 set text9=Cantidad total de archivos:
if %crashing%==1 set text10=Parcheo completado.
if %crashing%==1 set text11=Los WADs parcheados estan en la carpeta "wiimmfi-wads"
if %crashing%==1 set text12=Las copias de seguridad estan en la carpeta "backup-wads"

set language=1
goto begin
:set_language_it
if %crashing%==0 set text1=Si e verificato un errore durante l'esecuzione del programma
if %crashing%==0 set text2=Alcuni dei file necessari per eseguire questo programma non sono stati trovati
if %crashing%==0 set text3=Fare clic su qualsiasi pulsante per chiudere questo programma.
if %crashing%==0 set text4=Permetta Cominciamo.
if %crashing%==0 set text10=Si e verificato un errore durante la patch dei file.
if %crashing%==0 set text13=Uscire dal patcher in ...
if %crashing%==0 set text5=Veramente, lo sai. Cominciamo da questo, al fine di patch wad file ho bisogno di un file wad.
if %crashing%==0 set text6=Quindi, se puoi copiare qualsiasi file wad in questa directory io sono.
if %crashing%==0 set text7=In attesa di file .wad
if %crashing%==0 set text8=Patching dei file:
if %crashing%==0 set text9=Totale quantita di file:
if %crashing%==0 set text10=Patching e fatto.
if %crashing%==0 set text11=File patch e in wiimmfi-wads cartella
if %crashing%==0 set text12=originale wads e nella di backup-wads cartella

if %crashing%==1 set text1=Si e verificato un errore durante l'esecuzione del programma
if %crashing%==1 set text2=Alcuni dei file necessari per eseguire questo programma non sono stati trovati
if %crashing%==1 set text3=Fare clic su qualsiasi pulsante per chiudere questo programma.
if %crashing%==1 set text4=Permetta Cominciamo.
if %crashing%==1 set text10=Si e verificato un errore durante la patch dei file.
if %crashing%==1 set text13=Uscire dal patcher in ...
if %crashing%==1 set text5=Veramente, lo sai. Cominciamo da questo, al fine di patch wad file ho bisogno di un file wad.
if %crashing%==1 set text6=Quindi, se puoi copiare qualsiasi file wad in questa directory io sono.
if %crashing%==1 set text7=In attesa di file .wad
if %crashing%==1 set text8=Patching dei file:
if %crashing%==1 set text9=Totale quantita di file:
if %crashing%==1 set text10=Patching e fatto.
if %crashing%==1 set text11=File patch e in wiimmfi-wads cartella
if %crashing%==1 set text12=originale wads e nella di backup-wads cartella

set language=1
goto begin
:set_language_fr
if %crashing%==0 set text1=Il y a eu une erreur durant l'execution du programme
if %crashing%==0 set text2=Un des fichiers necessaires pour executer le programme n'a pas ete trouve
if %crashing%==0 set text3=Appuyer sur n'importe quelle touche pour terminer le programme
if %crashing%==0 set text4=Commencons
if %crashing%==0 set text10=Il y a eu une erreur durant le patch des fichiers.
if %crashing%==0 set text13=Fermeture du patcher...
if %crashing%==0 set text5=En fait, vous savez. Commencons par ceci, afin de patcher un WAD, j'ai besoin du fichier WAD
if %crashing%==0 set text6=Donc, si vous pouviez s'il vous plait copier le fichier WAD à patcher dans le dossier ou je suis.
if %crashing%==0 set text7=En attente d'un fichier WAD
if %crashing%==0 set text8=Patchage des fichiers...
if %crashing%==0 set text9=Nombre de fichiers:
if %crashing%==0 set text10=Le patchage est termine.
if %crashing%==0 set text11=Les fichiers patches se trouvent dans le dossier wiimmfi-wads
if %crashing%==0 set text12=Les fichiers originaux se trouvent dans le dossier backup-wads


if %crashing%==1 set text1=Il y a eu une erreur durant l'execution du programme
if %crashing%==1 set text2=Un des fichiers necessaires pour executer le programme n'a pas ete trouve
if %crashing%==1 set text3=Appuyer sur n'importe quelle touche pour terminer le programme
if %crashing%==1 set text4=Commencons
if %crashing%==1 set text10=Il y a eu une erreur durant le patch des fichiers.
if %crashing%==1 set text13=Fermeture du patcher...
if %crashing%==1 set text5=En fait, vous savez. Commencons par ceci, afin de patcher un WAD, j'ai besoin du fichier WAD
if %crashing%==1 set text6=Donc, si vous pouviez s'il vous plait copier le fichier WAD a patcher dans le dossier ou je suis.
if %crashing%==1 set text7=En attente d'un fichier WAD
if %crashing%==1 set text8=Patchage des fichiers...
if %crashing%==1 set text9=Nombre de fichiers:
if %crashing%==1 set text10=Le patchage est termine.
if %crashing%==1 set text11=Les fichiers patches se trouvent dans le dossier wiimmfi-wads
if %crashing%==1 set text12=Les fichiers originaux se trouvent dans le dossier backup-wads
set language=1
goto begin
:set_language_deu
if %crashing%==0 set text1=Es gab einen Fehler wahrend das Programm ausgefuhrt wurde
if %crashing%==0 set text2=Einige Dateien die das Programm braucht um zu funktionieren wurden nicht gefunden
if %crashing%==0 set text3=Drucke irgendeinen Knopf um das Programm zu schliesen.
if %crashing%==0 set text4=Lass uns loslegen.
if %crashing%==0 set text10=Es gab einen Fehler während die Dateien gepatcht wurden.
if %crashing%==0 set text13=Schliese den Patcher in...
if %crashing%==0 set text5=Lass uns loslegen. Damit ich eine wad-Datei patchen kann brauche ich eine wad-Datei!
if %crashing%==0 set text6=Konntest du bitte jede wad-Datei in den selben Ordner verschieben wo ich auch bin.
if %crashing%==0 set text7=Warte auf die .wad Dateien
if %crashing%==0 set text8=Patche Datei:
if %crashing%==0 set text9=Gesamtmenge der Dateien:
if %crashing%==0 set text10=Alle Dateien wurden gepatcht!.
if %crashing%==0 set text11=Die gepatchten Dateien sind im "wiimmfi-wads" Ordner
if %crashing%==0 set text12=Die archivierten .wad Dateien sind im "backup-wads" Ordner


if %crashing%==1 set text1=Es gab einen Fehler wahrend das Programm ausgefuhrt wurde
if %crashing%==1 set text2=Einige Dateien die das Programm braucht um zu funktionieren wurden nicht gefunden
if %crashing%==1 set text3=Drucke irgendeinen Knopf um das Programm zu schliesen.
if %crashing%==1 set text4=Lass uns loslegen.
if %crashing%==1 set text10=Es gab einen Fehler während die Dateien gepatcht wurden.
if %crashing%==1 set text13=Schliese den Patcher in...
if %crashing%==1 set text5=Lass uns loslegen. Damit ich eine wad-Datei patchen kann brauche ich eine wad-Datei!
if %crashing%==1 set text6=Konntest du bitte jede wad-Datei in den selben Ordner verschieben wo ich auch bin.
if %crashing%==1 set text7=Warte auf die .wad Dateien
if %crashing%==1 set text8=Patche Datei:
if %crashing%==1 set text9=Gesamtmenge der Dateien:
if %crashing%==1 set text10=Alle Dateien wurden gepatcht!.
if %crashing%==1 set text11=Die gepatchten Dateien sind im "wiimmfi-wads" Ordner
if %crashing%==1 set text12=Die archivierten .wad Dateien sind im "backup-wads" Ordner
set language=1
goto begin
:set_language_pol
if %crashing%==0 set text1=Podczas korzystania z programu wystąpil bład
if %crashing%==0 set text2=Kilka plików potrzebnych do uruchomienia programu nie zostalo znalezionych
if %crashing%==0 set text3=Nacisnij dowolny przycisk aby zamknac program.
if %crashing%==0 set text4=Zacznijmy.
if %crashing%==0 set text10=Wystapil blad podczas patchowania plikow.
if %crashing%==0 set text13=Zamykanie patchera za...
if %crashing%==0 set text5=Zacznijmy od tego, zeby zaczac patchowac pliki .wad - potrzebuje pliku .wad
if %crashing%==0 set text6=Wiec jezeli mozesz, skopiuj jakis plik .wad do folderu w ktorym jestem
if %crashing%==0 set text7=Oczekiwanie na plik .wad
if %crashing%==0 set text8=Patchowanie pliku:
if %crashing%==0 set text9=Laczna liczba plikow:
if %crashing%==0 set text10=Patchowanie przebieglo sukcesem.
if %crashing%==0 set text11=Zpatchowane pliki sa w folderze "wiimmfi-wads"
if %crashing%==0 set text12=Kopia zapasowa plikow .wad jest w folderze "backup-wads"

if %crashing%==1 set text1=Podczas korzystania z programu wystąpil bład
if %crashing%==1 set text2=Kilka plikow potrzebnych do uruchomienia programu nie zostalo znalezionych
if %crashing%==1 set text3=Nacisnij dowolny przycisk aby zamknac program.
if %crashing%==1 set text4=Zacznijmy.
if %crashing%==1 set text10=Wystapil blad podczas patchowania plikow.
if %crashing%==1 set text13=Zamykanie patchera za...
if %crashing%==1 set text5=Zacznijmy od tego, zeby zaczac patchowac pliki .wad - potrzebuje pliku .wad
if %crashing%==1 set text6=Wiec jezeli mozesz, skopiuj jakis plik .wad do folderu w ktorym jestem
if %crashing%==1 set text7=Oczekiwanie na plik .wad
if %crashing%==1 set text8=Patchowanie pliku:
if %crashing%==1 set text9=Laczna liczba plikow:
if %crashing%==1 set text10=Patchowanie przebieglo sukcesem.
if %crashing%==1 set text11=Zpatchowane pliki sa w folderze "wiimmfi-wads"
if %crashing%==1 set text12=Kopia zapasowa plikow .wad jest w folderze "backup-wads"

set language=1
goto begin
:set_language_eng
cls
set text1=An error occurred.
set text2=Files required to run this script are missing, please re-download the script.
set text3=Press any key to close the program.
set text4=Let's begin.
set text10=An error occurred while patching the files.
set text13=Exiting the patcher in...
set text5=Actually, let's begin from here.
set text6=Please copy any WAD file to the directory where I am.
set text7=Waiting for WAD files.
set text8=Patching file:
set text9=Total amount of files:
set text10=Patching is done.
set text11=Patched files are in the wiimmfi-wads folder.
set text12=Backed up WADS are in the backup-wads folder.

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
echo 1. Reset program.
echo 2. Reset database.
echo 3. Delete patched files.
echo 4. Exit.
echo 5. Open Command Prompt.
echo 6. File check.
echo 7. Check for program compatibility on this computer.
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
if not exist %appdata%\WiimmfiPatcher set output=OK! The database has been deleted.
if exist %appdata%\WiimmfiPatcher set output=FAIL! The database has not been deleted.
goto debug_1
:debug_patched_Del
cls
echo Executing command...
rmdir backup-wads /s /q
rmdir wiimmfi-wads /s /q
set output=OK! Two folders have been deleted.
goto debug_1
:debug_cmd
cls
echo Type "exit" to return to the debug menu.
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
if %exist%==0 set output=FAIL! Files required to run this script are missing, please re-download the script.
if %exist%==1 set output=OK! It seems that every file required to run this script exist.
goto debug_1
:debug_check_comp
cls
echo Executing command...
set check=1
timeout 3 /nobreak >NUL || set check=0 
if %check%==1 set output=OK! The program will work correctly on this machine.
if %check%==0 set output=FAIL! We detected that you are using a Legacy PC so the program may not function correctly.
goto debug_1 
:files_req_err
cls
cls
echo.
echo                                      WiiWarePatcher - @KcrPL, @PokeAcer, @Larsenv
echo ------------------------------------------------------------------------------------------------------------------------
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
echo ------------------------------------------------------------------------------------------------------------------------
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
echo ------------------------------------------------------------------------------------------------------------------------
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
echo ------------------------------------------------------------------------------------------------------------------------
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
cd wiimmfi-wads
for %%a in (*.wad) do ren "%%~a" "%%~na_Wiimmfi%%~xa"
cd..
goto end
:error_ok
cls
cls
echo.
echo                                      WiiWarePatcher - @KcrPL, @PokeAcer, @Larsenv
echo ------------------------------------------------------------------------------------------------------------------------
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
echo ------------------------------------------------------------------------------------------------------------------------
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
