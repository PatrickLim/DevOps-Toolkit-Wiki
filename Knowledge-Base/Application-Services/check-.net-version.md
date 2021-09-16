https://cyberark-customers.force.com/s/article/00004276

To verify the currently installed/registered version of .NET, run the following command from Powershell:

(Get-ItemProperty ‘HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full’ -Name Release).Release

The output of the command will determine which version is installed:
.NET Framework 4.5.2 = 379893
.NET Framework 4.6.2 = 394806
.NET Framework 4.7.1 = 461310
.NET Framework 4.7.2 = 461814
.NET Framework 4.8    = 428049 or 528049
You can also verify the appropriate version of .NET Framework by running the following PowerShell command:

Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse | Get-ItemProperty -name Version,Release -EA 0 | Where { $_.PSChildName -match 'Full'} | Select PSChildName, Version, Release

If you see "No updates are installed on this computer" in the "Installed Updates" then start the following services:
Windows Update
Windows Modules Installer 