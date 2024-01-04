First determine whether you have SQL Server Enterprise or Standard version:


select @@VERSION

select serverproperty('Edition')

SSRS Scale-Out Deployment is only possible for Enterprise version.

https://learn.microsoft.com/en-us/sql/reporting-services/install-windows/configure-a-native-mode-report-server-scale-out-deployment?redirectedfrom=MSDN&view=sql-server-ver15