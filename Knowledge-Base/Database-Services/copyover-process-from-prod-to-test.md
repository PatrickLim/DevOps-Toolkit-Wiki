VERY IMPORTANT!!! make sure HL7 INTERFACES are working at the end of the process!
--

May need to bug Terri/Joy to verify that connectivity is there before signing off on the all-clear.


1. backup test database (even if nightly backup was taken previously, just in case)
2. restore prod to test
3. SERVICE BROKER!!!
4. run Update Paths Test from Prod script (and verify results table by table)
5. in SERVICES_MSTR table, the URI port has to be changed too, otherwise the BillingTest service may end up duplicating the BillingProd service.
5. depending on the client, scrub the data using PHI SCRUBBER script
6. copy Image Folders from prod to test

Update Paths Test from Prod

https://medsphere.sharepoint.com/:u:/g/Implementation%20Services/ERAuxsM7ETNNrLfGeQgPze8B98qlIPknY51fF2DPESif9A?e=sOLfB3

This is for Ashley AAT specifically:

use Kyle's sharepoint instead of the txt!

https://medsphere.sharepoint.com/:u:/g/Implementation%20Services/EcsMI9Sp82VIupTohS5tSUIBUAgumL-sFaaNd3CtXOTI7A?e=DuWif9

[aat update paths prod to test.txt](/.attachments/aat%20update%20paths%20prod%20to%20test-9fc0ac88-9f48-43ff-91c7-e66b95531358.txt)

GO LIVE INIT

https://medsphere.sharepoint.com/:u:/g/Implementation%20Services/EXdop7NpV_FIulbjPqXCfsIB0vkWg0PXwmAHbgynK6ocOg?e=mcL08P


PHI SCRUBBER script

(ask Kyle for SharePoint link)

Update Paths Test from Prod script (edit the four variables up top):

-- The following script changes paths from production to test.
-- Effective version 2014.1

declare @ProdDatabase varchar(30)
set @ProdDatabase = 'som-rcm'
declare @TestDatabase varchar(30)
set @TestDatabase = 'som-rcm-test'
declare @ProdAppSrv varchar(30)
set @ProdAppSrv = 'som-rcm-app'
declare @TestAppSrv varchar(30)
set @TestAppSrv = 'som-rcm-apptst'


--SELECT SYSTEM_ID, FULL_TXT, BILLING_DIR FROM SYSTEM_MSTR
UPDATE SYSTEM_MSTR SET BILLING_DIR = REPLACE(BILLING_DIR, @ProdAppSrv, @TestAppSrv)
UPDATE SYSTEM_MSTR SET BILLING_DIR = REPLACE(BILLING_DIR, @ProdDatabase, @TestDatabase)

--SELECT IMAGE_FORM_DIR, BILLING_DIR, POSTING_DIR FROM PROFILE
UPDATE PROFILE SET IMAGE_FORM_DIR = REPLACE(IMAGE_FORM_DIR, @ProdAppSrv, @TestAppSrv)
UPDATE PROFILE SET IMAGE_FORM_DIR = REPLACE(IMAGE_FORM_DIR, @ProdDatabase, @TestDatabase)

UPDATE PROFILE SET BILLING_DIR = REPLACE(BILLING_DIR, @ProdAppSrv, @TestAppSrv)
UPDATE PROFILE SET BILLING_DIR = REPLACE(BILLING_DIR, @ProdDatabase, @TestDatabase)

UPDATE PROFILE SET POSTING_DIR = REPLACE(POSTING_DIR, @ProdAppSrv, @TestAppSrv)
UPDATE PROFILE SET POSTING_DIR = REPLACE(POSTING_DIR, @ProdDatabase, @TestDatabase)


--SELECT FAC_NAME, LOCATION_CD, SYSTEM_ID, ADT_ROUTING_DIRECTORY FROM LOCATION_MSTR
UPDATE LOCATION_MSTR SET ADT_ROUTING_DIRECTORY = REPLACE(ADT_ROUTING_DIRECTORY, @ProdAppSrv, @TestAppSrv)
UPDATE LOCATION_MSTR SET ADT_ROUTING_DIRECTORY = REPLACE(ADT_ROUTING_DIRECTORY, @ProdDatabase, @TestDatabase)

--SELECT FORM_TYPE_CD, SEQ_NUM, DIRECTORY FROM IMAGE_DIRS order by form_type_cd
UPDATE IMAGE_DIRS SET DIRECTORY = REPLACE(DIRECTORY, @ProdDatabase, @TestDatabase)

--SELECT * FROM GLOBAL_REGISTRY WHERE REGISTRY_KEY LIKE '%PATH%'
--SELECT * FROM GLOBAL_REGISTRY WHERE REGISTRY_KEY LIKE '%FOLDER%'
--SELECT * FROM GLOBAL_REGISTRY WHERE REGISTRY_KEY LIKE '%DIR%'
UPDATE GLOBAL_REGISTRY SET VALUE1 = REPLACE(VALUE1, @ProdAppSrv, @TestAppSrv)
UPDATE GLOBAL_REGISTRY SET VALUE1 = REPLACE(VALUE1, @ProdDatabase, @TestDatabase)
UPDATE GLOBAL_REGISTRY SET VALUE2 = REPLACE(VALUE2, @ProdAppSrv, @TestAppSrv)
UPDATE GLOBAL_REGISTRY SET VALUE2 = REPLACE(VALUE2, @ProdDatabase, @TestDatabase)

--SELECT * FROM SYSTEM_REGISTRY WHERE REGISTRY_KEY LIKE '%FOLDER%'
--SELECT * FROM SYSTEM_REGISTRY WHERE REGISTRY_KEY LIKE '%OUTPUT%'
--SELECT * FROM SYSTEM_REGISTRY WHERE REGISTRY_KEY LIKE '%DIR%'
UPDATE SYSTEM_REGISTRY SET VALUE1 = REPLACE(VALUE1, @ProdAppSrv, @TestAppSrv)
UPDATE SYSTEM_REGISTRY SET VALUE1 = REPLACE(VALUE1, @ProdDatabase, @TestDatabase)
UPDATE SYSTEM_REGISTRY SET VALUE2 = REPLACE(VALUE2, @ProdAppSrv, @TestAppSrv)
UPDATE SYSTEM_REGISTRY SET VALUE2 = REPLACE(VALUE2, @ProdDatabase, @TestDatabase)

UPDATE LOCATION_REGISTRY SET VALUE1 = REPLACE(VALUE1, @ProdAppSrv, @TestAppSrv)
UPDATE LOCATION_REGISTRY SET VALUE1 = REPLACE(VALUE1, @ProdDatabase, @TestDatabase)
UPDATE LOCATION_REGISTRY SET VALUE2 = REPLACE(VALUE2, @ProdAppSrv, @TestAppSrv)
UPDATE LOCATION_REGISTRY SET VALUE2 = REPLACE(VALUE2, @ProdDatabase, @TestDatabase)


-- UPDATE SERVICES_MSTR
update SERVICES_MSTR set SERVICE_NAME = REPLACE(SERVICE_NAME, '_Main','_Test')
update SERVICES_MSTR set HOST_NAME = REPLACE(HOST_NAME, @ProdAppSrv, @TestAppSrv)
update SERVICES_MSTR set URI = REPLACE(URI, @ProdAppSrv, @TestAppSrv)

--Point reports to test
--SELECT * FROM REPORTING_REPORT_PROPERTIES

update report_mstr set report_definition = 
replace (report_definition, @ProdDatabase, @TestDatabase)

update reporting_report_properties set data_path = 
replace (data_path, @ProdDatabase, @TestDatabase)

-- SELECT * FROM EDI_MSTR
UPDATE EDI_MSTR SET INBOUND_PATH = REPLACE(INBOUND_PATH, @ProdAppSrv, @TestAppSrv)
UPDATE EDI_MSTR SET INBOUND_PATH = REPLACE(INBOUND_PATH, @ProdDatabase, @TestDatabase)

UPDATE EDI_MSTR SET OUTBOUND_PATH = REPLACE(OUTBOUND_PATH, @ProdAppSrv, @TestAppSrv)
UPDATE EDI_MSTR SET OUTBOUND_PATH = REPLACE(OUTBOUND_PATH, @ProdDatabase, @TestDatabase)

------------------------------

Here is the script that will need to be run after the INIT.  This will set the starting visit number to 2000001 and the starting MRN/URN to 700000 . CC’ing Tina to ensure I have the correct values.

UPDATE NEXT_VISIT_NO SET NEXT_VISIT_NO = '2000001'
UPDATE NEXT_URN SET URN = '700000'
UPDATE NEXT_MEDREC_NO SET NEXT_MEDREC_NO = '700000'
