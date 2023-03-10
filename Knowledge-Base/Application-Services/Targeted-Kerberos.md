Instead of using ADUC (Active Directory Users and Computers) to enable Kerberos for the sql and web servers and runner accounts, this method uses Powershell commands to properly configure the Kerberos credential chain between the SQL Server, IIS Server, and SSRS Server.

In this example, assume two domain accounts: domain\ABCWEB runs both SSRS and IIS (the application pools), and domain\ABCSQL runs the SQL Server engine.

Start a Powershell session and do the following:

1. use setspn.exe to assign the http service class SPN's for IIS and SSRS to domain\ABCWEB
2. use setspn.exe to assign the mssqlsvc service class SPN's for the SQL Server engine to domain\ABCSQL
3. $sqlguy = get-aduser -identity ABCSQL
4. $webguy = get-aduser -identity ABCWEB
5. Set-ADUser -Identity $sqlguy -PrincipalsAllowedToDelegateToAccount $webguy
6. Set-ADUser -Identity $webguy -PrincipalsAllowedToDelegateToAccount $webguy

This means ABCSQL respects ABCWEB, so that any applications that ABCWEB is running (in this case IIS and SSRS) can double-hop the Windows Identity to any application that ABCSQL is running (in this case the SQL Server Engine).

Also note that ABCWEB respects ABCWEB, which may seem redundant. This is needed for the Kerberos chain between IIS and SSRS.

IMPORTANT! the appserver should also respect the webserver, because the webapp needs access to fileshares on the appserver.

1. $appvm = get-adcomputer -identity ap01e1-ABC
2. $webvm = get-adcomputer -identity wb01e1-ABC
3. set-adcomputer -identity $appvm -PrincipalsAllowedToDelegateToAccount $webvm

To check which accounts are allowed to delegate to any account, run the following in Powershell:

1. $x = Get-ADUser -Identity $sqlguy -Properties msDS-AllowedToActOnBehalfOfOtherIdentity
2. $x.'msDS-AllowedToActOnBehalfOfOtherIdentity'.Access

For the Proxy Appliance to work, ABCWEB also needs to delegate to the MACHINE account that hosts the proxy appliance service.

If using the Proxy Appliance, ABCWEB unfortunately cannot delegate to both ABCWEB and the MACHINE account (Kerberos limitation -- cannot have a mix of user and machine accounts). So ABCWEB should delegate to two MACHINE accounts -- the one that hosts the proxy appliance service and the one that hosts the SSRS service. For example, if the proxy appliance service is running on rcmlab-iis and the SSRS service is running on rcmlab-ssrs:

1. $iisvm = get-adcomputer -identity rcmlab-iis
2. $ssrsvm = get-adcomputer -identity rcmlab-ssrs
3. Set-ADUser -Identity $webguy -PrincipalsAllowedToDelegateToAccount $iisvm, $ssrsvm

Add-WindowsFeature RSAT-AD-PowerShell
Import-Module ActiveDirectory
Get-Command -ParameterName PrincipalsAllowedToDelegateToAccount
