
```
SELECT
    OBJECT_NAME(sm.object_id) AS StoredProcedureName,
    sm.definition AS ProcedureDefinition
FROM
    sys.sql_modules AS sm
INNER JOIN
    sys.procedures AS p ON sm.object_id = p.object_id
WHERE
    sm.definition LIKE '%rcm-db02e1%'
order by 1

--Search Stored Procedures for specific text

DECLARE @searchString VARCHAR(255)  
SET @searchString = 'THCIC'        
--string we're looking for goes here, can use wildcard characters  - always on for stored proc/trigger match, so only effective for Column name search

-- search stored procs for search string  
SELECT 'Stored Proc Match', NAME, TYPE  
FROM   SYS.PROCEDURES  
WHERE  OBJECT_DEFINITION(OBJECT_ID) LIKE '%' + @searchString + '%'  
order by name

-- search triggers for search string  
SELECT 'Trigger Match',tr.NAME, tr.TYPE, t.Name as 'Table'  
FROM   SYS.triggers tr   
join sys.tables t on tr.parent_id = t.object_id  
WHERE  OBJECT_DEFINITION(tr.OBJECT_ID) LIKE '%' + @searchString + '%'

--search all tables for column name containing search string  
SELECT      'Column in Table',c.name  AS 'ColumnName'  
            ,t.name AS 'TableName'  
FROM        sys.columns c  
JOIN        sys.tables  t   ON c.object_id = t.object_id  
WHERE       c.name LIKE '%' + @searchString + '%'  
ORDER BY    TableName  
            ,ColumnName;

-- search within job steps for search string  
SELECT Job.name          AS JobName,  
       Job.enabled       AS ActiveStatus,  
       JobStep.step_name AS JobStepName,  
      JobStep.command AS JobCommand  
FROM   msdb.dbo.sysjobs Job  
       INNER JOIN msdb.dbo.sysjobsteps JobStep  
               ON Job.job_id = JobStep.job_id   
WHERE  JobStep.command LIKE '%' + @searchString + '%'
```
