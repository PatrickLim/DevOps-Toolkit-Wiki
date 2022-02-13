https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/ps-remoting-second-hop?view=powershell-7.1

https://docs.microsoft.com/en-us/azure/active-directory-domain-services/deploy-kcd

Add-WindowsFeature RSAT-AD-PowerShell
Import-Module ActiveDirectory
Get-Command -ParameterName PrincipalsAllowedToDelegateToAccount

# Set up variables for reuse

```
$ServerA = $env:COMPUTERNAME
$ServerB = Get-ADComputer -Identity ServerB
$ServerC = Get-ADComputer -Identity ServerC
```


`Set-ADUser -Identity $ServerC -PrincipalsAllowedToDelegateToAccount $null`

# Grant resource-based Kerberos constrained delegation
`Set-ADComputer -Identity $ServerC -PrincipalsAllowedToDelegateToAccount $ServerB`

# Check the value of the attribute directly

```
$x = Get-ADComputer -Identity $ServerC -Properties msDS-AllowedToActOnBehalfOfOtherIdentity
$x.'msDS-AllowedToActOnBehalfOfOtherIdentity'.Access
```


# Check the value of the attribute indirectly
`Get-ADComputer -Identity $ServerC -Properties PrincipalsAllowedToDelegateToAccount`

https://docs.microsoft.com/en-us/windows-server/security/group-managed-service-accounts/configure-kerberos-delegation-group-managed-service-accounts

https://docs.microsoft.com/en-us/windows-server/security/group-managed-service-accounts/configure-kerberos-delegation-group-managed-service-accounts

https://4sysops.com/archives/how-to-configure-computer-delegation-with-powershell/
