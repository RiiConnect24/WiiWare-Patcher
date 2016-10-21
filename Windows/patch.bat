echo off
echo Automatic WAD Patcher for Wiimmfi.
echo Patcher by PokeAcer and Larsenv.
echo This will patch any WiiWare games in this folder to be installed using a WAD Manager.

echo.

mkdir wiimmfi-wads

for %%f in ("*.wad") do (
	echo Patching %%~nf...
	Sharpii.exe WAD -u "%%f" temp
	move temp\00000001.app 00000001.app
	WiiWarePatcher.exe
	move 00000001.app temp\00000001.app
	del "%%f"
	Sharpii.exe WAD -p temp "wiimmfi-wads/%%f"
	rmdir temp /s /q
)

echo.

echo Done patching the WADs. They're in the folder named wiimmfi-wads.

pause