1. whichever dude is running IcsPrintService should have USER_MSTR entry with base location = 1

2. IIS server needs an ODBC connection in order to write to the REPORT_REQUEST and REPORT_REQUEST_DEST tables (because that dll reuses Classic code)
