# How to add Outbound Interface for Images

1. Powershell script create service shell
2. Run RegEdit file to update OS Registry entries
3. Make sure the cfg & config files are in the `operations` folder
4. Run update scripts for Collector and Sislnk databases

---

this was Patrick Lim's first attempt (scroll down for the proper "Matt Garber Way")

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

---

The Proper Matt Garber Way

1. use the "sc create" and "sc delete" commands in cmd or powershell to create a placeholder service.

sc create "ImageHL7ToEngineHL7" binpath= "C:\IcsInterface\Bin\GenericService.exe ImageHL7ToEngineHL7" start= demand

sc delete "ImageHL7ToEngineHL7"

2. double-click the EDITED reg file to fill in the "meat" of the registry key.

![image.png](/.attachments/image-bc88a730-0a56-4b20-991b-59e69c69705d.png)

the above screenshot is not representative of this sample .reg file:

[Patrick310.reg.txt](/.attachments/Patrick310.reg-30f89b6c-0a2b-45ef-a2c6-966ec22fac6c.txt)

3. use the following queries to fill in the appropriate tables in the Sislnk and Collector databases:

[ADD_SERVICE_TO_COLLECTOR_DB.sql](/.attachments/ADD_SERVICE_TO_COLLECTOR_DB-626b53e9-0049-489b-8c9e-66625571e0c1.sql)
[ADD_SERVICE_TO_SISLNK_DB.sql](/.attachments/ADD_SERVICE_TO_SISLNK_DB-081f0e8b-3239-4eed-aac0-1f6a43fb5f97.sql)

4. make sure the EDITED config and cfg files are in the OPERATIONS folder.
