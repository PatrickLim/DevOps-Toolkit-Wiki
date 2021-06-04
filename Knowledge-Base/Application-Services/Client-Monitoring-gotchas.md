
at Arkansas ASH what was missing was:
NOTIFICATION_RECIPIENTS
SMTP_SERVER_MSTR
NOTIFICATION_EMAIL_MSTR (needed to use the newly created entry in SMTP_SERVER_MSTR)
NOTIFICATION_EMAIL_OVERRIDE (needed to use the newly created entry in SMTP_SERVER_MSTR)


insert into SMTP_SERVER_MSTR (SMTP_SERVER_CD,HOST_NAME,PORT,NT_AUTHENTICATION,USERNAME,PASSWORD,SENDER_EMAIL,TLS_FLG)
values ('MedsphereSMTP','smtp.office365.com',587,0,'sqlmail@medsphere.com','be%NB4@no9u8FSEB^86y','sqlmail@medsphere.com',1)

update NOTIFICATION_EMAIL_MSTR set SMTP_SERVER_CD = 'MedsphereSMTP'
update NOTIFICATION_EMAIL_OVERRIDE set SMTP_SERVER_CD = 'MedsphereSMTP'


added these to the Interface Services cfg files (this is just one sample):

device|notificationlog|SislnkHL7ToEngineHL7_ASHProd2|ash_rcm|controlwks|favre|FATAL|ERROR|WARN

add that line to the four outbound and one inbound service.

The subject line should have the customer acronym in front, do this by editing the SUBJECT field in the NOTIFICATION_EMAIL_OVERRIDE table.
