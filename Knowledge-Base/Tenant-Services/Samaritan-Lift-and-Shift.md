Data Source=db01e1-msc\sbc;Initial Catalog=sbc-rcm

from original server:
shut down access
shut down HL7 and other interfaces
shut down Windows Scheduled Tasks
grab backups
grab PBIRS encryption keys
stage backup files (compress and upload to nextcloud)
stage image files (determine delta)

on target server:
download backups
take report server offline
restore report server databases
restore report server encryption keys
restore report server data sources (including subscription reports)
SBC RCM Cloud Access and SBC RCM Classic Access need access to SSRS (make sure it goes down into the IcsMain folder and subfolders)
restore sbc-rcm (including two post-restore scripts)
crosswalk user_mstr table
restore sbc-rcm-test (including two post-restore scripts)
crosswalk user_mstr table
enable Windows Scheduled Tasks

BillingSelection and BillingException need correct data sources!

subscription reports:
add a "near midnight" schedule
Claim Reconciliation is emailed near midnight
Census by Nursing Station is emailed twice a day
Census by Nursing Station is filed every ten minutes

Data Source=db01e1-msc\sbc;Initial Catalog=sbc-rcm
ssumner@behavioralcenter.com
patrick.lim@medsphere.com;brian.stockell@medsphere.com
