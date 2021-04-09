I reviewed what I had done for this last September, and here is a summary:
 
1.	I created an hourly job on the RCM sql server that creates a single text file, legalstatus.txt, and plunks that into a folder in the RCM webserver.
2.	The RCM webserver exposes legalstatus.txt via http.
3.	The CareVue linux box ov01e1-ash has a CRON that grabs legalstatus.txt and plunks that into two folders simultaneously:
a.	/r/ASH/visit
b.	/r/TEST/visit
4.	I believe there is a web server installed on ov01e1-ash that exposes those two folders.
 


to ssh into ov01e1-ash double-hop from admin01e1-msc

cd /r
sudo su openvista
wget -q http://ash-rcm-web:21200/legalstatus.txt -O /r/ASH/visit/legalstatus.txt
wget -q http://ash-rcm-web:21200/legalstatus.txt -O /r/TEST/visit/legalstatus.txt

wget -q http://ash-rcm-web:21200/legalstatus.txt > /r/TEST/visit/legalstatus.txt

![image.png](/.attachments/image-ce694b5f-47b6-4805-b1dd-ce905b8bde75.png)