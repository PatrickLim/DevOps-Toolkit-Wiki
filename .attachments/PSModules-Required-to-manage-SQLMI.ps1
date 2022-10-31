# Clients must be joined to Azure AD or Hybrid Azure AD. You can determine if this prerequisite is met by running the dsregcmd command:

dsregcmd.exe /status

# Azure AD cached logon: Windows limits how often it connects to Azure AD, so there is a potential for user accounts to not have a refreshed Kerberos Ticket Granting Ticket (TGT) within 4 hours of an upgrade or fresh deployment of a client machine.
# As an administrator, you can trigger an online logon immediately to handle upgrade scenarios by running the following command on the client machine, then locking and unlocking the user session to get a refreshed TGT:

dsregcmd.exe /RefreshPrt

# This module allows the device to interact with Azure accounts
# use -AllowClobber parameter as needed

Install-Module Az.Accounts # - AllowClobber

# This PowerShell module provides management cmdlets for Azure SQL resources.

Install-Module -Name Az.Sql
Update-Module -Name Az.Sql

# This module provides management cmdlets for Azure AD administrative tasks such as user and service principal management.

Install-Module -Name AzureAD
Update-Module -Name AzureAD

