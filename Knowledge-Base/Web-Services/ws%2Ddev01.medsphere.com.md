# Project Notes (2/24/2021)

Key Vault Region
Central US


Need Vault in West US Region

DEVPOC virtual networks
msc-wus-vnet
msc-wus-vnet/msc-wus-vnet-dev-subnet1

Medsphere.com Domain Admin Credentials
u = brian.stockell_da
p = Winter2021^&*()


SPN updates made to Medsphere.com domain for DEVPOC.MEDSPHERE.COM

---
## POWERSHELL commands

```
setspn -L medsphere\mscferrari

setspn -u -s http/devpoc medsphere\mscferrari
setspn -u -s http/devpoc.medsphere.com medsphere\mscferrari

setspn -q MSSQLSvc/stlvmsql.medsphere.com:1433
```

---
## Console Results

PS C:\windows\system32> setspn -L medsphere\mscferrari
Registered ServicePrincipalNames for CN=MSCFERRARI,CN=ServiceAccounts,OU=AzureAD Connect Non-syncing,DC=medsphere,DC=com:
	http://stlvmsql.medsphere.com
	http://mscmgarber
	http://mscmgarber.medsphere.com
	http://stkl-ferrari.stockell.com
	http://stkl-ferrari

PS C:\windows\system32> setspn -u -s http/devpoc medsphere\mscferrari

Checking domain DC=medsphere,DC=com

Registering ServicePrincipalNames for CN=MSCFERRARI,CN=ServiceAccounts,OU=AzureAD Connect Non-syncing,DC=medsphere,DC=com
	http/devpoc
Updated object

PS C:\windows\system32> setspn -u -s http/devpoc.medsphere.com medsphere\mscferrari
Checking domain DC=medsphere,DC=com

Registering ServicePrincipalNames for CN=MSCFERRARI,CN=ServiceAccounts,OU=AzureAD Connect Non-syncing,DC=medsphere,DC=com
	http/devpoc.medsphere.com
Updated object

PS C:\windows\system32> setspn -L medsphere\mscferrari

Registered ServicePrincipalNames for CN=MSCFERRARI,CN=ServiceAccounts,OU=AzureAD Connect Non-syncing,DC=medsphere,DC=com:
	http/devpoc.medsphere.com
	http/devpoc
	http://stlvmsql.medsphere.com
	http://mscmgarber
	http://mscmgarber.medsphere.com
	http://stkl-ferrari.stockell.com
	http://stkl-ferrari

PS C:\windows\system32> setspn -q MSSQLSvc/stlvmsql.medsphere.com:1433
Checking domain DC=medsphere,DC=com
CN=SQLADMIN SQLADMIN,OU=Service Accounts,OU=Corp,DC=medsphere,DC=com
	MSSQLSvc/STLVMSQL.medsphere.com:1433
	MSSQLSvc/STLVMSQL.medsphere.com
	MSSQLSvc/stlvmsql:1433

Existing SPN found!

PS C:\windows\system32> 
