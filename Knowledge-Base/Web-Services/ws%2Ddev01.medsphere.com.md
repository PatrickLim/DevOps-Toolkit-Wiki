# Project Notes (10/27/2021)

SPN updates made to Medsphere.com domain for WS-DEV01.MEDSPHERE.COM

---
## POWERSHELL commands

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

