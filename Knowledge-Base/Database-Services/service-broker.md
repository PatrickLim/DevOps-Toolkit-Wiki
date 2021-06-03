select name,is_broker_enabled,service_broker_guid from sys.databases

--use the following for unique service_broker_guid
ALTER DATABASE [xxx-rcm] SET ENABLE_BROKER WITH ROLLBACK IMMEDIATE

--if restoring from a copy of a different database, then the service_broker_guid will not be unique so need to create a new one
ALTER DATABASE [xxx-rcm-test] SET NEW_BROKER WITH ROLLBACK IMMEDIATE

