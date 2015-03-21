; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#include "buildinfo.h"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{CBB4464D-7081-4F1D-9F6D-F5288A4A9B82}
AppName=GNU Midnight Commander
AppVersion=4.8.13 (build: {#BUILD_DATE}-{#BUILD_NUMBER})
;   AppVerName= ...
AppPublisher=The Free Software Foundation, Inc.
AppPublisherURL=https://www.midnight-commander.org/
AppSupportURL=https://www.midnight-commander.org/
AppUpdatesURL=https://www.midnight-commander.org/

DefaultDirName={pf}\Midnight Commander
DefaultGroupName=Midnight Commander
LicenseFile=.\bin\doc\COPYING

OutputDir=.
OutputBaseFilename=mcwin32-build{#BUILD_NUMBER}-setup
Compression=lzma
SolidCompression=yes
ChangesEnvironment=true

UninstallDisplayIcon={app}\mc.exe

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: modifypath; Description: Add application directory to your environmental path; Flags: unchecked
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: ".\bin\mc.exe";       DestDir: "{app}"; Flags: ignoreversion
Source: ".\bin\mc.map";       DestDir: "{app}"; Flags: ignoreversion
Source: ".\bin\busybox.exe";  DestDir: "{app}"; Flags: ignoreversion
Source: ".\bin\file.exe";     DestDir: "{app}"; Flags: ignoreversion
Source: ".\bin\*.dll";        DestDir: "{app}"; Flags: ignoreversion
Source: ".\bin\man2hlp.pl";   DestDir: "{app}"; Flags: ignoreversion
Source: ".\bin\etc\*";        DestDir: "{app}\etc"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\bin\plugin\*";     DestDir: "{app}\plugin"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\bin\share\*";      DestDir: "{app}\share"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\bin\doc\*";        DestDir: "{app}\doc"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\GNU Midnight Commander"; Filename: "{app}\mc.exe"
Name: "{commondesktop}\GNU Midnight Commander"; Filename: "{app}\mc.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\GNU Midnight Commander"; Filename: "{app}\mc.exe"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\mc.exe"; Description: "{cm:LaunchProgram,GNU Midnight Commander}"; Flags: nowait postinstall skipifsilent

[Code]
const
    ModPathName = 'modifypath';
    ModPathType = 'user';
function ModPathDir(): TArrayOfString;
begin
    setArrayLength(Result, 1)
    Result[0] := ExpandConstant('{app}');
end;
#include "modpath.iss"
