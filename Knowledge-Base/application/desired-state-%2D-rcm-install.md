# Web Install
RCM Cloud has Prod, Test, and Dev versions running https and connecting to their corresponding SignalR sites.
RCM Cloud sites should use “openvista\XYZrcmwebapp” domain identity for their app pools. SignalR sites should “openvista\XYZrcmsignalr”. RCM Maintenance sites should also use “openvista\XYZrcmwebapp”.
RCM Cloud and RCM Maintenance sites must launch without error on browsers running outside the webserver. Note that these http (not https) SPN’s must exist to get outside browsers to work:
•	setspn -u -s http/wb01w1-chlb.openvista.net openvista\XYZrcmwebapp
•	setspn -u -s http/wb01w1-chlb openvista\XYZrcmwebapp
SignalR sites must display their asmx pages without error. Since the databases are restored from backup, their Service Brokers must be reenabled for this to happen.
RCM Cloud is installed using WebDeploy, which is a prerequisite that is downloaded.
RCM Maintenance and SignalR are installed simply as folder copies and editing their web.config and javascript files.
 
# Application Server Install
## ODBC Connections
Both Insight Classic and the Interface Services rely on the ODBC connections so these must be created first.
## Folder Structure and Shared Folders

## Insight Classic
.NET Framework 2 is a prerequisite for Insight Classic.
Insight Classic must launch and connect to at least one ODBC connection.
Create an Insight Classic user and give his/her account full privileges.
Install Report Viewer, both the msi and the exe. Report Viewer needs CLR Types for SQL Server 2012.
## Interface Services
Interface Services must launch as Automatic Windows Services. Each service should have a Windows Registry entry in HKLM\SYSTEM\CurrentControlSet\Services that detail several settings including its DSN, credentials, and executable.
Collector table should have REGISTRY tables updated. The idea is, these rows tell the Interface Services which server hosts the shared folders that contain the Operations, Log, and Bin folders. The value for the rows whose KEY_ID = ‘HostName’ can all be fully-qualified EXCEPT for where SYSTEM_ID = ‘Collector’. For that one row, the value must just be the unqualified Host Name.
Monitor App is launched as Administrator and must show all Interface Services running.
## Scheduled Tasks
The Scheduled Tasks need environment variables that are set using a reg file.
Install SQL Server Management Studio.
Domain Firewall check browser connectivity.
 
# SQL Server Install
Foundation
At the server level, add the Insight logins (there are eighteen of them including controlwks) and the following domain logins:
•	OPENVISTA\RCM SQL Admins
•	OPENVISTA\XYZrcmsql
•	OPENVISTA\ XYZrcmwebapp
•	OPENVISTA\XYZrcmsignalr
The engine and all other SQL services must log on as OPENVISTA\XYZrcmsql. This domain identity must have the following SPN’s:
•	setspn -u -s MSSQLSvc/db01w1-XYZ.openvista.net:1433 openvista\XYZrcmsql
•	setspn -u -s MSSQLSvc/db01w1- XYZ.openvista.net openvista\XYZrcmsql
•	setspn -u -s https/db01w1- XYZ.openvista.net openvista\XYZrcmsql
•	setspn -u -s https/db01w1- XYZ openvista\XYZrcmsql
•	setspn -u -s http/db01w1- XYZ.openvista.net openvista\XYZrcmsql
•	setspn -u -s http/db01w1- XYZ openvista\XYZrcmsql
Five databases must have this naming convention and restored from backup:
•	XYZ-rcm
•	XYZ-rcm-test
•	XYZ-collector
•	XYZ-collector-test
•	XYZ-syslnk
Check each database for VERSION consistency, especially if XYC-rcm-dev is later included.
The controlwks user may already exist in the restored database, so delete him first. If you cannot delete controlwks because he owns a schema, then change that schema’s owner to dbo. After controlwks no longer owns any schemas then you can delete him.
Maintenance Plan
Create a Maintenance Plan using the Wizard that backups up all user databases.
Report Server
Configure SSRS using the original SQL Server install media. The desired state is to have the database server host the following sites via https:
•	https://db01w1-XYZ.openvista.net/reportserver
•	https://db01w1-XYZ.openvista.net/reports
Configuring SSRS creates these two databases in addition to the five mentioned in the above Foundation section:
•	ReportServer
•	ReportServerTempDB
The RCM Reports are stored in rdl files that are uploaded into SSRS using the InsightReports msi. This requires the SQLSysClrTypes msi preinstalled. The idea is to load all the rdl files into two SSRS “folders” – XYZ-rcm and XYZ-rcm-test. The InsightReports msi is run twice: once to load the rdl files into XYZ-rcm and the second time to load the rdl files into XYZ-rcm-test.
Since the five Foundation databases are restored from another client, the REPORT_MSTR and REPORTING_REPORT_PROPERTIES tables need their REPORT_DEFINITION and DATA_PATH fields (respectively) updated to reflect the “folder structure” set up in SSRS.
Analysis Server
Replication
Agent Jobs


