call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
C:\Qt\6.11.1\msvc2022_64\bin\qmake.exe -nocache D:\pwoffice-native\core\DesktopEditor\doctrenderer\doctrenderer.pro -o Makefile.win_64 "CONFIG+=desktop" "CONFIG+=v8_version_60" "CONFIG+=core_disable_all_warnings" "CONFIG+=updmodule" "CONFIG+=disable_precompiled_header" "URL_WEBAPPS_HELP=https://download.onlyoffice.com/install/desktop/editors/help/v9.4.0/apps"
set CL=/MP
nmake -f Makefile.win_64
