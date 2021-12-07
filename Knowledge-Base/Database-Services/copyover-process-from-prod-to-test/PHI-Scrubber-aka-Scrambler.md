https://medsphere.sharepoint.com/Implementation%20Services/Shared%20Documents/Forms/AllItems.aspx?id=%2FImplementation%20Services%2FShared%20Documents%2FRevenue%20Cycle%20Management%2FSQL%20Scripts%2FPHI%20Protect%20Test%20Environment%2Esql&parent=%2FImplementation%20Services%2FShared%20Documents%2FRevenue%20Cycle%20Management%2FSQL%20Scripts&p=true&originalPath=aHR0cHM6Ly9tZWRzcGhlcmUuc2hhcmVwb2ludC5jb20vOnU6L2cvSW1wbGVtZW50YXRpb24lMjBTZXJ2aWNlcy9FZjNxZGpVeUlZQkVzZEVvR0syV3Bqb0IyOTFoZTQ2QlplMTFmdDBTcC1mRmxnP3J0aW1lPWJncFR1cHdmMlVn

----------------------------------------

USE [IcsDev]
GO

begin transaction

update AKA set LAST_NAME = FIRST_NAME where URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')

update DEL_PATIENT set LAST_NAME = FIRST_NAME, ssn = null WHERE LAST_NAME NOT LIKE 'ZZ%'

update OK_STATE_REPORTING_VISIT set LAST_NAME = FIRST_NAME, ssn = null  WHERE LAST_NAME NOT LIKE 'ZZ%'

update OK_STATE_REPORTING_VISIT set STREET = substring(street,1,patindex('% %',STREET)-1) 
	where patindex('% %',STREET) <> 0 and patindex('% %',STREET) is not null AND LAST_NAME NOT LIKE 'ZZ%'

update PHYS_MSTR set LAST_NAME = FIRST_NAME
update PHYS_MSTR set SSN = null
go

disable trigger ALL on dbo.PATIENT
go

update PATIENT set LAST_NAME = FIRST_NAME, ssn = null  WHERE LAST_NAME NOT LIKE 'ZZ%'
go

enable trigger ALL on dbo.PATIENT
go

disable trigger ALL on dbo.GUARANTOR
go

update G set LAST_NAME = G.FIRST_NAME, SSN = NULL, STREET_2 = NULL, PHONE_NO = NULL
FROM GUARANTOR G
INNER JOIN VISIT V ON G.VISIT_NO = V.VISIT_NO
INNER JOIN PATIENT P ON V.URN = P.URN
  WHERE P.LAST_NAME NOT LIKE 'ZZ%'


update G set STREET = substring(street,1,patindex('% %',STREET)-1) 
FROM GUARANTOR G
INNER JOIN VISIT V ON G.VISIT_NO = V.VISIT_NO
INNER JOIN PATIENT P ON V.URN = P.URN
	where patindex('% %',G.STREET) <> 0 and patindex('% %',G.STREET) is not null AND  P.LAST_NAME NOT LIKE 'ZZ%'

go

enable trigger ALL on dbo.GUARANTOR
go


disable trigger ALL on dbo.LOCAL_ADDR
go

update LOCAL_ADDR set STREET_2 = null where STREET_2 is not null  AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
update LOCAL_ADDR set STREET = substring(street,1,patindex('% %',STREET)-1) 
	where patindex('% %',STREET) <> 0 and patindex('% %',STREET) is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
update LOCAL_ADDR set PHONE_NO = null where PHONE_NO is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
go

enable trigger ALL on dbo.LOCAL_ADDR
go


disable trigger ALL on dbo.LOCAL_ADDR_HIST
go

update LOCAL_ADDR_HIST set STREET_2 = null where STREET_2 is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
update LOCAL_ADDR_HIST set STREET = substring(street,1,patindex('% %',STREET)-1) 
	where patindex('% %',STREET) <> 0 and patindex('% %',STREET) is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
update LOCAL_ADDR_HIST set PHONE_NO = null where PHONE_NO is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
go

enable trigger ALL on dbo.LOCAL_ADDR_HIST
go

disable trigger ALL on dbo.PERM_ADDR
go

update PERM_ADDR set STREET_2 = null where STREET_2 is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
update PERM_ADDR set STREET = substring(street,1,patindex('% %',STREET)-1) 
	where patindex('% %',STREET) <> 0 and patindex('% %',STREET) is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
update PERM_ADDR set PHONE_NO = null where PHONE_NO is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
go

enable trigger ALL on dbo.PERM_ADDR
go

disable trigger ALL on dbo.PERM_ADDR_HIST
go

update PERM_ADDR_HIST set STREET_2 = null where STREET_2 is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
update PERM_ADDR_HIST set STREET = substring(street,1,patindex('% %',STREET)-1) 
	where patindex('% %',STREET) <> 0 and patindex('% %',STREET) is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
update PERM_ADDR_HIST set PHONE_NO = null where PHONE_NO is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
go

enable trigger ALL on dbo.PERM_ADDR_HIST
go

disable trigger ALL on dbo.RELATIVE
go

update RELATIVE set LAST_NAME = FIRST_NAME WHERE URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
update RELATIVE set SSN = null WHERE URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
update RELATIVE set STREET_2 = null where STREET_2 is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
update RELATIVE set STREET = substring(street,1,patindex('% %',STREET)-1) 
	where patindex('% %',STREET) <> 0 and patindex('% %',STREET) is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
update RELATIVE set PHONE_NO = null where PHONE_NO is not null AND URN IN (SELECT URN FROM PATIENT WHERE LAST_NAME NOT LIKE 'ZZ%')
go

enable trigger ALL on dbo.RELATIVE
go

disable trigger ALL on dbo.SUBSCRIBER
go

update S set LAST_NAME = S.FIRST_NAME 
FROM SUBSCRIBER S 
INNER JOIN INSURANCE I ON I.ROW_NO = S.INSURANCE_ROW_NO
INNER JOIN VISIT V ON I.VISIT_NO = V.VISIT_NO
INNER JOIN PATIENT P ON V.URN = P.URN
WHERE P.LAST_NAME NOT LIKE 'ZZ%'

update S set SSN = null 
FROM SUBSCRIBER S
INNER JOIN INSURANCE I ON I.ROW_NO = S.INSURANCE_ROW_NO
INNER JOIN VISIT V ON I.VISIT_NO = V.VISIT_NO
INNER JOIN PATIENT P ON V.URN = P.URN
WHERE P.LAST_NAME NOT LIKE 'ZZ%'

update S set STREET_2 = null 
FROM SUBSCRIBER S 
INNER JOIN INSURANCE I ON I.ROW_NO = S.INSURANCE_ROW_NO
INNER JOIN VISIT V ON I.VISIT_NO = V.VISIT_NO
INNER JOIN PATIENT P ON V.URN = P.URN
where S.STREET_2 is not null AND P.LAST_NAME NOT LIKE 'ZZ%'

update S set STREET = substring(street,1,patindex('% %',STREET)-1) 
FROM SUBSCRIBER S
INNER JOIN INSURANCE I ON I.ROW_NO = S.INSURANCE_ROW_NO
INNER JOIN VISIT V ON I.VISIT_NO = V.VISIT_NO
INNER JOIN PATIENT P ON V.URN = P.URN
	where patindex('% %',S.STREET) <> 0 and patindex('% %',S.STREET) is not null AND P.LAST_NAME NOT LIKE 'ZZ%'

update S set PHONE_NO = null
FROM SUBSCRIBER S
INNER JOIN INSURANCE I ON I.ROW_NO = S.INSURANCE_ROW_NO
INNER JOIN VISIT V ON I.VISIT_NO = V.VISIT_NO
INNER JOIN PATIENT P ON V.URN = P.URN
 where S.PHONE_NO is not null AND P.LAST_NAME NOT LIKE 'ZZ%'
go

enable trigger ALL on dbo.SUBSCRIBER
go

disable trigger ALL on dbo.GUARANTOR_EMPLOYER
go

update GE set PHONE_NO = null
FROM GUARANTOR_EMPLOYER GE
INNER JOIN VISIT V ON GE.VISIT_NO = V.VISIT_NO
INNER JOIN PATIENT P ON V.URN = P.URN
WHERE P.LAST_NAME NOT LIKE 'ZZ%'
go

enable trigger ALL on dbo.GUARANTOR_EMPLOYER
go

disable trigger ALL on dbo.SUBSCRIBER_EMPLOYER
go

update SE set PHONE_NO = null
FROM SUBSCRIBER_EMPLOYER SE
INNER JOIN INSURANCE I ON I.ROW_NO = SE.INSURANCE_ROW_NO
INNER JOIN VISIT V ON I.VISIT_NO = V.VISIT_NO
INNER JOIN PATIENT P ON V.URN = P.URN
WHERE P.LAST_NAME NOT LIKE 'ZZ%'
go

enable trigger ALL on dbo.SUBSCRIBER_EMPLOYER
go

disable trigger ALL on dbo.VISIT_EMPLOYER
go

update VE set PHONE_NO = null
FROM VISIT_EMPLOYER VE
INNER JOIN VISIT V ON VE.VISIT_NO = V.VISIT_NO
INNER JOIN PATIENT P ON V.URN = P.URN
WHERE P.LAST_NAME NOT LIKE 'ZZ%'
go

enable trigger ALL on dbo.VISIT_EMPLOYER
go

disable trigger ALL on dbo.INSURANCE
go

update I set INS_POLICY_NO = 'xxxxx' + substring(INS_POLICY_NO,6,5)
FROM INSURANCE I
INNER JOIN VISIT V ON I.VISIT_NO = V.VISIT_NO
INNER JOIN PATIENT P ON V.URN = P.URN
where INS_POLICY_NO < 'A'
and len(INS_POLICY_NO) = 9 or len(INS_POLICY_NO) = 10 AND P.LAST_NAME NOT LIKE 'ZZ%'
go

enable trigger ALL on dbo.INSURANCE
go

COMMIT transaction
