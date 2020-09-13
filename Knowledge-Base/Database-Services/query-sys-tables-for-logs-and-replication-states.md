SELECT DISTINCT a.[name]
FROM sysobjects a
INNER JOIN syscomments b on a.id = b.id
WHERE b.[text] LIKE '%[search-term]%'

select * from MSReplication_Monitordata

select name,log_reuse_wait_desc,recovery_model_desc,is_published,is_subscribed,is_merge_published,is_distributor,is_cdc_enabled
from sys.databases

SELECT spid FROM sys.sysprocesses WHERE dbid = db_id('distribution')

SELECT name,OBJECT_ID(name+'.dbo.MSreplication_objects')
FROM sys.databases
WHERE OBJECT_ID(name+'.dbo.MSreplication_objects') IS NOT NULL