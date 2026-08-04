; PW Office - Inno Setup installer script
; Build with:  ISCC.exe /DSourceDir="<path to the built app>" pwoffice_setup.iss
;
; The upstream installer is assembled from desktop-apps/package/inno/*.iss by
; the build_tools pipeline. That pipeline cannot run here (V8 will not build
; against Visual Studio 18), so this is a self-contained script that packages
; an already-deployed application directory instead.

#define AppName        "PW Office"
; AppDirName must stay identical to REG_APP_NAME in desktop-apps/win-linux/src/defines.h.
; cupdatemanager.cpp compares the install folder's basename against REG_APP_NAME
; and disables updates on mismatch, so this must not contain spaces.
#define AppDirName     "PWOffice"
#define AppVersion     "5.3.95.508"
; cnotification.cpp builds APP_LAUNCH_NAME as REG_APP_NAME + ".exe".
#define AppExeName     "PWOffice.exe"
#ifndef SourceDir
  #define SourceDir    "C:\Program Files\PWOffice"
#endif
#define BrandingIcon   "D:\pwoffice-native\branding\pwoffice.ico"

[Setup]
; Matches the AppId the previous installer wrote (sCompanyName + " " + sProductName
; in package/inno/defines.iss), so this upgrades an existing install in place
; rather than landing beside it.
AppId=PW Office Desktop Editors
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
AppPublisher={#AppName}
DefaultDirName={autopf}\{#AppDirName}
DefaultGroupName={#AppName}
OutputDir=D:\PW-Installers
OutputBaseFilename=PWOffice-Setup-{#AppVersion}-x64
SetupIconFile={#BrandingIcon}
UninstallDisplayIcon={app}\{#AppExeName}
UninstallDisplayName={#AppName}
; The payload is ~1.85 GB and is mostly already-compressed data (CEF, fonts,
; wasm), so ultra64 costs hours for almost no size gain. max is the better
; trade here.
Compression=lzma2/max
SolidCompression=yes
LZMAUseSeparateProcess=yes
LZMANumBlockThreads=2
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
WizardStyle=modern
PrivilegesRequired=admin
DisableProgramGroupPage=yes
DisableDirPage=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; GroupDescription: "Additional shortcuts:"
Name: "assoc_docx"; Description: "Open .docx files with {#AppName}"; GroupDescription: "File associations:"
Name: "assoc_xlsx"; Description: "Open .xlsx files with {#AppName}"; GroupDescription: "File associations:"
Name: "assoc_pptx"; Description: "Open .pptx files with {#AppName}"; GroupDescription: "File associations:"
Name: "assoc_pdf";  Description: "Open .pdf files with {#AppName}";  GroupDescription: "File associations:"; Flags: unchecked

[Files]
; Keep rollback copies of patched binaries out of the payload - they are
; working files, and some of them are pre-fix executables.
;
; Do NOT add a bare "*.bak" here. ONLYOFFICE ships real product files ending
; in .bak (dictionaries/hyph_sl_SI.dic.bak), so that pattern silently drops
; them. Only the suffixes our own patch scripts create are listed.
; unins000.* is Inno's own uninstaller, regenerated on every install. When the
; payload comes from an installed copy those files are sitting there and get
; packaged, only to be overwritten by the fresh one - harmless, but it ships
; several megabytes of a stale uninstaller for no reason.
Source: "{#SourceDir}\*"; DestDir: "{app}"; Excludes: "*.bak-*,*.bak2,*.bak3,unins000.*"; \
    Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#AppName}";            Filename: "{app}\{#AppExeName}"
Name: "{group}\Uninstall {#AppName}";  Filename: "{uninstallexe}"
Name: "{autodesktop}\{#AppName}";      Filename: "{app}\{#AppExeName}"; Tasks: desktopicon

[Registry]
; --- Application registration -------------------------------------------
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\{#AppExeName}"; \
    ValueType: string; ValueName: ""; ValueData: "{app}\{#AppExeName}"; Flags: uninsdeletekey

; --- ProgIDs -------------------------------------------------------------
Root: HKCR; Subkey: "PWOffice.docx"; ValueType: string; ValueName: ""; ValueData: "Word Document"; Flags: uninsdeletekey; Tasks: assoc_docx
Root: HKCR; Subkey: "PWOffice.docx\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#AppExeName},0"; Tasks: assoc_docx
Root: HKCR; Subkey: "PWOffice.docx\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppExeName}"" ""%1"""; Tasks: assoc_docx
Root: HKCR; Subkey: ".docx"; ValueType: string; ValueName: ""; ValueData: "PWOffice.docx"; Flags: uninsdeletevalue; Tasks: assoc_docx

Root: HKCR; Subkey: "PWOffice.xlsx"; ValueType: string; ValueName: ""; ValueData: "Excel Worksheet"; Flags: uninsdeletekey; Tasks: assoc_xlsx
Root: HKCR; Subkey: "PWOffice.xlsx\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#AppExeName},0"; Tasks: assoc_xlsx
Root: HKCR; Subkey: "PWOffice.xlsx\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppExeName}"" ""%1"""; Tasks: assoc_xlsx
Root: HKCR; Subkey: ".xlsx"; ValueType: string; ValueName: ""; ValueData: "PWOffice.xlsx"; Flags: uninsdeletevalue; Tasks: assoc_xlsx

Root: HKCR; Subkey: "PWOffice.pptx"; ValueType: string; ValueName: ""; ValueData: "PowerPoint Presentation"; Flags: uninsdeletekey; Tasks: assoc_pptx
Root: HKCR; Subkey: "PWOffice.pptx\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#AppExeName},0"; Tasks: assoc_pptx
Root: HKCR; Subkey: "PWOffice.pptx\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppExeName}"" ""%1"""; Tasks: assoc_pptx
Root: HKCR; Subkey: ".pptx"; ValueType: string; ValueName: ""; ValueData: "PWOffice.pptx"; Flags: uninsdeletevalue; Tasks: assoc_pptx

; .pdf is opt-in (unchecked by default) - PW PDF is the dedicated app for it,
; and a browser usually owns the association.
Root: HKCR; Subkey: "PWOffice.pdf"; ValueType: string; ValueName: ""; ValueData: "PDF Document"; Flags: uninsdeletekey; Tasks: assoc_pdf
Root: HKCR; Subkey: "PWOffice.pdf\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#AppExeName},0"; Tasks: assoc_pdf
Root: HKCR; Subkey: "PWOffice.pdf\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppExeName}"" ""%1"""; Tasks: assoc_pdf
Root: HKCR; Subkey: ".pdf"; ValueType: string; ValueName: ""; ValueData: "PWOffice.pdf"; Flags: uninsdeletevalue; Tasks: assoc_pdf

; --- "Open with" entries (always registered, even without taking over the
;     default) so the formats show up in Explorer's Open-with list. --------
Root: HKCR; Subkey: "Applications\{#AppExeName}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppExeName}"" ""%1"""; Flags: uninsdeletekey
Root: HKCR; Subkey: ".docx\OpenWithProgids"; ValueType: string; ValueName: "PWOffice.docx"; ValueData: ""; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".xlsx\OpenWithProgids"; ValueType: string; ValueName: "PWOffice.xlsx"; ValueData: ""; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".pptx\OpenWithProgids"; ValueType: string; ValueName: "PWOffice.pptx"; ValueData: ""; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".pdf\OpenWithProgids";  ValueType: string; ValueName: "PWOffice.pdf";  ValueData: ""; Flags: uninsdeletevalue

[Run]
Filename: "{app}\{#AppExeName}"; Description: "Launch {#AppName}"; Flags: postinstall nowait skipifsilent
