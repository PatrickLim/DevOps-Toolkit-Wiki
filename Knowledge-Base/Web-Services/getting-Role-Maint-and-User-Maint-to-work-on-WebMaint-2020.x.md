ROLE_ID = 16 is usually "Full Access" so do these two inserts:

insert into WEB_ROLE_RIGHT (ROLE_ID, APP_AREA_CD, SEC_RIGHT_ID) values (16, 'MAINT', 'ROLE_MAINT')

insert into WEB_ROLE_RIGHT (ROLE_ID, APP_AREA_CD, SEC_RIGHT_ID) values (16, 'MAINT', 'USER_MAINT')