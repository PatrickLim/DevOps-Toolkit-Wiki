USE ICSMAIN
GO
-- ----------------------------------------------------------------------------
-- Declare and set variables
-- ----------------------------------------------------------------------------

declare @user_name varchar(20)
declare @first_name varchar(15)
declare @middle_initial varchar(1)
declare @last_name varchar(20)
declare @initials varchar(6)
declare @NT_Domain varchar(64)

set @user_name = ''
set @first_name = ''
set @middle_initial = ''
set @last_name = ''
set @initials = ''
set @NT_Domain = ''

-- ----------------------------------------------------------------------------
-- Add First ICS NT User to USER_MSTR first
-- ----------------------------------------------------------------------------
begin tran t1
insert into user_mstr (username,first_name,middle_initial,last_name,location_cd,initials,enable_flg,nt_Account,nt_domain,create_date,create_by)
               values (@user_name,@first_name,@middle_initial,@last_name,1,@initials,1,1,@NT_Domain,getdate(),'sa')

insert into user_location (username,location_CD,create_date,create_by,mod_date,mod_by)
                   values (@user_name,1,GetDate(),@user_name,GetDate(),@user_name)

insert into user_applications values (@user_name,'USRMAINT',0)
insert into sec_user_right values (@user_name,'USR_INQ')
insert into sec_user_right values (@user_name,'USR_MOD')

select * from user_mstr
select * from sec_user_right

/*
rollback tran t1
commit tran t1
*/
