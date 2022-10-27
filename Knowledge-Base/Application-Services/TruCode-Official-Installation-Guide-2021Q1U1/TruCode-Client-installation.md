make sure you have the correct serial number, this is the one used for Long Beach CHLB:

![image.png](/.attachments/image-b8e8599e-d0c4-4fc0-9dd9-fc23bc148ff4.png)

Even if it is only a Client installation, as in the scenarios where the TruCode Server was installed at an earlier time, keep the Full Install default option and leave the "Configure SQL Server (Advanced users only)" unchecked, then click Next:

![image.png](/.attachments/image-627333c3-2509-4ebf-a6e1-9697fb062d40.png)

It will search for existing SQL Servers:

![image.png](/.attachments/image-2bf29f65-1465-41e7-a337-cc512251f2af.png)

Since most scenarios would have the TruCode Server installed separately, most often you would select Cancel because the TruCode Server already exists:

![image.png](/.attachments/image-e0d58080-5bde-4541-9bb8-7ecc16f5277e.png)

Enter the SERVER\INSTANCE of the TruCode Server. In the case of Long Beach CHLB it is "rcm-db01w1\TRUCODECHLB" (the screenshot is wrong):

![image.png](/.attachments/image-3eae4442-0f36-492b-beff-ef411fb531ee.png)

It will connect to the specified server, and the rest of the installation should proceed.
