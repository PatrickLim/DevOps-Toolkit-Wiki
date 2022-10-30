# [rcmlab-sqlmi-dev](https://portal.azure.com/#@rcmdevops.onmicrosoft.com/resource/subscriptions/81348982-0f31-4e9c-b2d2-817ac65b967e/resourceGroups/rcmlab.sqlmi.scus.rg/providers/Microsoft.Sql/managedInstances/rcmlab-sqlmi-dev/overview)

> Azure SQL Managed Instance is the intelligent, scalable cloud database service that combines the broadest SQL Server database engine compatibility with the benefits of a fully managed and evergreen platform as a service. Kerberos authentication for Azure Active Directory (Azure AD) enables Windows Authentication access to Azure SQL Managed Instance. Windows Authentication for managed instances empowers customers to move existing services to the cloud while maintaining a seamless user experience and provides the basis for infrastructure modernization.
>

## Prerequisites

Deploy Windows Server 2022 Datacenter (ws2022) as the _management VM_ for SQL Managed Instance (SQLMI) configuration and connectivity via SQL Server Management Studio (SSMS)

- [ done ] - [Quickstart: Configure an Azure VM to connect to Azure SQL Managed Instance](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instanceconnect-vm-instance-configure?view=azuresql)

  - [ done ] - [Prepare the VM](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/connect-vm-instance-configure?view=azuresql#prepare-the-azure-virtual-machine)

  - [ done ] - [Deploy VM template to Azure](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjovanpop-msft%2Fazure-quickstart-templates%2Fsql-win-vm-w-tools%2F201-vm-win-vnet-sql-tools%2Fazuredeploy.json)

- [ in progress ] - [Modern interactive authentication flow](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-setup?view=azuresql#modern-interactive-authentication-flow)

  - [ open ] - [Configure Azure SQL Managed Instance](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-setup?view=azuresql#configure-azure-sql-managed-instance)

    - [ done ] - [Prerequisites to configure a managed instance](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-setup?view=azuresql#prerequisites-to-configure-a-managed-instance)

## [rcmlab-ws2022-ssms](https://portal.azure.com/#@rcmdevops.onmicrosoft.com/resource/subscriptions/81348982-0f31-4e9c-b2d2-817ac65b967e/resourcegroups/rcmlab.sqlmi.scus.rg/providers/Microsoft.Compute/virtualMachines/rcmlab-ws2022-ssms/overview)

> Note: **Device Name** of the SQLMI management VM has been truncated:

> - Azure Resource Name: rcmlab-ws2022-ssms
> - Device Name: **rcmlab-ws2022-s**

```powershell
# Clients must be joined to Azure AD or Hybrid Azure AD. You can determine if this prerequisite is met by running the dsregcmd command:

dsregcmd.exe /status

# This PowerShell module provides management cmdlets for Azure SQL resources. Install this module by running the following PowerShell command:

Install-Module -Name Az.Sql
Update-Module -Name Az.Sql

# This module provides management cmdlets for Azure AD administrative tasks such as user and service principal management. Install this module by running the following PowerShell command:

Install-Module -Name AzureAD
Update-Module -Name AzureAD

```

- SQL Managed Instance --> Identity --> System assigned service principle --> ON

### links to documentation and tutorials

- [Plan and implement data platform resources](https://learn.microsoft.com/en-us/training/paths/plan-implement-data-platform-resources/)
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
