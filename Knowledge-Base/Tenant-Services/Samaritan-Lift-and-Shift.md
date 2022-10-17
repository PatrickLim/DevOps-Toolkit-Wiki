Data Source=db01e1-msc\sbc;Initial Catalog=sbc-rcm

**from original server:**
1. shut down processes
- shut down access
- shut down HL7 and other interfaces
- shut down Windows Scheduled Tasks
2. grab backups
- take final snapshot
- IcsMain, ReportServer, ReportServerTempDB
- IcsTest DO LATER in the week!
3. grab PBIRS encryption keys
4. stage backup files (compress and upload to nextcloud)
5. stage image files (determine delta) use this query:


```
select * from IMAGE_DIRS i join
(select FORM_TYPE_CD, SEQ_NUM,numimages=count(*) from PAT_IMAGE where DATE_SCANNED > '10/4/2022' group by FORM_TYPE_CD, SEQ_NUM) x
on i.FORM_TYPE_CD = x.FORM_TYPE_CD and i.SEQ_NUM = x.SEQ_NUM
```

DIRECTORY
\\sbc-rcm-sql.samaritan.local\images\ICSImages\IcsMain\Billing\2022\10\
\\sbc-rcm-sql.samaritan.local\images\ICSImages\IcsMain\Mailrcpt\2022\10\
\\sbc-rcm-sql.samaritan.local\images\ICSImages\IcsMain\INSLETTER\2022\10\
\\sbc-rcm-sql.samaritan.local\images\ICSImages\IcsMain\INTAKE\2022\10\
\\sbc-rcm-sql.samaritan.local\images\ICSImages\IcsMain\40\2022\10\
\\sbc-rcm-sql.samaritan.local\images\ICSImages\IcsMain\EOB_R\2022\10\
\\sbc-rcm-sql.samaritan.local\images\ICSImages\IcsMain\DRVLIC\2022\10\
\\sbc-rcm-sql.samaritan.local\images\ICSImages\IcsMain\INSCARD\2022\10\
\\sbc-rcm-sql.samaritan.local\images\ICSImages\IcsMain\7\2022\10\

**on target server:**
1. download backups
2. take report server offline
3. restore report server databases
4. restore report server encryption keys
- restart report server
- test with Chrome
5. restore sbc-rcm
- two post-restore scripts
- crosswalk user_mstr table
6. restore sbc-rcm-test (DO LATER in the week!)
- two post-restore scripts
- crosswalk user_mstr table
7. enable Windows Scheduled Tasks
- finish the PBIRS Restoration below before enabling Nightly Autobilling because it relies on BillingSelection and Billing Exception reports
- verify the Waystar upload/download tasks
8. copy Image Deltas

**PBIRS Restoration**
1. add a "near midnight" schedule
2. Claim Reconciliation is emailed near midnight
3. Census by Nursing Station is emailed twice a day
4. Census by Nursing Station is filed every ten minutes (see subpage to this Wiki for fileshare details)
5. restore report server data sources
- shared data source
- Claim Reconciliation uses controlwks
- Census by Nursing Station uses controlwks
- BillingSelection and BillingException uses controlwks
6. SBC RCM Cloud Access and SBC RCM Classic Access need access to SSRS (make sure it goes down into the IcsMain folder and subfolders)

Data Source=db01e1-msc\sbc;Initial Catalog=sbc-rcm
ssumner@behavioralcenter.com
patrick.lim@medsphere.com;brian.stockell@medsphere.com
