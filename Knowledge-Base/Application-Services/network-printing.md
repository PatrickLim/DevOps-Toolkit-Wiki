1. whichever dude is running IcsPrintService should have USER_MSTR entry with base location = 1

2. IIS server needs an ODBC connection in order to write to the REPORT_REQUEST and REPORT_REQUEST_DEST tables (because that dll reuses Classic code)

If you get this sort of error anywhere EXCEPT the webserver, it is a Kerberos Delegation issue.

![image.png](/.attachments/image-8430455f-e23c-44cb-87ae-0e05770df593.png)