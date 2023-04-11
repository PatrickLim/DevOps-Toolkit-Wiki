1. created mirthdb database in db02e1-msc\ccc
2. created sql auth login mirthadmin QWEasd123!

![image.png](/.attachments/image-2637a308-816d-4e8d-86b9-b2d7754f7af7.png)

jdbc:jtds:sqlserver://db02e1-msc;instance=ccc;DatabaseName=mirthdb

Copied the mirth installation folder from ap01e1-cow (from Corterra which came from OneCore OCH)

![image.png](/.attachments/image-38e0ae4a-eb33-485c-a67d-f161c2c7a9fe.png)

installed jre-8u311-windows-x64.exe

installed mirthconnect-3.5.1.b194-windows-x64.exe

Start Mirth Connect Server Manager (DIFFERENT from Mirth Connect Administrator!!!)

![image.png](/.attachments/image-7e8b48be-793f-46a0-bc4a-148bab13e6de.png)

right click the tray icon then Show Manager

![image.png](/.attachments/image-3c220408-8691-4d9c-89e1-d14ed8a22639.png)

change the Type to sqlserver

![image.png](/.attachments/image-8090400a-95ff-4002-a087-de62403853d4.png)

change jdbc:derby:${dir.appdata}/mirthdb;create=true to jdbc:jtds:sqlserver://db02e1-msc;instance=ccc;DatabaseName=mirthdb

RESTART the Mirth Connect service

![image.png](/.attachments/image-4f93bd5c-eec0-481a-bfee-e951fcd21009.png)

LAST STEP!

Launch Mirth Connect Administrator from http://localhost:8080/ 

launched webstart.jnlp and installed the application

logged in with default admin admin
