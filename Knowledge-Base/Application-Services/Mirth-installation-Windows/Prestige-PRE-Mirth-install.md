1. created mirthdb database in db02e1-msc\pre
2. created sql auth login mirthadmin QWEasd123!

![image.png](/.attachments/image-62e9ffa6-ffe3-457c-9977-be395b59b8d2.png)

jdbc:jtds:sqlserver://db02e1-msc;instance=pre;DatabaseName=mirthdb

Copied the mirth installation folder from ap01e1-cow (from Corterra which came from OneCore OCH)

![image.png](/.attachments/image-38e0ae4a-eb33-485c-a67d-f161c2c7a9fe.png)

installed jre-8u311-windows-x64.exe

installed mirthconnect-3.5.1.b194-windows-x64.exe

Start Mirth Connect Server Manager (DIFFERENT from Mirth Connect Administrator!!!)

image.png

right click the tray icon then Show Manager
image.png

image.png

change the Type to sqlserver
image.png

change jdbc:derby:${dir.appdata}/mirthdb;create=true to jdbc:jtds:sqlserver://db02e1-msc;instance=cow;DatabaseName=mirthdb

LAST STEP!

Launch Mirth Connect Administrator from http://localhost:8080/ 

launched webstart.jnlp and installed the application

logged in with default admin admin
