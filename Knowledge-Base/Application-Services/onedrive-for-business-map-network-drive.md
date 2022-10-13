https://fsu.force.com/s/article/How-do-I-set-up-OneDrive-for-Business-as-a-network-drive
https://www.techrepublic.com/article/how-to-assign-a-drive-letter-to-onedrive-for-business/
https://learn.microsoft.com/en-US/sharepoint/troubleshoot/lists-and-libraries/troubleshoot-mapped-network-drives

https://medsphere-my.sharepoint.com/personal/patrick_lim_medsphere_com/Documents

this option is only available in Internet Explorer 11:

![image.png](/.attachments/image-95ba54af-a347-4196-b899-f11b99b10cd5.png)

===========================

Hi Tina,

Good news, we have a way to map OneDrive onto a network drive. Once you have a mapped drive, then Parallels will automatically detect this drive during your Parallels session.

First of all, I am assuming that you have OneDrive for Business, which is built on top of SharePoint. Is that correct? If so, then we can proceed with these instructions.

For purposes of these instructions, let’s say you are mapping OneDrive to your O: drive. These instructions were derived from these links:

https://www.techrepublic.com/article/how-to-assign-a-drive-letter-to-onedrive-for-business/ 

https://learn.microsoft.com/en-US/sharepoint/troubleshoot/lists-and-libraries/troubleshoot-mapped-network-drives

If you want, we could schedule a Zoom tomorrow to go over these instructions.

1.	You need Internet Explorer 11. Go to the Trusted Sites and add https://*.sharepoint.com/

  ![image.png](/.attachments/image-f772e9cd-c487-4d35-bbbe-4177de0c762b.png)

2.	Open a browser and log in to your online OneDrive. If IE11 complains, you can use another browser such as Chrome to log in to your online OneDrive. All you need is the equivalent of this sharepoint address:

 ![image.png](/.attachments/image-d84b1533-7a6c-4927-8539-f664e2fea80d.png)

3.	Once you have that address open in Internet Explorer 11, look for the option to “View in File Explorer” on the upper-right corner, in the menu dropdown. IMPORTANT: This option to View in File Explorer is only available on IE11!

 ![image.png](/.attachments/image-95ba54af-a347-4196-b899-f11b99b10cd5.png)

4.	The idea is to open this in File Explorer so that you can copy the https address. This address is what you will use to map the O: drive. When File Explorer opens to the OneDrive address, it should look something like this. Click in the empty space of the address bar and copy that address as text, it should look something like “https://medsphere-my.sharepoint.com/personal/whatever_your_path/Documents”.

 ![image.png](/.attachments/image-b59d58c8-a566-4613-979c-d2a2298c504a.png)

5.	Finally, in File Explorer right-click the network folder and map a network drive:

 <IMG  src="https://d1rytvr7gmk1sx.cloudfront.net/wp-content/uploads/2021/02/d-update-assign-drive-letter-onedrive.jpg"/>

6.	Pick drive O: and for Folder enter the address you copied from step 4.

 ![image.png](/.attachments/image-9119768f-5a7c-45dd-89b8-b6e4f0253b36.png)

And that’s it! Your new drive O: will follow you in your Parallels sessions. Let me know if you want to Zoom tomorrow to go over these instructions.

Patrick Lim | Systems Engineer | 310.418.0721
