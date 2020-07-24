From: Brian Dietz <brian.dietz@medsphere.com> 
Sent: Thursday, July 23, 2020 11:18 AM
To: Brian Stockell <brian.stockell@medsphere.com>; Patrick Lim <patrick.lim@medsphere.com>
Subject: Notes on receipt setup

These have my old links, but you get the idea. I don’t think the POS_PAYMENTS… one is used anymore. That quick action got deprecated. As of 2019.3, you can generate a receipt from a Payment Entry quick action in Registration, Scheduling, Collections, etc. and Payment Posting > Self Pay work queues.

Receipt Setup
There are Registry keys required to set up receipts from Payment Entry quick actions or Payment Posting. The keys are:
 
PAYMENT_ENTRY_RCPT_REPORT_URL
•	Location Registry
•	Value 1: http://mscstlqa/ReportServer/Pages/ReportViewer.aspx?/IcsQA_2019_3_AUDIT/InsightCS Application/WebPaymentReceipt
•	Value 2: 
rc:Parameters=false&rs:Format=<FORMAT>&VisitNo=<VISIT_NO>&RowNo=<ROW_NO>&ReceiptNo=<RECEIPT_NO>&Reprint=<REPRINT>
 
GUAR_PAYMENT_RCPT_REPORT_URL
•	Global Registry
•	Value 1: http://mscstlqa/ReportServer/Pages/ReportViewer.aspx?/IcsQA_2019_3_AUDIT/InsightCS Application/WebGuarantorPaymentReceipt
•	Value 2: rs:Format=<FORMAT>&rc:Parameters=false&RowNo=<ROW_NO>&ReceiptNo=<RECEIPT_NO>&Reprint=<REPRINT>
 
POS_PAYMENTS_RCPT_REPORT_URL
•	Value 1: /Pages/ReportViewer.aspx?/IcsQA_2017_3_Manual_Web/InsightCS Application/WebPosPaymentReceipt
•	Value 2: rs:Format=PDF&rc:Parameters=false&VisitNo=<VISIT_NO>&PaymentRowNo=<PAYMENT_ROW_NO>&RelativeRowNo=<RELATIVE_ROW_NO>&PayAmt=<PAY_AMT>&PayDate=<PAY_DATE>&CreateBy=<CREATE_BY>
 
Requires form type RECEIPTIMG (which is installed by script). Requires a directory to be set.
 
In Imaging Security Maintenance, give full rights to the new form type. Can use below:
insert into imaging_group_forms values('ALL', 0, 'RECEIPTIMG')
insert into imaging_group_forms values('ALL', 1, 'RECEIPTIMG')
insert into imaging_group_forms values('ALL', 2, 'RECEIPTIMG')


Brian Dietz
Sr. Quality Assurance Analyst
