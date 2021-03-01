@echo off
:: Install MinGW if you want to compile under Windows.

echo Compiling...
g++ wiiwarepatcher.cpp -lws2_32 -static -o WiiWarePatcher.exe
echo.
if %errorlevel%==0 (
echo OK!
) else (
echo Failed.
)

pause