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
