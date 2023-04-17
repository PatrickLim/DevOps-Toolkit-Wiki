The Account Maintenance webapp replaces the original Bulk Importer php tool. It allows the user to pick a Customer and upload a spreadsheet of new accounts that get created under that Customer's OU in the openvista.net Active Directory.

The code is stored in this Azure git:

https://dev.azure.com/limlab/code/_git/accountmanager

![image.png](/.attachments/image-eeff2562-5840-4f9e-8e88-320d0e37abe4.png)

In order to make any code changes, please download the C# code from the above repository and make the necessary changes in Visual Studio.

Deployment steps:

1. Compile the code with Visual Studio.

2. Zip up the entire acctmgriis folder.

![image.png](/.attachments/image-dc4c790a-27ed-473c-a0ed-9b28bd95169a.png)

3. Copy the zip file onto MG02W1-MSC in the C:\inetpub folder.

4. Extract the contents of the zip file onto C:\inetpub and completely replace the existing acctmgriis folder.

![image.png](/.attachments/image-be2c7e5a-58f8-43c8-b155-95d84e45d231.png)

5. Right-click on the new acctmgriis folder and change its Security to let Everyone have full control.

6. Take the contents of the "acctmgriis prodfiles" folder and copy those into acctmgriis. This contains the web.config file and the acctmgr.html file that has the correct references to the MG02W1-MSC urls.

The IIS application pool and website are already set up on MG02W1-MSC. Once the six steps above are performed, the new changes to the code in Step 1 should take effect.
