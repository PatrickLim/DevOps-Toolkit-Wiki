USE [master]
RESTORE DATABASE [gmh-rcm-sislnk] FROM  DISK = N'L:\model databases\rcm-sislnk-model_backup_2020_07_23_040001_2270078.bak' WITH  FILE = 1,  MOVE N'sislnk_data' TO N'M:\gmh\gmh-rcm-sislnk.mdf',  MOVE N'sislnk_log' TO N'L:\gmh\gmh-rcm-sislnk.ldf',  NOUNLOAD,  REPLACE,  STATS = 5

GO
