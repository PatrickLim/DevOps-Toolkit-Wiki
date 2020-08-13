when restoring from MODEL, after running update paths here are some additional updates:

select * from GLOBAL_REGISTRY where REGISTRY_KEY = 'REPORT_SERVER_URL'
update GLOBAL_REGISTRY set VALUE2 = 'https://rcm-db01w1.openvista.net/ReportServer' where REGISTRY_KEY = 'REPORT_SERVER_URL'

update report_mstr set report_definition = replace (report_definition, '/Insight/', '/SMG/')
update report_mstr set report_definition = replace (report_definition, '/InsightCS/', '/SMG/smg-rcm/')

UPDATE REPORTING_REPORT_PROPERTIES SET DATA_PATH = REPLACE(DATA_PATH, '/Insight/', '/SMG/')
UPDATE REPORTING_REPORT_PROPERTIES SET DATA_PATH = REPLACE(DATA_PATH, '/InsightCS/', '/SMG/smg-rcm/')

