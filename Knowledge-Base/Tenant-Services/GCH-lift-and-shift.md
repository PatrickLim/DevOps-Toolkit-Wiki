turn off everything on both sides
- windows scheduled tasks
- windows services (hl7 interfaces, Billing, CDR, etc)
- SSRS

last database snapshots from Azure server
- gch-rcm
- gch-rcm-test
- gch-rcm-sislnk
- ReportServer
- ReportServerTempDB

restore gch-rcm onto db03w1-msc\gch
- run upload paths script
- alter GCH_COVID_PatientDaily
- alter GCH_COVID_EDDaily
- alter GCH_Guarantor_Waystar_SFTP

restore gch-rcm-sislnk onto db03w1-msc\gch

restore ReportServer and ReportServerTempDB onto db03w1-msc\gch
- redo encryption keys on ap02w1-gch
- restart SSMS on ap02w1-gch

restore gch-rcm-test onto db03w1-msc\gch
- run upload paths script

repoint web.config on wb02w1-gch

repoint odbc on all rd nodes

copy over image deltas

update Mirth channels

start windows scheduled task on ap02w1-gch
start windows services (hl7 interfaces, Billing, CDR, etc) on ap02w1-gch
