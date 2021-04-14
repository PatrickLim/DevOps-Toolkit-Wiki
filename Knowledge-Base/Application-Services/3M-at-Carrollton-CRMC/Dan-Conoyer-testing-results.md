See attachment for details.

1.	The most difficult thing was getting 3M setup for a secure WebAppLink address.
2.	Turned on access of Medical Records Workspace.  But, did so with some things being ignored or not turned on.
3.	Realized TruCode and 3M cannot co-exist because of location registry.
4.	Queue setup was essential to have based on Insight worklists.  Lot of script was Queue setup.
5.	Assigned Users to all Queues
6.	Removed Insight Access to Abstracting plus various other non-used Medical Records applications.  Trying to clean up security as I go.
7.	Rules:
a.	Most clients will launch two 3M products.  APC Code Finder or CMS DRG CodeFinder.  But, CRMC has a third Medicaid-TX APR CodeFinder.
b.	Setup was a little tricky (thanks Charles for assistance)
c.	It would be my recommendation to set the main product/application setting to 13 (APC Code Finder) not CMS DRG CodeFinder.
i.	4              APPLICATION_SETTINGS               CF_APPLICATION             NULL     NULL     0              0                NULL     0              NULL     NULL     13           NULL     NULL     NULL     NULL     1
d.	Set custom applications by Classification Code/Payer as follows:
i.	ROW_NO            SECTION_NAME               TAG_NAME        TAG_NAME_3M                DEFAULT_VALUE             FORCE_OVERRIDE_FLG REQUIRED_FLG FORMAT                CODIFIED_FLG  CODED_SIGNIFIER           SECTION_PROCESSING_MVF                CUSTOM_VAL1 CUSTOM_VAL2 CUSTOM_VAL3 CUSTOM_VAL4 CUSTOM_VAL5                ENABLE_FLG
ii.	1              APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     NULL     NULL     NULL     0                NULL     NULL     I               MC         05           0              NULL     1
iii.	114         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               XX           05           150         NULL     1
iv.	115         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               1              05           0              NULL     1
v.	116         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               BB           05           0              NULL     1
vi.	117         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               CH          05           0              NULL     1
vii.	118         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               CM         05           0              NULL     1
viii.	119         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               DQ          05           0              NULL     1
ix.	120         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               HI            05           0              NULL     1
x.	121         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               MG        05           0              NULL     1
xi.	122         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               MM       05           0              NULL     1
xii.	123         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               SD           05           0              NULL     1
xiii.	124         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               SI            05           0              NULL     1
xiv.	125         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               SM         05           0              NULL     1
xv.	126         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               SP           05           0              NULL     1
xvi.	127         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               SR           05           0              NULL     1
xvii.	128         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               WC         05           0              NULL     1
xviii.	129         APPLICATION_BY_CLASS_PAYER NULL     NULL     NULL     0              0              NULL     0                NULL     NULL     I               XM         05           0              NULL     1
e.	The Custom Value 4 of 150 launched the APR Codefinder.
f.	3M Product code of 06 should be 05.
8.	The disposition code from RCM has leading zeroes as it should have.  But, 3M sends back to RCM without leading zero causing import to fail.  During my testing, I could not see where user is allowed to update this field.  So, I disable this element in the in-tags configuration.  And problem was solved.
9.	Another issue:  Ext Coder button is disabled, if Abstract Status is “Waiting Review”.  User has to change to “Incomplete” before button will enable.  Not a huge thing, but oddly, if status is “completed” button is enabled.  Recommend code update.

It is my request that several CRMC coders spend this week testing.  And if all goes well, script will be executed in Production next week.

Dan

(here is Dan's attachment)

[MR Test to Production Update.sql](/.attachments/MR%20Test%20to%20Production%20Update-ea2725b9-7d7e-4795-86ab-6894db561677.sql)

The relevant table is ENCODER_CONFIG_MSTR
