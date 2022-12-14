Data Source=db01e1-msc\vsta;Initial Catalog=vsta-rcm

**from original server:**

1. shut down processes
- shut down access
- shut down HL7 and other interfaces
- shut down Windows Scheduled Tasks

2. grab backups
- take final snapshot
- IcsMain, ReportServer, ReportServerTempDB
- IcsTest DO LATER in the week!
- REPORT_SERVER_URL = http://DEVINTREPWARE/reportserver
- login for DEVINTREPWARE:
- Trc/ICSRPT 
- fact-TOTAL-239

3. grab PBIRS encryption keys
4. stage backup files (compress and upload to nextcloud)
5. stage image files (determine delta)

```
select * from IMAGE_DIRS i join
(select FORM_TYPE_CD, SEQ_NUM,numimages=count(*) from PAT_IMAGE where DATE_SCANNED > '11/21/2022' group by FORM_TYPE_CD, SEQ_NUM) x
on i.FORM_TYPE_CD = x.FORM_TYPE_CD and i.SEQ_NUM = x.SEQ_NUM
```


```
G:\copyover\imagedeltacopyover.bat

\\DEVINTF01\Images\ICSImages\IcsMain\40\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\50\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\7\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\AUTH\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\BILL INFO\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\Correspond\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\EOB_R\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\INS CORR\2022\11\

Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\40\2022\11 G:\copyover\imagedelta\40\2022\11 /E /H /C /I /Y
Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\50\2022\11 G:\copyover\imagedelta\50\2022\11 /E /H /C /I /Y
Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\7\2022\11 G:\copyover\imagedelta\7\2022\11 /E /H /C /I /Y
Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\AUTH\2022\11 G:\copyover\imagedelta\AUTH\2022\11 /E /H /C /I /Y
Xcopy "\\DEVINTF01\Images\ICSImages\IcsMain\BILL INFO\2022\11" "G:\copyover\imagedelta\BILL INFO\2022\11" /E /H /C /I /Y
Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\Correspond\2022\11 G:\copyover\imagedelta\Correspond\2022\11 /E /H /C /I /Y
Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\EOB_R\2022\11 G:\copyover\imagedelta\EOB_R\2022\11 /E /H /C /I /Y
Xcopy "\\DEVINTF01\Images\ICSImages\IcsMain\INS CORR\2022\11" "G:\copyover\imagedelta\INS CORR\2022\11" /E /H /C /I /Y

Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\Correspond\2022\12 G:\copyover\imagedelta\Correspond\2022\12 /E /H /C /I /Y
Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\AUTH\2022\12 G:\copyover\imagedelta\AUTH\2022\12 /E /H /C /I /Y
Xcopy "\\DEVINTF01\Images\ICSImages\IcsMain\BILL INFO\2022\12" G:\copyover\imagedelta\BILL INFO\2022\12 /E /H /C /I /Y
Xcopy "\\DEVINTF01\Images\ICSImages\IcsMain\INS CORR\2022\12" G:\copyover\imagedelta\INS CORR\2022\12 /E /H /C /I /Y
Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\MEDICARE\2022\12 G:\copyover\imagedelta\MEDICARE\2022\12 /E /H /C /I /Y
Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\50\2022\12 G:\copyover\imagedelta\50\2022\12 /E /H /C /I /Y
Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\EOB_R\2022\12 G:\copyover\imagedelta\EOB_R\2022\12 /E /H /C /I /Y
Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\7\2022\12 G:\copyover\imagedelta\7\2022\12 /E /H /C /I /Y
Xcopy \\DEVINTF01\Images\ICSImages\IcsMain\40\2022\12 G:\copyover\imagedelta\40\2022\12 /E /H /C /I /Y
```


**on target server:**

1. download backups
2. shut down services

- take report server offline
- shut down HL7 and all other interfaces

3. restore report server databases
4. restore report server encryption keys
- trcicssql-11-21-2022.snk LLss!123
- if you get "scale out error" refer to this https://www.sqlnethub.com/blog/how-to-resolve-the-feature-scale-out-deployment-is-not-supported-in-this-edition-of-reporting-services/
- basically, the onprem server is MSSQLSERVER whereas the hosted one is SSRS, so the dbo.Keys table gets confused.
- restart report server
- test with chrome
- restore report server data sources (including subscription reports) -- use controlwks favre until db01e1-msc can be rebooted for Kerberos stuck
- MBHC RCM Cloud Access, MBHC RCM Classic Access, TBHC RCM Cloud Access and TBHC RCM Classic Access need access to SSRS (make sure it goes down into the IcsMain folder and subfolders)
- BillingSelection and BillingException need correct data sources!

5. restore vsta-rcm (including two post-restore scripts)
- crosswalk user_mstr table
- apply Patch 2

6. restore vsta-rcm-test (including two post-restore scripts) DO LATER in the week!
- crosswalk user_mstr table

7. enable Windows Scheduled Tasks

8. copy Image Deltas

9. change MIRTH ports (currently flipped, Joy says to coord with Valerie the night of the migration)
- PROD
- 19000 10.252.131.235
- 7500 10.252.131.245
- TEST
- 19001 10.252.131.235
- 7501 10.252.131.245

10. restart HL7 and all other interfaces

Data Source=db01e1-msc\vsta;Initial Catalog=vsta-rcm
