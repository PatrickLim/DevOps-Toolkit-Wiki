select * from LOCATION_REGISTRY where REGISTRY_KEY = 'EXTERNAL_CODER'
select * from GLOBAL_REGISTRY where REGISTRY_KEY = '3M_CRS_URL'
select * from ENCODER_CONFIG_MSTR where SECTION_NAME = 'out_tags' and TAG_NAME = 'authorization'

select * from WEB_MAINT_TABLE_MSTR where TABLE_GROUP_CD = 'ENCODER_CONFIG_MSTR'
select * from WEB_MAINT_TABLE_GROUP where TABLE_GROUP_CD = 'ENCODER_CONFIG_MSTR'
select * from WEB_MAINT_TABLE_COLUMNS where TABLE_NAME = 'ENCODER_CONFIG_MSTR'

select * from WEB_RIGHT_MSTR where SEC_RIGHT_ID = 'EXT-CODER-QA'
select * from WEB_ROLE_RIGHT where SEC_RIGHT_ID = 'EXT-CODER-QA'

EXTERNAL_CODER should be "3M"
3M_CRS_URL should be the URL of the webapp that 3M installed at the client. For CRMC it is https://3mcsr.crmc.health and for GACH it is gch3msrv.cottagehospital.com
TAG_NAME should be "HGWDNL900Q7LTobC"

Tony Rogers testing:

https://medsphere.sharepoint.com/:w:/g/STL/QA/ES665PwxztJBtsJ964UHi0gB3C9tH2Me1wVQcVH9zs8OqQ?e=2GJx7Z

Chuck Musgrave tech spec:

https://medsphere.sharepoint.com/:w:/r/STL/Development/_layouts/15/Doc.aspx?sourcedoc=%7B34A940DF-10F1-452B-B54B-EFCBEFF5376B%7D&file=Case%20103960%20STKL%20ENH%20Design%20-%20RCM%203M%20External%20Coder%20Integration.docx&action=default&mobileredirect=true&DefaultItemOpen=1&cid=30cf8f57-1196-4138-a582-984e80c16dc0
