# Project Notes (10/27/2021)

Deploy RCM Cloud 2019.3.7 to the Wellsoft Development environment on `ws-dev01.medsphere.com`

---
## SQL Databases
- stlvmsql.dbo.IcsMedsphereWS
- stlvmsql.dbo.CollectorWS
- stlvmsql.dbo.SislnkWS

---
## Application Services
asldjflaksdjfl;asdjfl;jasdl;fjl;asdjf

---
## Web Services

- RCM Cloud 2019.1
  - https://ws-dev01.medsphere.com:20191/Shell/#/workspaces/Scheduling
- RCM Cloud 2019.3.7
  - https://ws-dev01.medsphere.com:20193/Shell/#/workspaces/Scheduling
- Reporting Services
  - http://stlvmsql.medsphere.com/reports/browse/IcsMedsphereWS

---
## POWERSHELL commands to update SPNs in `medsphere.com` domain

```
setspn -L medsphere\mscferrari

setspn -u -s http/ws-dev01 medsphere\mscferrari
setspn -u -s http/ws-dev01.medsphere.com medsphere\mscferrari
```

## Console Results

```
Windows PowerShell
Copyright (C) 2014 Microsoft Corporation. All rights reserved.

PS C:\Users\brian.stockell> setspn -L medsphere\mscferrari
Registered ServicePrincipalNames for CN=MSCFERRARI,CN=ServiceAccounts,OU=AzureAD Connect Non-syncing,DC=medsphere,DC=com
:
        http/ws-dev01.medsphere.com
        http/ws-dev01
        http/devpoc.openvista.net
        http/devpoc
        http://stlvmsql.medsphere.com
        http://mscmgarber
        http://mscmgarber.medsphere.com
        http://stkl-ferrari.stockell.com
        http://stkl-ferrari
PS C:\Users\brian.stockell>
```

