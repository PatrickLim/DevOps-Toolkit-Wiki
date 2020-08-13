* startup logon as
* mixed mode
* databases
* maintenance plan
* domain users
* sql users
* agent jobs (query msdb before and after)
* update paths - report server url **ALSO COLLECTOR AND SYSLNK**!
* replication
* analysis server
* reporting server - install reports
* ssrs data sources and additional rdls


regarding agent jobs (using CHLB as a basis):

Added these Agent Jobs
installed on CHLB-RCM and CHLB-RCM-TEST
from Create Standard SQL Scheduled Jobs.sql
•	CAS-53655_DUPLICATE_PATIENTS Job
•	CAS-32619 Collector Productivity Process Job
•	CAS-44137 - Statements Job
•	CAS-55280_Reservation_Delete Job
•	CAS-55691_Auto_Post_Interest Job
•	ICS_Purge_Tables_V2015_Q1_V2 Job
•	Nightly Processing Web Queue V2019_Q2_V1 Job
•	Update Image Directory Job
•	Web Report Updates Job -- note that the script has a dbName reference to "som-rcm"
•	Claim Event Coding Job
from Create SQL Job - Insight Audit Processor.sql
•	ICS_Audit_Processor_V2014_Q1_V1 -- note that @notify_level_email changed from 1 to 0

installed on CHLB-RCM-COLLECTOR and CHLB-RCM-COLLECTOR-TEST
from Create Standard SQL Scheduled Jobs - Collector.sql
•	ICS_Purge_Collector_Tables_V2015_Q1_V1
installed on CHLB-RCM-SISLNK
from Create Standard SQL Scheduled Jobs - Sislnk.sql
•	ICS_Purge_Sislnk_Tables_V2015_Q1_V1
