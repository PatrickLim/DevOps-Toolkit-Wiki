select * from ROLE_USERS where USERNAME = 'patrick.lim'
select * from ROLE_MSTR
select * from WEB_ROLE_RIGHT where ROLE_ID = 16 and APP_AREA_CD = 'MAINT'
select * from VERSION order by Create_Date desc
select * from WEB_RIGHT_MSTR where APP_AREA_CD like '%maint%'

insert into WEB_ROLE_RIGHT (ROLE_ID, APP_AREA_CD, SEC_RIGHT_ID) 
select 16,APP_AREA_CD, SEC_RIGHT_ID from WEB_RIGHT_MSTR where APP_AREA_CD = 'MAINT'
