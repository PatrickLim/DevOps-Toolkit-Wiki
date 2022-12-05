# rcmlab.local

[[_TOC_]]

## [rcmlab.dashboard](https://portal.azure.com/#@rcmdevops.onmicrosoft.com/dashboard/arm/subscriptions/81348982-0f31-4e9c-b2d2-817ac65b967e/resourcegroups/dashboards/providers/microsoft.portal/dashboards/31c91306-384d-4ce4-bcb0-cbc2f759f674)

## [rcmlab.local](https://portal.azure.com/#@rcmdevops.onmicrosoft.com/resource/subscriptions/81348982-0f31-4e9c-b2d2-817ac65b967e/resourceGroups/rcmlab.aadds.rg/providers/Microsoft.AAD/DomainServices/rcmlab.local/overview)

> Azure Active Directory Domain Services (Azure AD DS) provides managed domain services such as domain join, group policy, LDAP, Kerberos/NTLM authentication that is fully compatible with Windows Server Active Directory. You consume these domain services without deploying, managing, and patching domain controllers yourself. Azure AD DS integrates with your existing Azure AD tenant. This integration lets users sign in using their corporate credentials, and you can use existing groups and user accounts to secure access to resources.
>

- Azure AD tenant - **rcmdevops.onmicrosoft.com**
- Azure AD DS domain - **rcmlab.local**
- DNS domain name: rcmlab.local
- IP addresses: **Central US/192.168.77.5 192.168.77.4**
- Forest type: User
- Virtual Networks/Subnets: **Central US/rcmlab.vnet/rcmlab.vnet.subnet.aadds**
- Network security groups: Central US/aadds-nsg
- Admin group: AAD DC Administrators

> links to documentation and tutorials

- <https://learn.microsoft.com/en-us/azure/active-directory-domain-services/tutorial-create-instance>
- <https://learn.microsoft.com/en-us/azure/active-directory-domain-services/powershell-scoped-synchronization>
-

## how to connect to virtual machines in rcmlab?

> [Bastions](https://portal.azure.com/#@rcmdevops.onmicrosoft.com/resource/subscriptions/81348982-0f31-4e9c-b2d2-817ac65b967e/resourceGroups/rcmlab.jump.rg/providers/Microsoft.Compute/virtualMachines/rcmlab-jump/bastionHost) simply provide your username and password only; do not include domain names (see below)

- email - brian@rcmdevops.onmicrosoft.com
- **username - brian**
- AAD domain - rcmdevops.onmicrosoft.com
- AADDS domain - rcmlab.local

## [rcmlab-jump](https://portal.azure.com/#@rcmdevops.onmicrosoft.com/resource/subscriptions/81348982-0f31-4e9c-b2d2-817ac65b967e/resourceGroups/rcmlab.jump.rg/providers/Microsoft.Compute/virtualMachines/rcmlab-jump/bastionHost)

> Azure VM configured for remote access to RCMLAB environment via Bastion

### features and tools

- .NET Framwork 3.5 Features
  - .NET 2.0 / 3.0
- Remote Server Administration Tools
  - Role Administration Tools
    - AD DS and AD LDS Tools
      - Active Directory Administrative Center
      - AD DS Snap-Ins and Commmand-Line Tools
    - DNS Server Tools
- [VS Code](https://code.visualstudio.com/docs/?dv=win64)
- [git](https://git-scm.com/download/win)
- [VS 2022 Enterprise](https://visualstudio.microsoft.com/vs/enterprise/)
- [Microsoft SQL Server Backup to Microsoft Azure Tool](https://www.microsoft.com/en-us/download/details.aspx?id=40740)
- [SQL Server Data-Tier Application Framework](https://learn.microsoft.com/en-us/sql/tools/sqlpackage/sqlpackage-download?view=sql-server-ver16#dacfx)
- [SQL Server Management Objects](https://learn.microsoft.com/en-us/sql/relational-databases/server-management-objects-smo/installing-smo?view=sql-server-ver16)
- [Windows PowerShell Extensions for Microsoft SQL Server](https://learn.microsoft.com/en-us/sql/database-engine/install-windows/install-sql-server-powershell?view=sql-server-ver16)
- [System CLR Types](https://www.microsoft.com/en-us/download/details.aspx?id=100451)
-
