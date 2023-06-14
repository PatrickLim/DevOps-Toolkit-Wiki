Notification Service / Billing Service / CDR Processor / DB Snapshot
The Notification Service, Billing Service CDR Processor and DB Snapshot services are not installed by the Interface installer, and must be installed manually, using the InsightSvc executable.  Perform the following steps to install these services:
1.	On the application server, navigate to the following directory: C:\Program Files (x86)\Insight\BIN\Config Examples\ 
2.	Copy the following files to the desktop:
i)	Insight.Services.Billing.dll.config
ii)	Insight.Services.CDRProcessor.dll.config
iii)	Insight.Services.DBSnapshot.dll.config
iv)	Insight.Services.Notification.dll.config
v)	InsightSvc.exe.config
3.	Make the following updates to each of the files:
i)	Insight.Services.Billing.dll.config
(1)	Update the baseAddress value.  This value should match the value in the SERVICES_MSTR table in the RCM database for the billing service.

![image.png](/.attachments/image-ac7ab93a-fde0-48d0-ab38-7bcc29459a16.png)

(2)	Update the log file path/name:

![image.png](/.attachments/image-64c49575-d3b5-4739-8229-52578df988a1.png)

ii)	Insight.Services.CDRProcessor.dll.config
(1)	Update the log file path/name:

![image.png](/.attachments/image-7a979c98-7ea0-48dd-8153-c54a3e1eae7c.png)

iii)	Insight.Services.DBSnapshot.dll.config
(1)	Update the connection string info for the RCM and Sislnk databases. Controlwks credentials can be used.  The warehouse connection string can be blanked out.

![image.png](/.attachments/image-1f786bbc-eb77-4b0a-9038-1a814c8cc6f9.png)

(2)	Update database values for the RCM and Sislnk Databases (warehouse can remain as-is):

![image.png](/.attachments/image-949ae6e5-cd13-412f-ab20-0b962f36ac4e.png)

(3)	Update log file path/name:

![image.png](/.attachments/image-2dda5a76-1f03-438c-9296-9606e8b85a92.png)

iv)	Insight.Services.Notification.dll.config
(1)	Update log file path/name: 

![image.png](/.attachments/image-1ae724f4-6c6c-4ada-b657-420267c837af.png)

v)	InsightSvc.exe.config
(1)	Update the connection string to the RCM database.  IcsNotif username should be used.

![image.png](/.attachments/image-a04853fd-e56d-4d74-b869-821afce4a718.png)

(2)	Update the log file path:
 

4.	Copy the updated files to the C:\Program Files (x86)\Insight\BIN\ folder. 
5.	Open up a command prompt as Administrator, and change to the C:\Program Files (x86)\Insight\BIN\ path.
6.	Run the following command:  insightsvc /i 1.  This will install the IcsNotificationService (or whatever is specified in the SERVICES_MSTR table with a ROW_NO of 1.
 
 
7.	Repeat for the remaining ROW_NO’S in the SERVICES_MSTR table (should be 2-4)
8.	Confirm the 4 services installed successfully.
9.	Bring up the Windows Services, and update the ‘Log on As’ value for each of these services to the ‘Service NT Account’. 



Transaction Service
This service is used for electronic eligibility.  If purchased, perform the following to install:
1.	Open up a command prompt ‘as Administrator’
2.	Navigate to the C:\Program Files (x86)\Insight\BIN\ folder
3.	Run GenericService.exe
4.	Install the Transaction Service.  To stay consistent with naming conventions, name the service IcsTransService_xxxx, where xxxx is the service suffix previously used)
5.	Once complete, update the Service properties, and REGEDIT properties, similar to what was done previously for the other services.
