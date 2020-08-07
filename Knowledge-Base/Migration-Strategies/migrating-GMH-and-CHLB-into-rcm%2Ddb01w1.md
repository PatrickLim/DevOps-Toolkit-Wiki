GMH (Guam) did not have RCM so it is a new RCM install. We restored from a clean model database, so the Update Paths script was runnable with minimal edits.

select * from SYSTEM_MSTR
select * from PROFILE
select * from LOCATION_MSTR
select * from IMAGE_DIRS

ap01w1-gmh
\\ap01w1-gmh\InsightCS\gmh-rcm\Billing\

gmh-rcm
\\ap01w1-gmh\ICSImages\gmh-rcm\40\2015\02\

select * from GLOBAL_REGISTRY
select * from REPORT_MSTR
select * from REPORTING_REPORT_PROPERTIES

/GMH/gmh-rcm/InsightCS Application/ABTJournalReceipt
/GMH/gmh-rcm/Accounts Receivable/AccountsOnARHoldByCollector


--in addition to running the update paths, GMH needs the following:

select * from GLOBAL_REGISTRY where REGISTRY_KEY = 'REPORT_SERVER_URL'
update GLOBAL_REGISTRY set VALUE2 = 'https://rcm-db01w1.openvista.net/ReportServer' where REGISTRY_KEY = 'REPORT_SERVER_URL'

update report_mstr set report_definition = replace (report_definition, '/Insight/', '/GMH/')
update report_mstr set report_definition = replace (report_definition, '/InsightCS/', '/GMH/gmh-rcm/')

UPDATE REPORTING_REPORT_PROPERTIES SET DATA_PATH = REPLACE(DATA_PATH, '/Insight/', '/GMH/')
UPDATE REPORTING_REPORT_PROPERTIES SET DATA_PATH = REPLACE(DATA_PATH, '/InsightCS/', '/GMH/gmh-rcm/')


--CHLB EXTRAS! in addition to running the update paths, CHLB needs the following:

select * from GLOBAL_REGISTRY where REGISTRY_KEY = 'REPORT_SERVER_URL'
update GLOBAL_REGISTRY set VALUE2 = 'https://rcm-db01w1.openvista.net/ReportServer ' where REGISTRY_KEY = 'REPORT_SERVER_URL'

update report_mstr set report_definition = replace (report_definition, '/chlb-rcm/', '/CHLB/chlb-rcm/')
update report_mstr set report_definition = replace (report_definition, '/InsightCS/', '/CHLB/chlb-rcm/')

UPDATE REPORTING_REPORT_PROPERTIES SET DATA_PATH = REPLACE(DATA_PATH, '/chlb-rcm/', '/CHLB/chlb-rcm/')
UPDATE REPORTING_REPORT_PROPERTIES SET DATA_PATH = REPLACE(DATA_PATH, '/InsightCS/', '/CHLB/chlb-rcm/')

--replicating db01w1-chlb to rcm-db01w1\chlb
remote distributor Admin Link Password: QWEasd123!
