--used to resolve this error in the SQL Logs:
--The database owner SID recorded in the master database differs from the database owner SID recorded in database 'chlb-rcm-dev'. You should correct this situation by resetting the owner of database 'chlb-rcm-dev' using the ALTER AUTHORIZATION statement.

select * from master..sysdatabases

select * from master..syslogins

select sd.name,sl.name
FROM master..sysdatabases SD 
JOIN master..syslogins SL ON  SD.SID = SL.SID

alter authorization on database::[chlb-rcm-dev] to [sa]
