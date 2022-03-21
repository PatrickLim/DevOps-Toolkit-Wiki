
SELECT
DB_NAME() AS DBName
,OBJECT_NAME(ps.object_id) AS TableName
,i.name AS IndexName
,ips.index_type_desc
,ips.avg_fragmentation_in_percent
FROM sys.dm_db_partition_stats ps
INNER JOIN sys.indexes i
ON ps.object_id = i.object_id
AND ps.index_id = i.index_id
CROSS APPLY sys.dm_db_index_physical_stats(DB_ID(), ps.object_id, ps.index_id, null, 'LIMITED') ips
ORDER BY TableName --ps.object_id, ps.index_id
--ORDER BY 5 desc --TableName --ps.object_id, ps.index_id

SELECT *
FROM sys.dm_db_partition_stats ps
INNER JOIN sys.indexes i
ON ps.object_id = i.object_id
AND ps.index_id = i.index_id
CROSS APPLY sys.dm_db_index_physical_stats(DB_ID(), ps.object_id, ps.index_id, null, 'LIMITED') ips
ORDER BY OBJECT_NAME(ps.object_id) --ps.object_id, ps.index_id

--ALTER INDEX ALL ON xxx REBUILD with (ONLINE=ON)
--update statistics xxx

SELECT S.name as 'Schema',
T.name as 'Table',
I.name as 'Index',
DDIPS.avg_fragmentation_in_percent,
DDIPS.page_count
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS DDIPS
INNER JOIN sys.tables T on T.object_id = DDIPS.object_id
INNER JOIN sys.schemas S on T.schema_id = S.schema_id
INNER JOIN sys.indexes I ON I.object_id = DDIPS.object_id
AND DDIPS.index_id = I.index_id
WHERE DDIPS.database_id = DB_ID()
and t.name = 'inf_trigger'
and I.name is not null
AND DDIPS.avg_fragmentation_in_percent > 0
ORDER BY DDIPS.avg_fragmentation_in_percent desc
