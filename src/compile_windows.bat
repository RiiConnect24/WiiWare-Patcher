@echo off
:: Make sure you have WSL (Windows Subsystem for Linux) installed and run this command:
:: sudo apt-get install mingw-w64 -y

echo Compiling...
echo.
	echo - 32 bit...
wsl i686-w64-mingw32-g++ wiiwarepatcher.cpp -lws2_32 -static -o WiiWarePatcher_32bit.exe
	if %errorlevel%==0 (
	echo ^> OK!
	) else (
	echo Failed.
	)
	echo.
	echo - 64 bit...
wsl x86_64-w64-mingw32-g++ wiiwarepatcher.cpp -lws2_32 -static -o WiiWarePatcher_64bit.exe
if %errorlevel%==0 (
echo ^> OK!
) else (
echo Failed.
)


echo.
echo Done!
pause