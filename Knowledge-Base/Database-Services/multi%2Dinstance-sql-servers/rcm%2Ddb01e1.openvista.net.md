2C9JR-K3RNG-QD4M4-JQ2HR-8468J

SSRS
openvista\aatrcmpbi

encryption key
S:\ssrs encryption keys\feb-18-2021\ssrs-aatrcmpbi-encrypt-key-feb-18-2021.snk
M3dsph3r3!2019

---
# Copied the following from the rcm-db02e1 page

- SPN's are centralized.
- These are for the SQL Engines (they all have to belong to the same service account):
```
setspn -u -s MSSQLSvc/rcm-db02e1.openvista.net:1433 openvista\crmcsql
setspn -u -s MSSQLSvc/rcm-db02e1.openvista.net openvista\crmcsql
setspn -u -s MSSQLSvc/rcm-db02e1.openvista.net:55422 openvista\crmcsql
setspn -u -s MSSQLSvc/rcm-db02e1.openvista.net:CRMC openvista\crmcsql
setspn -u -s MSSQLSvc/rcm-db02e1.openvista.net:56783 openvista\crmcsql
setspn -u -s MSSQLSvc/rcm-db02e1.openvista.net:SOM openvista\crmcsql

setspn -u -s MSOLAPSvc.3/rcm-db02e1.openvista.net:SOM openvista\crmcsql
setspn -u -s MSOLAPSvc.3/rcm-db02e1:SOM openvista\crmcsql
```
- These are for the Report Server Power BI website:
```
setspn -u -s http/rcm-db02e1.openvista.net openvista\aatrcmpbi
setspn -u -s http/rcm-db02e1 openvista\aatrcmpbi
```
---
# Review SPNs _configured_ on rcm-db01e1.openvista.net

- _SQL Default Instance rcm-db01e1_ : openvista\aatrcmpbi
- _SQL Named Instance rcm-db01e1\aat_ : openvista\aatrcmpbi
- _SSRS Service_ : openvista\aatrcmpbi

```
PS C:\windows\system32> setspn -L openvista\aatrcmpbi

Registered ServicePrincipalNames for CN=aat rcmpbi,OU=Service Accounts,OU=Users,OU=Ashley Addiction Treatment (AAT),OU=Cloud OpenVista,DC=openvista,DC=net:
	MSSQLSvc/rcm-db02e1.openvista.net:AAT
	MSSQLSvc/rcm-db02e1.openvista.net:50058
	http/rcm-db02e1
	http/rcm-db02e1.openvista.net
	MSOLAPSvc.3/rcm-db02e1:AAT
	MSOLAPSvc.3/rcm-db02e1.openvista.net:AAT
	MSSQLSvc/rcm-db01e1.openvista.net:1433
	MSSQLSvc/rcm-db01e1.openvista.net:50524
	MSSQLSvc/rcm-db01e1.openvista.net:AAT
	MSOLAPSvc.3/rcm-db01e1
	MSOLAPSvc.3/rcm-db01e1.openvista.net
	MSSQLSvc/rcm-db01e1
	MSSQLSvc/rcm-db01e1.openvista.net
	MSOLAPSvc.3/rcm-db01e1:AAT
	MSOLAPSvc.3/rcm-db01e1.openvista.net:AAT
```

## openvista\aatrcmsql

```
PS C:\windows\system32> setspn -L openvista\aatrcmsql
Registered ServicePrincipalNames for CN=aat rcmsql,OU=Service Accounts,OU=Users,OU=Ashley Addiction Treatment (AAT),OU=Cloud OpenVista,DC=openvista,DC=net:
```

## rcm-db01e1 & rcm-db02e1

```
PS C:\windows\system32> 
setspn -L rcm-db01e1
setspn -L rcm-db02e1

Registered ServicePrincipalNames for CN=rcm-db01e1,OU=SQL Servers East US,OU=SQL Servers,OU=RCM,OU=Computers,OU=MSC,DC=openvista,DC=net:
	WSMAN/rcm-db01e1
	WSMAN/rcm-db01e1.openvista.net
	TERMSRV/RCM-DB01E1
	TERMSRV/rcm-db01e1.openvista.net
	RestrictedKrbHost/rcm-db01e1
	HOST/rcm-db01e1
	RestrictedKrbHost/rcm-db01e1.openvista.net
	HOST/rcm-db01e1.openvista.net
Registered ServicePrincipalNames for CN=rcm-db02e1,OU=SQL Servers East US,OU=SQL Servers,OU=RCM,OU=Computers,OU=MSC,DC=openvista,DC=net:
	WSMAN/rcm-db02e1
	WSMAN/rcm-db02e1.openvista.net
	TERMSRV/RCM-DB02E1
	TERMSRV/rcm-db02e1.openvista.net
	RestrictedKrbHost/rcm-db02e1
	HOST/rcm-db02e1
	RestrictedKrbHost/rcm-db02e1.openvista.net
	HOST/rcm-db02e1.openvista.net
```

---
# Create SPNs for SQL Default Instance

- _Service Account_ : openvista\rcmdb01e1defaultsql

```
setspn -u -s MSSQLSvc/rcm-db01e1 openvista\rcmdb01e1defaultsql
setspn -u -s MSSQLSvc/rcm-db01e1.openvista.net openvista\rcmdb01e1defaultsql
setspn -u -s MSSQLSvc/rcm-db01e1:1433 openvista\rcmdb01e1defaultsql
setspn -u -s MSSQLSvc/rcm-db01e1.openvista.net:1433 openvista\rcmdb01e1defaultsql

setspn -u -s http/rcm-db01e1 openvista\rcmdb01e1defaultsql
setspn -u -s http/rcm-db01e1.openvista.net openvista\rcmdb01e1defaultsql

setspn -L openvista\rcmdb01e1defaultsql
```

## Kerberos Configuration Manager

![image.png](https://dev.azure.com/limlab/bb0e22cd-eff0-4e63-82dc-2e54a075d32a/_apis/wiki/wikis/d8c97a3d-4543-4bca-8575-e841adf3416e/pages/224/comments/attachments/64e84e9d-2ae4-4bbe-b2a6-16e64c73ff32)

![image.png](https://dev.azure.com/limlab/bb0e22cd-eff0-4e63-82dc-2e54a075d32a/_apis/wiki/wikis/d8c97a3d-4543-4bca-8575-e841adf3416e/pages/224/comments/attachments/21b91e39-d370-4355-8e18-b8a9071dcbc1) 


# RESOLUTION (pending...)

# Applied latest SQL 2019 CU to RCM-DB01E1

Please reference the following link for details

- [Apply SQL 2019 CU](/Knowledge-Base/Database-Services/multi%2Dinstance-sql-servers/rcm%2Ddb01e1.openvista.net/Apply-SQL-2019-CU)

# Deployed new virtual network interface to RCM-DB01E1
Please reference the following link for details

- [Remove Accelerated Networking](/Knowledge-Base/Database-Services/multi%2Dinstance-sql-servers/rcm%2Ddb01e1.openvista.net/Remove-Accelerated-Networking)



