this first doc is 700 pages!

https://medsphere.sharepoint.com/:w:/r/STL/Development/_layouts/15/Doc.aspx?sourcedoc=%7B9C3752A2-EB3E-4D23-8486-D19C437DEA7E%7D&file=Interfaces.doc&action=default&mobileredirect=true&DefaultItemOpen=1

this one is only 19 pages:

[Interface Training Manual.docx](/.attachments/Interface%20Training%20Manual-86189ad0-e7be-42dc-8e2b-913f0d75a5c8.docx)

useful queries:

SELECT CONVERT(VARCHAR(MAX), CONVERT(VARBINARY(MAX), DATA)), * FROM TRANSACTIONS ORDER BY RECORD_NUM DESC

SELECT CONVERT(VARCHAR(MAX), CONVERT(VARBINARY(MAX), DATA)) , * FROM TRANSACTIONS WHERE CONVERT(VARCHAR(MAX), CONVERT(VARBINARY(MAX), DATA)) LIKE '%HXAMB%'

Important Tables
syslnk.record_type
syslnk.record_routing
