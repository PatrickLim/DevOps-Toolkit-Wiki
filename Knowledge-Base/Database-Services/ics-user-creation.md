
controlwks
IcsAutoRoom
IcsAutoDisch
IcsPrintSrv
IcsStepUpd
IcsSysBal
IcsInf
IcsBillSvc
IcsGLSum
IcsSmBalWrtOff
IcsContrReimb
IcsOEPrint
IcsOEChg
IcsTranSvc
IcsBckFreqProc
IcsPayProc
IcsServices
IcsNotif

--1. do this in MASTER to clean everything out first from the server level

drop login controlwks
drop login IcsAutoRoom
drop login IcsAutoDisch
drop login IcsPrintSrv
drop login IcsStepUpd
drop login IcsSysBal
drop login IcsInf
drop login IcsBillSvc
drop login IcsGLSum
drop login IcsSmBalWrtOff
drop login IcsContrReimb
drop login IcsOEPrint
drop login IcsOEChg
drop login IcsTranSvc
drop login IcsBckFreqProc
drop login IcsPayProc
drop login IcsServices
drop login IcsNotif

--2. then recreate in MASTER for the server level

CREATE LOGIN controlwks WITH PASSWORD='favre', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsAutoRoom WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsAutoDisch WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsPrintSrv WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsStepUpd WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsSysBal WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsInf WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsBillSvc WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsGLSum WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsSmBalWrtOff WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsContrReimb WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsOEPrint WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsOEChg WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsTranSvc WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsBckFreqProc WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsPayProc WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsServices WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN IcsNotif WITH PASSWORD='St0ck3!!', CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

--3. then for EACH DATABASE (except the Warehouse), drop all previously-defined users

drop user controlwks
drop user IcsAutoRoom
drop user IcsAutoDisch
drop user IcsPrintSrv
drop user IcsStepUpd
drop user IcsSysBal
drop user IcsInf
drop user IcsBillSvc
drop user IcsGLSum
drop user IcsSmBalWrtOff
drop user IcsContrReimb
drop user IcsOEPrint
drop user IcsOEChg
drop user IcsTranSvc
drop user IcsBckFreqProc
drop user IcsPayProc
drop user IcsServices
drop user IcsNotif
drop user [OPENVISTA\chlbrcmsql]
drop user [OPENVISTA\chlbrcmwebapp]

--4. now recreate users in EACH DATABASE (except the Warehouse)

create user controlwks for login controlwks
create user IcsAutoRoom for login IcsAutoRoom
create user IcsAutoDisch for login IcsAutoDisch
create user IcsPrintSrv for login IcsPrintSrv
create user IcsStepUpd for login IcsStepUpd
create user IcsSysBal for login IcsSysBal
create user IcsInf for login IcsInf
create user IcsBillSvc for login IcsBillSvc
create user IcsGLSum for login IcsGLSum
create user IcsSmBalWrtOff for login IcsSmBalWrtOff
create user IcsContrReimb for login IcsContrReimb
create user IcsOEPrint for login IcsOEPrint
create user IcsOEChg for login IcsOEChg
create user IcsTranSvc for login IcsTranSvc
create user IcsBckFreqProc for login IcsBckFreqProc
create user IcsPayProc for login IcsPayProc
create user IcsServices for login IcsServices
create user IcsNotif for login IcsNotif


for rcm and rcm-test only
ALTER ROLE [QueryUsers] ADD MEMBER controlwks
ALTER ROLE [QueryUsers] ADD MEMBER IcsAutoRoom
ALTER ROLE [QueryUsers] ADD MEMBER IcsAutoDisch
ALTER ROLE [QueryUsers] ADD MEMBER IcsPrintSrv
ALTER ROLE [QueryUsers] ADD MEMBER IcsStepUpd
ALTER ROLE [QueryUsers] ADD MEMBER IcsSysBal
ALTER ROLE [QueryUsers] ADD MEMBER IcsInf
ALTER ROLE [QueryUsers] ADD MEMBER IcsBillSvc
ALTER ROLE [QueryUsers] ADD MEMBER IcsGLSum
ALTER ROLE [QueryUsers] ADD MEMBER IcsSmBalWrtOff
ALTER ROLE [QueryUsers] ADD MEMBER IcsContrReimb
ALTER ROLE [QueryUsers] ADD MEMBER IcsOEPrint
ALTER ROLE [QueryUsers] ADD MEMBER IcsOEChg
ALTER ROLE [QueryUsers] ADD MEMBER IcsTranSvc
ALTER ROLE [QueryUsers] ADD MEMBER IcsBckFreqProc
ALTER ROLE [QueryUsers] ADD MEMBER IcsPayProc
ALTER ROLE [QueryUsers] ADD MEMBER IcsServices
ALTER ROLE [QueryUsers] ADD MEMBER IcsNotif

for all five databases
ALTER ROLE [SQLUsers] ADD MEMBER controlwks
ALTER ROLE [SQLUsers] ADD MEMBER IcsAutoRoom
ALTER ROLE [SQLUsers] ADD MEMBER IcsAutoDisch
ALTER ROLE [SQLUsers] ADD MEMBER IcsPrintSrv
ALTER ROLE [SQLUsers] ADD MEMBER IcsStepUpd
ALTER ROLE [SQLUsers] ADD MEMBER IcsSysBal
ALTER ROLE [SQLUsers] ADD MEMBER IcsInf
ALTER ROLE [SQLUsers] ADD MEMBER IcsBillSvc
ALTER ROLE [SQLUsers] ADD MEMBER IcsGLSum
ALTER ROLE [SQLUsers] ADD MEMBER IcsSmBalWrtOff
ALTER ROLE [SQLUsers] ADD MEMBER IcsContrReimb
ALTER ROLE [SQLUsers] ADD MEMBER IcsOEPrint
ALTER ROLE [SQLUsers] ADD MEMBER IcsOEChg
ALTER ROLE [SQLUsers] ADD MEMBER IcsTranSvc
ALTER ROLE [SQLUsers] ADD MEMBER IcsBckFreqProc
ALTER ROLE [SQLUsers] ADD MEMBER IcsPayProc
ALTER ROLE [SQLUsers] ADD MEMBER IcsServices
ALTER ROLE [SQLUsers] ADD MEMBER IcsNotif

https://help.genesys.com/pureconnect/mergedprojects/wh_tr/mergedprojects/wh_tr_active_directory_sql/desktop/run_sql_server_script_to_add_ad_accounts.htm

***** Alternatively, handle ORPHANED users this way *****

ALTER USER controlwks WITH LOGIN = controlwks

alter user controlwks with login = controlwks
alter user IcsAutoRoom with login = IcsAutoRoom
alter user IcsAutoDisch with login = IcsAutoDisch
alter user IcsPrintSrv with login = IcsPrintSrv
alter user IcsStepUpd with login = IcsStepUpd
alter user IcsSysBal with login = IcsSysBal
alter user IcsInf with login = IcsInf
alter user IcsBillSvc with login = IcsBillSvc
alter user IcsGLSum with login = IcsGLSum
alter user IcsSmBalWrtOff with login = IcsSmBalWrtOff
alter user IcsContrReimb with login = IcsContrReimb
alter user IcsOEPrint with login = IcsOEPrint
alter user IcsOEChg with login = IcsOEChg
alter user IcsTranSvc with login = IcsTranSvc
alter user IcsBckFreqProc with login = IcsBckFreqProc
alter user IcsPayProc with login = IcsPayProc
alter user IcsServices with login = IcsServices
alter user IcsNotif with login = IcsNotif