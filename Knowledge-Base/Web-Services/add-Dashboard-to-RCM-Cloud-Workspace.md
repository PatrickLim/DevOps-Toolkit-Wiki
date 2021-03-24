1. First insert into REPORTING_MSTR the REPORTING_ID field is identity int. REPORTING_GROUP_ID 28 just happens to be the "Dashboards" group in REPORTING_GROUP_MSTR so replace it with the correct id.

insert into REPORTING_MSTR (REPORTING_TYPE_MVF, REPORT_NAME, REPORTING_GROUP_ID, WEB_FLG) values (6, 'AtbArStatus', 28, 1)
insert into REPORTING_MSTR (REPORTING_TYPE_MVF, REPORT_NAME, REPORTING_GROUP_ID, WEB_FLG) values (6, 'Cash', 28, 1)

2. Get the new REPORTING_ID and insert into REPORTING_REPORT_PROPERTIES. The Data Path should be the one that launches the pbix from the PBIRS webpage.

insert into REPORTING_REPORT_PROPERTIES (REPORTING_ID, SHOW_PARAMETERS, SHOW_TOOLBAR, INTERACTIVE_ENABLED, HISTORICAL_ENABLED, DATA_PATH, ORIENTATION_TYPE) values (811, 0, 0, 0, 0, '/reportspbirs/powerbi/Business%20Intelligence/AtbArStatusDashboard', 0)
insert into REPORTING_REPORT_PROPERTIES (REPORTING_ID, SHOW_PARAMETERS, SHOW_TOOLBAR, INTERACTIVE_ENABLED, HISTORICAL_ENABLED, DATA_PATH, ORIENTATION_TYPE) values (812, 0, 0, 0, 0, '/reportspbirs/powerbi/Business%20Intelligence/CashDashboard', 0)

3. To get the dashboard reports to show up in a Workspace in RCM Cloud, insert into WEB_AREA_REPORTS 

insert into WEB_AREA_REPORTS (APP_AREA_CD, REPORTING_ID) values ('SCHEDULING', 811)
insert into WEB_AREA_REPORTS (APP_AREA_CD, REPORTING_ID) values ('SCHEDULING', 812)

4. Last, for security get the ROLE_ID that your user has and add it to WEB_ROLE_REPORTS 

insert into WEB_ROLE_REPORTS (ROLE_ID, REPORTING_ID) values (2,811)
insert into WEB_ROLE_REPORTS (ROLE_ID, REPORTING_ID) values (2,812)


![image.png](/.attachments/image-431d902a-0e08-4ab2-a746-ed2c0cca99cc.png)