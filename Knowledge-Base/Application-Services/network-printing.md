1. whichever dude is running IcsPrintService should have USER_MSTR entry with base location = 1

2. IIS server needs an ODBC connection in order to write to the REPORT_REQUEST and REPORT_REQUEST_DEST tables (because that dll reuses Classic code)

If you get this sort of error anywhere EXCEPT the webserver, it is a Kerberos Delegation issue.

![image.png](/.attachments/image-8430455f-e23c-44cb-87ae-0e05770df593.png)

You have to take the account that is running the IIS Application Pool and enable him for Kerberos Delegation. Unfortunately the Targeted Kerberos (explained in another wiki in this knowledge base) is insufficient. This is because the browser is asking the IIS webapp to go through an ODBC connection to write to the REPORT_REQUEST and REPORT_REQUEST_DEST tables.

You may also need to do the same to the host machine running IIS (enable for delegation).