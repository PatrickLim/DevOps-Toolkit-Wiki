Make sure Analysis Server is set to Multidimensional Mode.

Use this sample xmla file (just remember to rename the extension from .txt to .xmla): [ash-rcm-bi.txt](/.attachments/ash-rcm-bi-25248558-917b-4b9d-a10c-a6f0c8e85552.txt)

Edit the xmla and change the ID and Name fields to something client specific, such as acronym-bi.

![image.png](/.attachments/image-1044061b-2823-45c3-8fca-d77a8fb5d6c6.png)

Load the script in an SSMS Query Window and execute it.

![image.png](/.attachments/image-6f0ee4f2-68d7-440a-a8ba-c65aa8f7f6f0.png)

Double-click on the newly created IcsWarehouse database and edit the Connection String using the ellipses.

![image.png](/.attachments/image-dea2661e-ceb2-4720-87b4-9dc4da1fe8a0.png)

Edit the server field. Choose the main database, because we stopped replicating main into warehouse around 2021.

Edit the membership of the Roles for ICS_Full and ICS_Read as needed:

![image.png](/.attachments/image-b6dea091-4be0-4f41-af2f-d6ac31be81db.png)

Next, we need to make sure the Nightly Warehouse SQL Job is configured correctly, and runs successfully each night.  After running the Warehouse scripts earlier, a nightly warehouse sql job should have been created.  At the time of this writing, the current warehouse job is named:  ‘Nightly Analytics Processing V2017_Q3_V2’
 
![image.png](/.attachments/image-baaaef22-abe6-49a0-8941-e8303048dcd4.png)

The only update to this job to get it to run successfully is to update the final step of the job, which is responsible for building the datacubes.  To update this, double click on the job, and click on the Steps tab at the top left. Scroll down until you get to the final step – ‘Process Data Cubes’.  From there, you should only have to make 2 updates – 1) Update the Server to the Analysis Server Name, and 2) in the Command Box, update the DatabaseID field to the newly created Analytic database. (see below for example)  Once those updates are complete, click Ok, and Ok again to save.  Then run the job and ensure it completes successfully.

![image.png](/.attachments/image-10eb2b90-46f2-4044-8945-b8ab03ea91ca.png)
