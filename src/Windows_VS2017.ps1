# Mijn eigen install script
# Run link: START http://boxstarter.org/package/url?http://bit.ly/2nyP3Kc
# Short link: http://bit.ly/2nyP3Kc

# Disable-UAC

# Boxstarter options ==============================================================
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot


# Windows setup ===================================================================
Disable-InternetExplorerESC
Update-ExecutionPolicy Unrestricted
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -DisableShowProtectedOSFiles -EnableShowFileExtensions
Set-TaskbarOptions -Size Small -Combine Never 
Enable-RemoteDesktop
Install-WindowsUpdate -AcceptEula
cinst Microsoft-Hyper-V-All -source windowsFeatures
cinst TelnetClient -source windowsFeatures
cinst IIS-WebServerRole -source windowsfeatures
cinst IIS-HttpCompressionDynamic -source windowsfeatures
cinst IIS-ManagementScriptingTools -source windowsfeatures
cinst IIS-WindowsAuthentication -source windowsfeatures

# Windows apps
cinst dropbox
cinst googledrive
cinst office356

# Utils ===========================================================================
cinst chocolatey
cinst ProcExp #cinst sysinternals

# Development Visual Studio 2017 ==================================================
cinst visualstudio2017community  --package-parameters "--add Microsoft.VisualStudio.Workload.netcoretools `
                                                       --add Microsoft.VisualStudio.Workload.data `
                                                       --add Microsoft.VisualStudio.Workload.webcrossplat `
                                                       --add Microsoft.VisualStudio.Workload.visualstudioextension `
                                                       --add Microsoft.VisualStudio.Workload.netweb `
                                                       --add Microsoft.VisualStudio.Workload.office `
                                                       --add Microsoft.VisualStudio.Workload.manageddesktop `
                                                       --includeRecommended --includeOptional --passive"

Install-ChocolateyVsixPackage xunit http://visualstudiogallery.msdn.microsoft.com/463c5987-f82b-46c8-a97e-b1cde42b9099/file/66837/1/xunit.runner.visualstudio.vsix

cinst Resharper-platform
Install-ChocolateyFileAssociation ".dll" "$($Boxstarter.programFiles86)\jetbrains\dotpeek\v1.1\Bin\dotpeek32.exe"

cinst ncrunch-vs2017  # Is er nog niet


# Development IDE's ==============================================================
cinst visualstudiocode

# Development Tools ==============================================================
cinst kdiff3
cinst fiddler4
cinst github
cinst gitextensions
# cinst beyondcompare
# cinst NugetPackageExplorer
# cinst windbg
# cinst Devbox-Clink
# cinst linqpad4
# cinst ncrunch2.vs2013

# Browsers =======================================================================
cinst googlechrome
cinst firefox

# Other essential tools
cinst 7zip
cinst filezilla
cinst windirstat
# cinst adobereader
# cinst javaruntime

# Windows Taskbar ================================================================
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"








# cinst virtualclonedrive
# cinst SublimeText3
# cinst keepass.install
# cinst autohotkey
# cinst winmerge
cinst NuGet.CommandLine
cinst scriptcs
cinst stylecop
cinst resharper
cinst mssqlservermanagementstudio2014express
# TODO: remove -version 1.0.6 once approved
# NOTE: this takes up 700mb because it doesn't delete the installer
del "C:\ProgramData\chocolatey\lib\MsSqlServerManagementStudio2014Express.1.0.6\tools\SQLManagementStudio_x64_ENU.exe"

#################################
#### NOW get windows updates ####
#################################

Enable-MicrosoftUpdate
Install-WindowsUpdate -AcceptEula

#################
#### cleanup ####
#################

del C:\eula*.txt
del C:\install.*
del C:\vcredist.*
del C:\vc_red.*

###############################
#### windows configuration ####
###############################

### do this here so that it only happens once (shouldn't reboot any more at this point)

Enable-RemoteDesktop
Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen
Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowHiddenFilesFoldersDrives -DisableShowProtectedOSFiles
TZUTIL /s "Eastern Standard Time"

Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Microsoft SQL Server\120\Tools\Binn\ManagementStudio\Ssms.exe"

################################
#### restore disabled stuff ####
################################

Enable-UAC

# TODO figure out how to force a restart here, but only once (not every time the script runs)

#########################
#### manual installs ####
#########################

### Teracopy
start http://codesector.com/teracopy

### markdownpad 2.x 
start http://markdownpad.com/download.html

## MS Office 2013
# link to ISO?




cinst bulkrenameutility
cinst dropbox
## causes reboot
## opens UI after restart
cinst skype
cinst foxitreader

### dev utils
cinst ilmerge
cinst ilspy

### sql server
# cinst mssqlserver2012express

cinst git-credential-winstore
cinst skydrive
cinst poshgit
cinst windbg

Install-ChocolateyPinnedTaskBarItem "$env:windir\system32\mstsc.exe"

cinst console-devel
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\console\console.exe"
copy-item (Join-Path (Get-PackageRoot($MyInvocation)) 'console.xml') -Force $env:appdata\console\console.xml

cinst ncrunch2.vs2013














