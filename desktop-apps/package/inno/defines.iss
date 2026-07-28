; -- PW Office Desktop Editors Defines --

#define sCompanyName                    "PW Office"
#define sIntCompanyName                 sCompanyName
#define sProductName                    "Desktop Editors"
#define sIntProductName                 "PWOffice"
#define sAppName                        "PW Office"
#define sPackageName                    str(sIntCompanyName + "-" + sIntProductName)
#define sAppPublisher                   "PW Office"
#define sAppPublisherURL                "https://www.pwoffice.com/"
#define sAppSupportURL                  "https://www.pwoffice.com/support.aspx"
#define sAppCopyright                   str("© " + sAppPublisher + " " + GetDateTimeString("yyyy",,) + ". All rights reserved.")
#define sAppIconName                    "PW Office"
#define sOldAppIconName                 "PW Office"
#define sAppProtocol                    'pw-office'

#define APP_PATH                        str(sIntCompanyName + "\" + sIntProductName)
#define UPD_PATH                        str(sIntProductName + "Updates")
#define APP_REG_PATH                    str("Software\" + APP_PATH)
#define APP_REG_UNINST_KEY              str(sCompanyName + " " + sProductName)
#define APP_USER_MODEL_ID               "ASC.Documents.5"
#define APP_MUTEX_NAME                  "TEAMLAB"
#define APPWND_CLASS_NAME               "DocEditorsWindowClass"

#define iconsExe                        "DesktopEditors.exe"
#define NAME_EXE_OUT                    "editors.exe"

#define ASSC_APP_NAME                   "PW Office"
#define ASCC_REG_PREFIX                 "PW"
#define ASCC_REG_REGISTERED_APP_NAME    "PW Office"
#define ASSOC_PROG_ID                   "PW.Editors"
#define ASSOC_APP_FRIENDLY_NAME         "PW Office"
