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

#define APP_PATH                        str(sIntProductName)
#define UPD_PATH                        str(sIntProductName + "Updates")
#define APP_REG_PATH                    str("Software\" + APP_PATH)
#define APP_REG_UNINST_KEY              str(sCompanyName + " " + sProductName)
; These three must stay identical to APP_USER_MODEL_ID / APP_MUTEX_NAME /
; WINDOW_CLASS_NAME in desktop-apps/win-linux/src/defines.h. The installer uses
; them to find and close a running instance, so a stale value here makes this
; installer close a *different* PW app instead of its own.
#define APP_USER_MODEL_ID               "PW.Office.1"
#define APP_MUTEX_NAME                  "PWOFFICE"
#define APPWND_CLASS_NAME               "PWOfficeWindowClass"

#define iconsExe                        "PWOffice.exe"
#define NAME_EXE_OUT                    "editors.exe"

#define ASSC_APP_NAME                   "PW Office"
#define ASCC_REG_PREFIX                 "PW"
#define ASCC_REG_REGISTERED_APP_NAME    "PW Office"
#define ASSOC_PROG_ID                   "PW.Editors"
#define ASSOC_APP_FRIENDLY_NAME         "PW Office"
