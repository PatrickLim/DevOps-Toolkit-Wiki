created mirthdb database in rcm-db02e1\och

created sql auth login mirthadmin QWEasd123!

updated jre from Java 8 update 111 to 311 and uninstalled previous version

![image.png](/.attachments/image-d8781182-c4bb-47a3-bb2a-a9ffcc6d7ea5.png)

Launch Mirth Connect Administrator from http://localhost:8080/

launched webstart.jnlp and installed the application

logged in with default admin admin

Start Mirth Connect Server Manager (DIFFERENT from Mirth Connect Administrator!!!)

![image.png](/.attachments/image-2f652e1c-d59b-4ec9-a4bb-3e878cb4e3ba.png)

right click the tray icon then Show Manager

![image.png](/.attachments/image-4c6310e5-aaea-4d15-9b0d-c0da63eb66fa.png)

![image.png](/.attachments/image-7e143b1f-2e93-4473-9305-e6c14e5613e8.png)

change jdbc:derby:${dir.appdata}/mirthdb;create=true

change the Type to sqlserver

![image.png](/.attachments/image-1c697ab4-a3c0-491e-ba6e-badeec9f2155.png)

to jdbc:jtds:sqlserver://rcm-db02e1;instance=och;DatabaseName=mirthdb