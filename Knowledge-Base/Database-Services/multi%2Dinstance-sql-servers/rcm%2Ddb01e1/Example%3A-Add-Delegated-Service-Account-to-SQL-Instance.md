# Add Service Account to SQL Instances

- MSSQLSERVER _default_

```
USE [master]
GO

/****** Object:  Login [OPENVISTA\rcmdb01e1defaultsql]    Script Date: 2/21/2021 11:56:51 PM ******/
CREATE LOGIN [OPENVISTA\rcmdb01e1defaultsql] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [OPENVISTA\rcmdb01e1defaultsql]
GO
```

- MSSQL$AAT _tenant_
