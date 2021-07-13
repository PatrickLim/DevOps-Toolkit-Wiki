
```
select * from LOCATION_REGISTRY where REGISTRY_KEY = 'EXTERNAL_CODER'
select * from GLOBAL_REGISTRY where REGISTRY_KEY = '3M_CRS_URL'
select * from ENCODER_CONFIG_MSTR where SECTION_NAME = 'out_tags' and TAG_NAME = 'authorization'

select * from WEB_MAINT_TABLE_MSTR where TABLE_GROUP_CD = 'ENCODER_CONFIG_MSTR'
select * from WEB_MAINT_TABLE_GROUP where TABLE_GROUP_CD = 'ENCODER_CONFIG_MSTR'
select * from WEB_MAINT_TABLE_COLUMNS where TABLE_NAME = 'ENCODER_CONFIG_MSTR'

select * from WEB_RIGHT_MSTR where SEC_RIGHT_ID = 'EXT-CODER-QA'
select * from WEB_ROLE_RIGHT where SEC_RIGHT_ID = 'EXT-CODER-QA'
```


EXTERNAL_CODER should be "3M"
3M_CRS_URL should be the URL of the webapp that 3M installed at the client. For CRMC it is https://3mcsr.crmc.health and for GACH it is gch3msrv.cottagehospital.com
TAG_NAME should be "HGWDNL900Q7LTobC"


```
update LOCATION_REGISTRY set VALUE1 = '3M' where REGISTRY_KEY = 'EXTERNAL_CODER'
update GLOBAL_REGISTRY set VALUE2 = 'http://gch3msrv.cottagehospital.com' where REGISTRY_KEY = '3M_CRS_URL'
update ENCODER_CONFIG_MSTR set CUSTOM_VAL2 = 'HGWDNL900Q7LTobC' where SECTION_NAME = 'out_tags' and TAG_NAME = 'authorization'
```


The disposition code from RCM has leading zeroes as it should have. But, 3M sends back to RCM without leading zero causing import to fail. During my testing, I could not see where user is allowed to update this field. So, I disable this element in the in-tags configuration. And problem was solved.

`update ENCODER_CONFIG_MSTR set ENABLE_FLG = 0 where SECTION_NAME = 'in_tags' and TAG_NAME = 'DISPOSITION_CD'`

Tony Rogers testing:

https://medsphere.sharepoint.com/:w:/g/STL/QA/ES665PwxztJBtsJ964UHi0gB3C9tH2Me1wVQcVH9zs8OqQ?e=2GJx7Z

Chuck Musgrave tech spec:

https://medsphere.sharepoint.com/:w:/r/STL/Development/_layouts/15/Doc.aspx?sourcedoc=%7B34A940DF-10F1-452B-B54B-EFCBEFF5376B%7D&file=Case%20103960%20STKL%20ENH%20Design%20-%20RCM%203M%20External%20Coder%20Integration.docx&action=default&mobileredirect=true&DefaultItemOpen=1&cid=30cf8f57-1196-4138-a582-984e80c16dc0

From: Charles Musgrave <charles.musgrave@medsphere.com> 
Sent: Thursday, July 8, 2021 9:16 AM
To: Patrick Lim <patrick.lim@medsphere.com>
Subject: RE: 3M Integration Findings and Other Notes

Dan’s notes are correct. 
•	For the main application to launch (APPLICATION_SETTINGS, CF_APPLICATION) you setup CUSTOM_VAL1 for the product you’ll generally use (Dan set his to 13)
•	When wanting to launch a different 3M product looking at the following fields for the APPLICATION_BY_CLASS_PAYER:
o	CUSTOM_VAL1 = Patient’s classification code (these are “I” in all of Dan’s examples)
o	CUSTOM_VAL2 = Patient’s payer code (MC, XX, 1, BB, etc…)
o	CUSTOM_VAL3 = 3M Application (05 for all in Dan’s example)
o	CUSTOM_VAL4 = 3M Payer code (all zero except for payer code XX, uses 150)

According to what you said, you want to do this for a Patient Type. This configuration is more on the patient’s payer code, not the patient type. The patient’s classification code is derived from the patient type, so there is some flexibility there but we only have 4-5 classifications…we usually have a bunch of patient types for which this configuration really isn’t configured for.

Thank you,
Charles Musgrave
Director of RCM Operations
(636) 764-5043 ext. 5043 | Office


From: Patrick Lim <patrick.lim@medsphere.com> 
Sent: Thursday, July 8, 2021 12:20 PM
To: Charles Musgrave <charles.musgrave@medsphere.com>
Subject: RE: 3M Integration Findings and Other Notes

It more had to do with my understanding of the VISIT table, with PAYER_CD foreign-keying into PAYER_MSTR and PAT_TYPE_CD foreign-keying into PAYER_MSTR (which in turn keys into CLASSIFICATION_MSTR).

Once you explained to me what CUSTOM_VAL1 and CUSTOM_VAL2 were in ENCODER_CONFIG_MSTR, then it was simply a matter of finding the right VISIT records to use as test records to launch Ext Coder from the webapp.

Patrick Lim | Systems Engineer | 310.418.0721
