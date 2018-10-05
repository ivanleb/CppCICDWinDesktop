!include "FileFunc.nsh"
!insertmacro GetTime

# !define MUI_ICON "Install_icon.ico"
# !define MUI_UNICON "Uninstall_icon.ico"

Outfile "CppCICDWinDesktop_Setup.exe"

InstallDir $PROGRAMFILES\CppCICDWinDesktop
# $PROGRAMFILES\CppCICDWinDesktop

RequestExecutionLevel admin

Section
SetOutPath $INSTDIR
WriteUninstaller "$INSTDIR\uninstall.exe"
CreateShortCut "$SMPROGRAMS\CppCICDWinDesktop_Uninstall.lnk" "$INSTDIR\uninstall.exe" MUI_UNICON
CreateShortCut "$SMPROGRAMS\CppCICDWinDesktop.lnk" "$INSTDIR\bin\CppCICDWinDesktop.exe"
CreateShortCut "$DESKTOP\CppCICDWinDesktop.lnk" "$INSTDIR\bin\CppCICDWinDesktop.exe"

CreateDirectory $INSTDIR\bin
SetOutPath $INSTDIR\bin
File "CppCICDWinDesktop.exe"


CreateDirectory $DOCUMENTS\CppCICDWinDesktop
SetOutPath $DOCUMENTS\CppCICDWinDesktop\Resources

# File "Resources\data.json"


MessageBox MB_OK "CppCICDWinDesktop has been successfully installed"
SectionEnd

Section "uninstall"
${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6

CreateDirectory "$DOCUMENTS\CppCICDWinDesktop\backup\$2$1$0$4$5$6"
CopyFiles "$DOCUMENTS\CppCICDWinDesktop\Resources\*" "$DOCUMENTS\CppCICDWinDesktop\backup\$2$1$0$4$5$6"

Delete "$INSTDIR\uninstall.exe"
Delete "$SMPROGRAMS\CppCICDWinDesktop_Uninstall.lnk"
Delete "$DESKTOP\CppCICDWinDesktop.lnk"
Delete "$SMPROGRAMS\CppCICDWinDesktop.lnk"

Delete "$INSTDIR\bin\*.dll"
Delete "$INSTDIR\bin\*.exe"
Delete "$INSTDIR\bin\*"
# Delete "$DOCUMENTS\CppCICDWinDesktop\Resources\*.json"

RMDir "$INSTDIR\bin"

RMDir "$DOCUMENTS\CppCICDWinDesktop\Resources"

MessageBox MB_OK "CppCICDWinDesktop has been successfully deleted"
SectionEnd
