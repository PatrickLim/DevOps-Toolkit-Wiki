
at Arkansas ASH what was missing was:
NOTIFICATION_RECIPIENTS
SMTP_SERVER_MSTR
NOTIFICATION_EMAIL_MSTR (needed to use the newly created entry in SMTP_SERVER_MSTR)
NOTIFICATION_EMAIL_OVERRIDE (needed to use the newly created entry in SMTP_SERVER_MSTR)

added these to the Interface Services cfg files:

device|notificationlog|SislnkHL7ToEngineHL7_ASHProd2|ash_rcm|controlwks|favre|FATAL|ERROR|WARN
