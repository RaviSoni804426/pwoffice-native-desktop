@echo off
call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvars64.bat"
cd /d D:\pwoffice-native\desktop-apps\win-linux
nmake /f Makefile.win_64
echo BUILD_RESULT=%ERRORLEVEL%
