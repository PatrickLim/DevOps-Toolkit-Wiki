-- Query sys.database_permissions to see applicable permissions
SELECT dp.class_desc, s.name AS 'Schema', o.name AS 'Object', dp.permission_name, 
       dp.state_desc, prin.[name] AS 'User'
FROM sys.database_permissions dp
  JOIN sys.database_principals prin
    ON dp.grantee_principal_id = prin.principal_id
  JOIN sys.objects o
    ON dp.major_id = o.object_id
  JOIN sys.schemas s
    ON o.schema_id = s.schema_id
--WHERE o.name in ('GLOBAL_REGISTRY','USER_MSTR')
--  AND dp.class_desc = 'OBJECT_OR_COLUMN'
where prin.[name] = 'misterlimited'
UNION ALL
SELECT dp.class_desc, s.name AS 'Schema', '-----' AS 'Object', dp.permission_name, 
       dp.state_desc, prin.[name] AS 'User'
FROM sys.database_permissions dp
  JOIN sys.database_principals prin
    ON dp.grantee_principal_id = prin.principal_id
  JOIN sys.schemas s
    ON dp.major_id = s.schema_id
--WHERE dp.class_desc = 'SCHEMA';
where prin.[name] = 'misterlimited'



create user mrlim without login
create user userschemaowner without login
CREATE SCHEMA [userschema] AUTHORIZATION [userschemaowner]

create synonym [userschema].USER_MSTR for [dbo].USER_MSTR

drop synonym [userschema].USER_MSTR

select * from [userschema].USER_MSTR

execute as user = 'misterlimited' --principal_id = 22



execute as user = 'misterlimited'
go
select * from dbo.USER_MSTR

 select * from dbo.GLOBAL_REGISTRY

revert

select * from sys.database_principals

select * from sys.database_role_members
select * from sys.server_principals

deny select on schema::dbo to misterlimited
grant select on schema::[userschema] to misterlimited
revoke select on schema::dbo to misterlimited
grant select on object::dbo.USER_MSTR to misterlimited

sp_msloginmappings


----------------

create user userschemaowner without login
CREATE SCHEMA [userschema] AUTHORIZATION [userschemaowner]

create synonym [userschema].[USER_MSTR] for [gmh-rcm].[dbo].[USER_MSTR]

select * from [userschema].[USER_MSTR]

update [userschema].[USER_MSTR] set MIDDLE_INITIAL = 'x' where USERNAME = 'brian.stockell'
