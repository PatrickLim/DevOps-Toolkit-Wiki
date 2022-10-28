# [RCMLAB](https://portal.azure.com/#@rcmdevops.onmicrosoft.com/dashboard/arm/subscriptions/81348982-0f31-4e9c-b2d2-817ac65b967e/resourcegroups/dashboards/providers/microsoft.portal/dashboards/31c91306-384d-4ce4-bcb0-cbc2f759f674)

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

### links to documentation and tutorials

- <https://learn.microsoft.com/en-us/azure/active-directory-domain-services/tutorial-create-instance>
- <https://learn.microsoft.com/en-us/azure/active-directory-domain-services/powershell-scoped-synchronization>
-

## [rcmlab-sqlmi-dev](https://portal.azure.com/#@rcmdevops.onmicrosoft.com/resource/subscriptions/81348982-0f31-4e9c-b2d2-817ac65b967e/resourceGroups/rcmlab.sqlmi.scus.rg/providers/Microsoft.Sql/managedInstances/rcmlab-sqlmi-dev/overview)

> Azure SQL Managed Instance is the intelligent, scalable cloud database service that combines the broadest SQL Server database engine compatibility with the benefits of a fully managed and evergreen platform as a service. Kerberos authentication for Azure Active Directory (Azure AD) enables Windows Authentication access to Azure SQL Managed Instance. Windows Authentication for managed instances empowers customers to move existing services to the cloud while maintaining a seamless user experience and provides the basis for infrastructure modernization.
>

### Prerequisites

- _Management VM_ + SQLMI + SSMS
  - [ active ] - [Quickstart: Configure an Azure VM to connect to Azure SQL Managed Instance](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instanceconnect-vm-instance-configure?view=azuresql)
  - [ done ] - [Prepare the VM](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/connect-vm-instance-configure?view=azuresql#prepare-the-azure-virtual-machine)
  - [ done ] - [Deploy VM template to Azure](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjovanpop-msft%2Fazure-quickstart-templates%2Fsql-win-vm-w-tools%2F201-vm-win-vnet-sql-tools%2Fazuredeploy.json)
  - [ open ] - next

### updates to resource configurations

- SQL Managed Instance --> Identity --> System assigned service principle --> ON

### links to documentation and tutorials

- [SQLMI + Windows Authentication + Azure AD](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-overview?view=azuresql#lift-and-shift-on-premises-sql-servers-to-azure-with-minimal-changes)
- [Lift+Shift on-premises SQL Servers to Azure with minimal changes](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-overview?view=azuresql#lift-and-shift-on-premises-sql-servers-to-azure-with-minimal-changes)
- 

---
## How to connect to VMs in RCMLAB?

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
-

