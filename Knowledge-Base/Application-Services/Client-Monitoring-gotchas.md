
at Arkansas ASH what was missing was:
NOTIFICATION_RECIPIENTS
SMTP_SERVER_MSTR
NOTIFICATION_EMAIL_MSTR (needed to use the newly created entry in SMTP_SERVER_MSTR)
NOTIFICATION_EMAIL_OVERRIDE (needed to use the newly created entry in SMTP_SERVER_MSTR)

added these to the Interface Services cfg files (this is just one sample):

device|notificationlog|SislnkHL7ToEngineHL7_ASHProd2|ash_rcm|controlwks|favre|FATAL|ERROR|WARN

add that line to the four outbound and one inbound service.

The subject line should have the customer acronym in front, do this by editing the SUBJECT field in the NOTIFICATION_EMAIL_OVERRIDE table.
