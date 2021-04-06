SELECT DB_NAME() AS DatabaseName
      ,DatabasePrincipals.name AS PrincipalName
      ,DatabasePrincipals.type_desc AS PrincipalType
      ,DatabasePrincipals2.name AS GrantedBy
      ,DatabasePermissions.permission_name AS Permission
      ,DatabasePermissions.state_desc AS StateDescription
      ,SCHEMA_NAME(SO.schema_id) AS SchemaName
      ,SO.Name AS ObjectName
      ,SO.type_desc AS ObjectType
  FROM sys.database_permissions DatabasePermissions LEFT JOIN sys.objects SO
    ON DatabasePermissions.major_id = so.object_id LEFT JOIN sys.database_principals DatabasePrincipals
    ON DatabasePermissions.grantee_principal_id = DatabasePrincipals.principal_id LEFT JOIN sys.database_principals DatabasePrincipals2
    ON DatabasePermissions.grantor_principal_id = DatabasePrincipals2.principal_id
WHERE DatabasePrincipals.name in ('QueryUsers', 'SQLUsers') -- Change the Role Name
and SO.name like 'rpt%'