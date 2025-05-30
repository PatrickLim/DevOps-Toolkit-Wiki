If the CDR Processor logs have the error "Could not locate CLAIM_REVISIONS record for Trace Number" then that means there was no Trace Number generated for the 837.

At the start of the Claim Management cycle, an 837 file is uploaded to Waystar. In return, Waystar prepares CDR files that are read in to Insight. The Trace Number links the original 837 to the resulting CDR, and if this number is missing then the CDR cannot be read in to Insight and the claims must be worked manually.

To ensure that the 837 files are generated with Trace Numbers, make sure the EDI_TRACE_NO flag is set to 1 in all combinations of the UB92_OPTIONS table. Every time an 837 file is created, its header information (including its EDI_TRACE_NO) is stored in the UB92_HEADER table.

It may not be sufficient just to set that flag in the UB92_OPTIONS table. The rules for generating the 837 file are stored in the EDI_837_MSG_RULES, so make sure that the column is included by checking:

`select * from EDI_837_MSG_RULES where COLUMN_NAME = 'EDI_TRACE_NO'`