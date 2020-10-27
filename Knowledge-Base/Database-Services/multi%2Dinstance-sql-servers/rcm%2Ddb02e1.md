SPN's are centralized.

These are for the SQL Engines (they all have to belong to the same service account):

setspn -u -s MSSQLSvc/rcm-db02e1.openvista.net:1433 openvista\crmcsql
setspn -u -s MSSQLSvc/rcm-db02e1.openvista.net openvista\crmcsql
setspn -u -s MSSQLSvc/rcm-db02e1.openvista.net:55422 openvista\crmcsql
setspn -u -s MSSQLSvc/rcm-db02e1.openvista.net:CRMC openvista\crmcsql
setspn -u -s MSSQLSvc/rcm-db02e1.openvista.net:56783 openvista\crmcsql
setspn -u -s MSSQLSvc/rcm-db02e1.openvista.net:SOM openvista\crmcsql

setspn -u -s MSOLAPSvc.3/rcm-db02e1.openvista.net:SOM openvista\crmcsql
setspn -u -s MSOLAPSvc.3/rcm-db02e1:SOM openvista\crmcsql

this is for the Report Server Power BI website:

setspn -u -s http/rcm-db02e1.openvista.net openvista\aatrcmpbi
setspn -u -s http/rcm-db02e1 openvista\aatrcmpbi