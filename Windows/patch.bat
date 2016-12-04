echo off

cls

echo Automatic WAD Patcher for Wiimmfi.
echo Patcher by PokeAcer and Larsenv.
echo This will patch any WiiWare games in this folder to be installed using a WAD Manager.

echo.

mkdir wiimmfi-wads
mkdir backup-wads

for %%f in ("*.wad") do (
	set file=%%f
	echo Processing %%~nf...
	echo Making backup.
	copy /b "%file%" backup-wads
	echo Patching... This might take a second.
	Sharpii.exe WAD -u "%file%" temp
	move temp\00000001.app 00000001.app
	WiiWarePatcher.exe
	move 00000001.app temp\00000001.app
	del "%file%"
	Sharpii.exe WAD -p temp "wiimmfi-wads/%file%"
	rmdir temp /s /q
)

echo.

echo Done patching the WADs. They're in the folder named wiimmfi-wads.
echo The original files are in backup-wads.

pause