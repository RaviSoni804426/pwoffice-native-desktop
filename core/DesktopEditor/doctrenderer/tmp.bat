call "C:/Program Files/Microsoft Visual Studio/18/Community/VC/Auxiliary/Build/vcvarsall.bat" x64
call "C:/Qt/6.11.1/msvc2022_64/bin/qmake" -nocache D:\pwoffice-native\core\DesktopEditor\doctrenderer\doctrenderer.pro "CONFIG+=desktop" "CONFIG+=v8_version_60" "CONFIG+=core_disable_all_warnings" "CONFIG+=updmodule" "CONFIG+=disable_precompiled_header" "URL_WEBAPPS_HELP=https://download.onlyoffice.com/install/desktop/editors/help/v9.4.0/apps"
call nmake clean -f D:\pwoffice-native\core\DesktopEditor\doctrenderer/Makefile.win_64
call nmake distclean -f D:\pwoffice-native\core\DesktopEditor\doctrenderer/Makefile.win_64
call "C:/Qt/6.11.1/msvc2022_64/bin/qmake" -nocache D:\pwoffice-native\core\DesktopEditor\doctrenderer\doctrenderer.pro "CONFIG+=desktop" "CONFIG+=v8_version_60" "CONFIG+=core_disable_all_warnings" "CONFIG+=updmodule" "CONFIG+=disable_precompiled_header" "URL_WEBAPPS_HELP=https://download.onlyoffice.com/install/desktop/editors/help/v9.4.0/apps"
set CL=/MP
call nmake -f D:\pwoffice-native\core\DesktopEditor\doctrenderer/Makefile.win_64