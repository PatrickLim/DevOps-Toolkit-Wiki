Data Source=db01e1-msc\vsta;Initial Catalog=vsta-rcm

**from original server:**

shut down processes
grab backups
grab PBIRS encryption keys
stage backup files (compress and upload to nextcloud)
stage image files (determine delta)

\\DEVINTF01\Images\ICSImages\IcsMain\40\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\50\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\7\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\AUTH\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\BILL INFO\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\Correspond\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\EOB_R\2022\11\
\\DEVINTF01\Images\ICSImages\IcsMain\INS CORR\2022\11\

on target server:
download backups
take report server offline
restore report server databases
restore report server encryption keys trcicssql-11-21-2022.snk LLss!123
if you get "scale out error" refer to this https://www.sqlnethub.com/blog/how-to-resolve-the-feature-scale-out-deployment-is-not-supported-in-this-edition-of-reporting-services/
basically, the onprem server is MSSQLSERVER whereas the hosted one is SSRS, so the dbo.Keys table gets confused.
restore report server data sources (including subscription reports) -- use controlwks favre until db01e1-msc can be rebooted for Kerberos stuck
MBHC RCM Cloud Access, MBHC RCM Classic Access, TBHC RCM Cloud Access and TBHC RCM Classic Access need access to SSRS (make sure it goes down into the IcsMain folder and subfolders)
restore vsta-rcm (including two post-restore scripts)
crosswalk user_mstr table
restore vsta-rcm-test (including two post-restore scripts)
crosswalk user_mstr table
enable Windows Scheduled Tasks

BillingSelection and BillingException need correct data sources!

Data Source=db01e1-msc\vsta;Initial Catalog=vsta-rcm
