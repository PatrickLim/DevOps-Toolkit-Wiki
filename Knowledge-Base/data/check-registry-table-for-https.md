select * from GLOBAL_REGISTRY where VALUE1 like '%http%' or VALUE2 like '%http%'

select * from GLOBAL_REGISTRY where REGISTRY_KEY = 'BI_SERVER_URL'

--update GLOBAL_REGISTRY set VALUE2 = 'https://db01w1-chlb.openvista.net' where REGISTRY_KEY = 'BI_SERVER_URL'

select * from GLOBAL_REGISTRY where REGISTRY_KEY = 'GUAR_PAYMENT_RCPT_REPORT_URL'

--update GLOBAL_REGISTRY set VALUE1 = 'http://db01w1-chlb.openvista.net/reportserver/Pages/ReportViewer.aspx?/chlb-rcm/InsightCS Application/WebGuarantorPaymentReceipt' where REGISTRY_KEY = 'GUAR_PAYMENT_RCPT_REPORT_URL'

