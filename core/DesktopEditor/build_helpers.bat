call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
set CL=/MP

cd /d D:\pwoffice-native\core\DesktopEditor\AllFontsGen
C:\Qt\6.11.1\msvc2022_64\bin\qmake.exe -nocache D:\pwoffice-native\core\DesktopEditor\AllFontsGen\AllFontsGen.pro -o Makefile.win_64 "CONFIG+=desktop" "CONFIG+=core_disable_all_warnings" "CONFIG+=disable_precompiled_header"
nmake -f Makefile.win_64

cd /d D:\pwoffice-native\core\DesktopEditor\allthemesgen
C:\Qt\6.11.1\msvc2022_64\bin\qmake.exe -nocache D:\pwoffice-native\core\DesktopEditor\allthemesgen\allthemesgen.pro -o Makefile.win_64 "CONFIG+=desktop" "CONFIG+=core_disable_all_warnings" "CONFIG+=disable_precompiled_header"
nmake -f Makefile.win_64
