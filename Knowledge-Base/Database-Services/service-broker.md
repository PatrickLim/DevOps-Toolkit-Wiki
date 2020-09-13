select name,is_broker_enabled,service_broker_guid from sys.databases
ALTER DATABASE [chlb-rcm] SET ENABLE_BROKER WITH ROLLBACK IMMEDIATE
ALTER DATABASE [chlb-rcm-test] SET NEW_BROKER
ALTER DATABASE [chlb-rcm-dev] SET NEW_BROKER
