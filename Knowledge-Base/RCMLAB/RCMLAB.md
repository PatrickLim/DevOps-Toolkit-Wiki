# rcmdevops.onmicrosoft.com

- <https://portal.azure.com/#blade/HubsExtension/BrowseAll>

---

## rcmlab-jump

- install .NET Framwork 3.5 Features
  - .NET 2.0 / 3.0
- install Remote Server Administration Tools
  - Role Administration Tools
    - AD DS and AD LDS Tools
      - Active Directory Administrative Center
      - AD DS Snap-Ins and Commmand-Line Tools
    - DNS Server Tools
- install [VS Code](https://code.visualstudio.com/docs/?dv=win64)
- install [git](https://git-scm.com/download/win)
- 

## [rcmlab.local](https://portal.azure.com/#@rcmdevops.onmicrosoft.com/resource/subscriptions/81348982-0f31-4e9c-b2d2-817ac65b967e/resourceGroups/rcmlab.aadds.rg/providers/Microsoft.AAD/DomainServices/rcmlab.local/overview)

> Azure Active Directory Domain Services (Azure AD DS) provides managed domain services such as domain join, group policy, LDAP, Kerberos/NTLM authentication that is fully compatible with Windows Server Active Directory. You consume these domain services without deploying, managing, and patching domain controllers yourself. Azure AD DS integrates with your existing Azure AD tenant. This integration lets users sign in using their corporate credentials, and you can use existing groups and user accounts to secure access to resources.
>

- DNS domain name: **rcmlab.local**
- IP addresses: **Central US/192.168.77.5 192.168.77.4**
- Forest type: User
- Virtual Networks/Subnets: Central US/rcmlab.vnet/rcmlab.vnet.subnet.aadds
- Network security groups: Central US/aadds-nsg
- Admin group: AAD DC Administrators

links to AADDS documentation used during configuration

- <https://learn.microsoft.com/en-us/azure/active-directory-domain-services/tutorial-create-instance>

- <https://learn.microsoft.com/en-us/azure/active-directory-domain-services/powershell-scoped-synchronization>
-

# faqs

How do we connect to VMs in RCMLAB?

<https://portal.azure.com/#@rcmdevops.onmicrosoft.com/resource/subscriptions/81348982-0f31-4e9c-b2d2-817ac65b967e/resourceGroups/rcmlab.jump.rg/providers/Microsoft.Compute/virtualMachines/rcmlab-jump/bastionHost>

simply provide your username and password only; do not include domain names (see below)

- email - brian@rcmdevops.onmicrosoft.com
- **username - brian**
- AAD domain - rcmdevops.onmicrosoft.com
- AADDS domain - rcmlab.local

---
