when restoring from MODEL, after running update paths here are some additional updates:

select * from GLOBAL_REGISTRY where REGISTRY_KEY = 'REPORT_SERVER_URL'
update GLOBAL_REGISTRY set VALUE2 = 'https://rcm-db01w1.openvista.net/ReportServer' where REGISTRY_KEY = 'REPORT_SERVER_URL'

update report_mstr set report_definition = replace (report_definition, '/Insight/', '/SMG/')
update report_mstr set report_definition = replace (report_definition, '/InsightCS/', '/SMG/smg-rcm/')

UPDATE REPORTING_REPORT_PROPERTIES SET DATA_PATH = REPLACE(DATA_PATH, '/Insight/', '/SMG/')
UPDATE REPORTING_REPORT_PROPERTIES SET DATA_PATH = REPLACE(DATA_PATH, '/InsightCS/', '/SMG/smg-rcm/')


SPN's are centralized.

These are for the SQL Engines (they all have to belong to the same service account):

setspn -u -s MSSQLSvc/rcm-db01w1.openvista.net:1433 openvista\chlbrcmsql
setspn -u -s MSSQLSvc/rcm-db01w1.openvista.net openvista\chlbrcmsql
setspn -u -s MSSQLSvc/rcm-db01w1.openvista.net:50088 openvista\chlbrcmsql
setspn -u -s MSSQLSvc/rcm-db01w1.openvista.net:CHLB openvista\chlbrcmsql
setspn -u -s MSSQLSvc/rcm-db01w1.openvista.net:63694 openvista\chlbrcmsql
setspn -u -s MSSQLSvc/rcm-db01w1.openvista.net:SMG openvista\chlbrcmsql

this is for the Report Server Power BI website:

setspn -u -s http/rcm-db01w1.openvista.net openvista\rcmdb01w1defaultsql
setspn -u -s http/rcm-db01w1 openvista\rcmdb01w1defaultsql
