call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
set CL=/MP

cd /d D:\pwoffice-native\desktop-sdk\ChromiumBasedEditors\lib
C:\Qt\6.11.1\msvc2022_64\bin\qmake.exe -nocache D:\pwoffice-native\desktop-sdk\ChromiumBasedEditors\lib\ascdocumentscore.pro -o Makefile.win_64 "CONFIG+=desktop" "CONFIG+=core_disable_all_warnings" "CONFIG+=disable_precompiled_header"
nmake -f Makefile.win_64

cd /d D:\pwoffice-native\desktop-sdk\ChromiumBasedEditors\lib\qt_wrapper
C:\Qt\6.11.1\msvc2022_64\bin\qmake.exe -nocache D:\pwoffice-native\desktop-sdk\ChromiumBasedEditors\lib\qt_wrapper\qtascdocumentscore.pro -o Makefile.win_64 "CONFIG+=desktop" "CONFIG+=core_disable_all_warnings" "CONFIG+=disable_precompiled_header"
nmake -f Makefile.win_64

cd /d D:\pwoffice-native\desktop-sdk\ChromiumBasedEditors\lib
C:\Qt\6.11.1\msvc2022_64\bin\qmake.exe -nocache D:\pwoffice-native\desktop-sdk\ChromiumBasedEditors\lib\ascdocumentscore_helper.pro -o Makefile.win_64 "CONFIG+=desktop" "CONFIG+=core_disable_all_warnings" "CONFIG+=disable_precompiled_header"
nmake -f Makefile.win_64

