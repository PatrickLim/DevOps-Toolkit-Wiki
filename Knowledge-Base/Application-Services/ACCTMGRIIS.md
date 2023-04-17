The code is stored in this Azure git:

https://dev.azure.com/limlab/code/_git/accountmanager

![image.png](/.attachments/image-eeff2562-5840-4f9e-8e88-320d0e37abe4.png)

Deployment steps:

1. Compile the code with Visual Studio.

2. Zip up the entire acctmgriis folder.

3. Copy the zip file onto MG02W1-MSC in the C:\inetpub folder.

4. Extract the contents of the zip file onto C:\inetpub and completely replace the existing acctmgriis folder.

5. Right-click on the new acctmgriis folder and change its Security to let Everyone have full control.

6. Take the contents of the "acctmgriis prodfiles" folder and copy those into acctmgriis. This contains the web.config file and the acctmgr.html file that has the correct references to the MG02W1-MSC urls.
