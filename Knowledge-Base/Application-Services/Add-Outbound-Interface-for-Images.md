# How to add Outbound Interface for Images

1. Powershell script create service shell
2. Run RegEdit file to update OS Registry entries
3. Make sure the cfg & config files are in the `operations` folder
4. Run update scripts for Collector and Sislnk databases

---


used SislnkHL7ToEngineHL7_Q193Prod as a template to create a new service called "Patrick310"

used the installer msi to create the service

in syslnk database ran this:

insert into Clients (client_name,description,client_num,record_transmitted)
select client_name='Patrick310',description,client_num=310,record_transmitted from Clients where client_name = 'SislnkHL7ToEngineHL7_Q193Prod'

in collector database ran these:

insert into SERVICE_MSTR (SERVICE_ID,SERVICE_NAME,DESCRIPTION) values (310,'Patrick310','')

insert into REGISTRY(KEY_ID,SYSTEM_ID,SUBSYSTEM_ID,GROUP_ID,SUBGROUP_ID,VALUE)
select KEY_ID,SYSTEM_ID,SUBSYSTEM_ID='Patrick310',GROUP_ID,SUBGROUP_ID,VALUE
from REGISTRY where SUBSYSTEM_ID = 'SislnkHL7ToEngineHL7_Q193Prod'

update REGISTRY set VALUE = 'Patrick310.cfg' where SUBSYSTEM_ID = 'Patrick310' and KEY_ID = 'CfgName'
update REGISTRY set VALUE = 'Patrick310.config' where SUBSYSTEM_ID = 'Patrick310' and KEY_ID = 'ConfName'
update REGISTRY set VALUE = 'Patrick310.log' where SUBSYSTEM_ID = 'Patrick310' and KEY_ID = 'LogName'
update REGISTRY set VALUE = '310' where SUBSYSTEM_ID = 'Patrick310' and KEY_ID = 'SislnkClientNum'

inside the OPERATIONS folder (in this example in \\ap-rcmqa20193\IcsInterface\Operations\)

copied SislnkEventToSislnkHL7_Q193Prod.config into Patrick310.config
make sure the cfg file contains the correct service name too!
