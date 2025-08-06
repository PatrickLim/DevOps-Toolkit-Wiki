
```
SELECT
    OBJECT_NAME(sm.object_id) AS StoredProcedureName,
    sm.definition AS ProcedureDefinition
FROM
    sys.sql_modules AS sm
INNER JOIN
    sys.procedures AS p ON sm.object_id = p.object_id
WHERE
    sm.definition LIKE '%\\ap02e1-crmc\insightcs\crmc-rcm%';
```
