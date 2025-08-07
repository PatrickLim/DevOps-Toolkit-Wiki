
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
```
