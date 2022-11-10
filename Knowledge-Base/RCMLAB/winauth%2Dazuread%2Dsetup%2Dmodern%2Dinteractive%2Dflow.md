# [rcmlab-sqlmi-dev](https://portal.azure.com/#@rcmdevops.onmicrosoft.com/resource/subscriptions/81348982-0f31-4e9c-b2d2-817ac65b967e/resourceGroups/rcmlab.sqlmi.scus.rg/providers/Microsoft.Sql/managedInstances/rcmlab-sqlmi-dev/overview)

> Azure SQL Managed Instance is the intelligent, scalable cloud database service that combines the broadest SQL Server database engine compatibility with the benefits of a fully managed and evergreen platform as a service. Kerberos authentication for Azure Active Directory (Azure AD) enables Windows Authentication access to Azure SQL Managed Instance. Windows Authentication for managed instances empowers customers to move existing services to the cloud while maintaining a seamless user experience and provides the basis for infrastructure modernization.

- [ done ] - [Quickstart: Configure an Azure VM to connect to Azure SQL Managed Instance](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instanceconnect-vm-instance-configure?view=azuresql)

  - [ done ] - [Prepare the VM](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/connect-vm-instance-configure?view=azuresql#prepare-the-azure-virtual-machine)

  - [ done ] - [Deploy VM template to Azure](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjovanpop-msft%2Fazure-quickstart-templates%2Fsql-win-vm-w-tools%2F201-vm-win-vnet-sql-tools%2Fazuredeploy.json)

  - [ done ] - [Prerequisites to configure a managed instance](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-setup?view=azuresql#prerequisites-to-configure-a-managed-instance)

> SQL Managed Instance --> Identity --> System assigned service principle --> ON

---

## [Modern interactive authentication flow](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-setup?view=azuresql#modern-interactive-authentication-flow)

- [ done ] - [Configure Azure SQL Managed Instance](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-setup?view=azuresql#configure-azure-sql-managed-instance)

- [ in progress ] - [Setup modern interactive flow Group Policy](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-setup-modern-interactive-flow?view=azuresql#configure-group-policy)

---

## [Incoming trust-based flow](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-setup?view=azuresql#incoming-trust-based-authentication-flow)

### [Install Azure AD Hybrid Authentication Management PowerShell Module](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-setup-incoming-trust-based-flow?view=azuresql#install-the-azure-ad-hybrid-authentication-management-powershell-module)

- Start a Windows PowerShell session with the Run as administrator option. nstall the Azure AD Hybrid Authentication Management PowerShell module sing the following script. The script:
  - Enables TLS 1.2 for communication.
  - Installs the NuGet package provider.
  - Registers the PSGallery repository.
  - Installs the PowerShellGet module.
  - Installs the Azure AD Hybrid Authentication Management PowerShell module. The Azure AD Hybrid Authentication Management PowerShell uses the AzureADPreview module, which provides advanced Azure AD management feature.
  - To protect against unnecessary installation conflicts with AzureAD PowerShell module, this command includes the –AllowClobber option flag.

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 

Install-PackageProvider -Name NuGet -Force 

if (@(Get-PSRepository | ? {$_.Name -eq "PSGallery"}).Count -eq 0){ 
    Register-PSRepository -DefaultSet-PSRepository -Name "PSGallery" -InstallationPolicy Trusted 
} 

Install-Module -Name PowerShellGet -Force 

Install-Module -Name AzureADHybridAuthenticationManagement -AllowClobber
```

### [Create the Trusted Domain Object](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-setup-incoming-trust-based-flow?view=azuresql#create-the-trusted-domain-object)

- <https://learn.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sso>
- <https://learn.microsoft.com/en-us/azure/active-directory/devices/concept-primary-refresh-token#what-does-the-prt-contain>
- <https://learn.microsoft.com/en-us/azure/active-directory/devices/concept-primary-refresh-token#prt-issuance-during-first-sign-in>

---

## [rcmlab-ws2022-ssms](https://portal.azure.com/#@rcmdevops.onmicrosoft.com/resource/subscriptions/81348982-0f31-4e9c-b2d2-817ac65b967e/resourcegroups/rcmlab.sqlmi.scus.rg/providers/Microsoft.Compute/virtualMachines/rcmlab-ws2022-ssms/overview)

> Deploy Windows Server 2022 Datacenter (ws2022) as the management VM for SQL Managed Instance (sqlmi) configuration and connectivity via SQL Server Management Studio (ssms). Please note Azure VM **_Device Name_** has been truncated based on the Azure Resource Name: rcmlab-ws2022-ssms --> **_rcmlab-ws2022-s_**

- Required Microsoft Updates

  - [KB5012170: Security update for Secure Boot DBX: August 9, 2022](https://support.microsoft.com/en-us/topic/kb5012170-security-update-for-secure-boot-dbx-august-9-2022-72ff5eed-25b4-47c7-be28-c42bd211bb15)

  - [October 11, 2022-KB5018551](https://support.microsoft.com/en-us/topic/october-11-2022-kb5018551-cumulative-update-for-net-framework-3-5-4-8-and-4-8-1-for-microsoft-server-operating-system-version-21h2-cfee4e3e-c48e-44eb-bbf3-b208e16b17f2)

  - [October 25, 2022—KB5018485 (OS Build 20348.1194) Preview](https://support.microsoft.com/en-us/topic/october-25-2022-kb5018485-os-build-20348-1194-preview-becf7d1a-9482-4d56-955d-097e35b992a4)

  - [October 25, 2022-KB5018860 Cumulative Update Preview for .NET Framework 3.5, 4.8 and 4.8.1 for Microsoft server operating system version 21H2](https://support.microsoft.com/en-us/topic/october-25-2022-kb5018860-cumulative-update-preview-for-net-framework-3-5-4-8-and-4-8-1-for-microsoft-server-operating-system-version-21h2-353265cc-c9cd-4bf0-b188-909277209abf)

- Required PowerShell commands

```powershell
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
```

> [download powershell script](../../.attachments/PSModules-Required-to-manage-SQLMI.ps1)

---

### links to documentation and tutorials

- [Chose the right authentication method for your Azure AD hybrid identity solution](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/choose-ad-authn)

- [Decision tree](https://learn.microsoft.com/en-us/azure/active-directory/brid/choose-ad-authn#decision-tree)

- <https://learn.microsoft.com/en-us/azure/active-directory/authentication/torial-enable-sspr>

- <https://learn.microsoft.com/en-us/azure/active-directory/app-proxy/plication-proxy-configure-single-sign-on-with-kcd?source=recommendations>

- <https://learn.microsoft.com/en-us/azure/active-directory/app-proxy/plication-proxy-configure-single-sign-on-with-kcd?source=recommendations>

- <https://learn.microsoft.com/en-us/azure/active-directory-domain-services/eate-ou>

- <https://learn.microsoft.com/en-us/azure/active-directory-domain-services/compare-identity-solutions#azure-ad-ds-and-self-managed-ad-ds>

- <https://learn.microsoft.com/en-us/azure/active-directory-domain-services/scenarios?source=recommendations#azure-ad-ds-for-hybrid-organizations>

- <https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd759186(v=ws.11>

- <https://learn.microsoft.com/en-us/azure/active-directory/app-proxy/application-proxy-back-end-kerberos-constrained-delegation-how-to>

- <https://labdevsmi-rcmdevops.msappproxy.net/>

- [Make Your Azure SQL Managed Instance Passwordless](https://techcommunity.microsoft.com/t5/azure-sql-blog/make-your-azure-sql-managed-instance-passwordless/ba-p/2908166)
- [Plan and implement data platform resources](https://learn.microsoft.com/en-us/training/paths/plan-implement-data-platform-resources/)
- [SQLMI + Windows Authentication + Azure AD](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-overview?view=azuresql#lift-and-shift-on-premises-sql-servers-to-azure-with-minimal-changes)
- [Lift+Shift on-premises SQL Servers to Azure with minimal changes](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-overview?view=azuresql#lift-and-shift-on-premises-sql-servers-to-azure-with-minimal-changes)

---

### links to offical Microsoft Developer videos

- [Data Exposed](https://www.youtube.com/watch?v=SXBHtE_eXdI&t=6s)

```Markdown
- 1,073 views  Sep 15, 2022
- In this episode of Data Exposed with Anna Hoffman and Sravani Saluru
- they'll discuss the benefits of the newly announced  Windows Authentication for Azure AD principals
- now Generally Available on SQL Managed instance!
```

`SELECT name, compatibility_level FROM sys.databases;`

- [Learn Live - Secure Azure SQL and Deliver Consistent Performance | Azure SQL Bootcamp (Session 2)](https://www.youtube.com/watch?v=WXNRU82x1vs)

Azure SQL Security topics
RBAC @ +30min...

https://www.youtube.com/watch?v=WXNRU82x1vs

