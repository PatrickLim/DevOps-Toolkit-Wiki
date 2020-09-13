# bad sprocs

_had to drop "with schemabinding" for the view CHARGE_MSTR_VIEW.
had to recreate view Rpt_ChargeMstrView because it relies on the above view._

1.	[EDI_270_CONVERT_WORK_V2013_Q1_V1]
2.	[GE_UPD_PRINTER]
3.	[MR_VISIT_SEARCH_ON_ROOM_BED_V2015_Q2_V1]
4.	[MR_VISIT_SEARCH_ON_URN_V2015_Q2_V1]
5.	[MR_VISIT_SEARCH_ON_SSN_V2015_Q2_V1]
6.	[MR_VISIT_SEARCH_ON_VISIT_V2015_Q2_V1]
7.	[MR_VISIT_SEARCH_ON_MEDREC_V2015_Q2_V1]
8.	[PATDETAIL_RETRIEVE_VISITS_BY_MRN_V2011]
9.	[PATIENT_SEARCH_V2015_Q2_V1]
10.	[Rpt_MAMMO_REMINDERS_V2019_Q1_V1]

### _VERY IMPORTANT! ANYTHING that says_ **SqlQueryNotificationService!**

for some reason the scalar function **FormatPostalCode needs inline=off**
**RETURNS varchar(12) with inline=off**

could just delete the sprocs above:


```
drop procedure [dbo].[EDI_270_CONVERT_WORK_V2013_Q1_V1]
drop procedure [dbo].[GE_UPD_PRINTER]
drop procedure [dbo].[MR_VISIT_SEARCH_ON_ROOM_BED_V2015_Q2_V1]
drop procedure [dbo].[MR_VISIT_SEARCH_ON_URN_V2015_Q2_V1]
drop procedure [dbo].[MR_VISIT_SEARCH_ON_SSN_V2015_Q2_V1]
drop procedure [dbo].[MR_VISIT_SEARCH_ON_VISIT_V2015_Q2_V1]
drop procedure [dbo].[MR_VISIT_SEARCH_ON_MEDREC_V2015_Q2_V1]
drop procedure [dbo].[PATDETAIL_RETRIEVE_VISITS_BY_MRN_V2011]
drop procedure [dbo].[PATIENT_SEARCH_V2015_Q2_V1]
drop procedure [dbo].[Rpt_MAMMO_REMINDERS_V2019_Q1_V1]
```


from AAT:
[FMA_SF_PAYER_MIX]

# bad views:
[ETL].[PayerMixReferral]

SELECT DISTINCT a.[name]
FROM sysobjects a
INNER JOIN syscomments b on a.id = b.id
WHERE b.[text] LIKE '%[search-term]%'

select * from MSReplication_Monitordata

select name,log_reuse_wait_desc,recovery_model_desc,is_published,is_subscribed,is_merge_published,is_distributor,is_cdc_enabled
from sys.databases

SELECT name,OBJECT_ID(name+'.dbo.MSreplication_objects')
FROM sys.databases
WHERE OBJECT_ID(name+'.dbo.MSreplication_objects') IS NOT NULL
