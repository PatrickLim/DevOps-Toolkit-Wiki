
1A. Install wget:

sudo yum install wget

1B. Download the repository RPM to the customer machine:

wget https://rcm-lt01c1.dhsrcm.local:ace445d9eadf3761671a5687@packages.medsphere.com/medsphere-enterprise/yum/centos/6/x86_64/medsphere-enterprise-repo-latest.rpm


2. Install the repository RPM:

yum localinstall medsphere-enterprise-repo-latest.rpm


3. Replace the "USERNAME" and "PASSWORD" values in /etc/yum.repos.d/medsphere-enterprise.repo:

sed s/USERNAME/rcm-lt01c1.dhsrcm.local/g -i /etc/yum.repos.d/medsphere-enterprise.repo  
sed s/PASSWORD/ace445d9eadf3761671a5687/g -i /etc/yum.repos.d/medsphere-enterprise.repo 


4. Install leadtools-service (version 1.1.2)

sudo yum -y install leadtools-service-1.1.2-2.el8


5. Enable service for auto-start upon boot:

sudo systemctl enable leadtools-service


5A. Install all the necessary dependencies:

sudo yum install fontconfig freetype freetype-devel fontconfig-devel libstdc++

6. Start service:

sudo systemctl start leadtools-service


7A. start firewalld

sudo systemctl start firewalld

7. Allow port 19600 and 19599 if necessary on firewall:

sudo firewall-cmd --zone=public --add-port=19600/tcp --permanent
sudo firewall-cmd --zone=public --add-port=19599/tcp --permanent
sudo firewall-cmd --reload


8. Verify the correct version is installed:

curl http://rcm-lt01c1.dhsrcm.local:19600/api/Test/Ping

{"userData":null,"message":"Ready","time":"2021-04-22T17:33:05","isLicenseChecked":true,"isLicenseExpired":false,"kernelType":"RELEASE","isCacheAccessible":true,"ocrEngineStatus":2,"serviceVersion":"1.1.2.5","kernelVersion":"20.0.0.50","multiplatformSupportStatus":"Ready"}

plim@10.88.48.70 QAZwsx12345!

Patrick Lim | Systems Engineer | 310.418.0721

From: Lauren Lamb <lauren.lamb@medsphere.com> 
Sent: Wednesday, July 21, 2021 8:40 AM
To: Patrick Lim <patrick.lim@medsphere.com>; Brian Stockell <brian.stockell@medsphere.com>
Subject: FW: requesting LeadTools install assistance

I wrote up the steps we can use tomorrow with commands.

Thanks,

Lauren Lamb
DevOps Systems Administrator
760.805.0240 | Mobile
877.633.7743 | Support
www.medsphere.com
 

From: Patrick Lim <patrick.lim@medsphere.com> 
Sent: Wednesday, July 21, 2021 9:15 AM
To: Robert Kilian <rkilian@medsphere.com>; Lauren Lamb <lauren.lamb@medsphere.com>
Cc: Brian Stockell <brian.stockell@medsphere.com>; Matt Boswell <matt.boswell@medsphere.com>; Adam Craft <adam.craft@medsphere.com>; Cheryl Brattlie <cheryl.brattlie@medsphere.com>
Subject: RE: requesting LeadTools install assistance

Thank you very much Rob, I shall use these creds to create the medsphere-enterprise.repo on rcm-lt01c1 tomorrow afternoon. Then from there install leadtools with Lauren’s help. We’ll make it work with 19600 first and tackle 19599 later when we figure out Wisconsin’s CA.

Patrick Lim | Systems Engineer | 310.418.0721

From: Robert Kilian <rkilian@medsphere.com> 
Sent: Wednesday, July 21, 2021 8:00 AM
To: Lauren Lamb <lauren.lamb@medsphere.com>; Patrick Lim <patrick.lim@medsphere.com>
Cc: Brian Stockell <brian.stockell@medsphere.com>; Matt Boswell <matt.boswell@medsphere.com>; Adam Craft <adam.craft@medsphere.com>; Cheryl Brattlie <cheryl.brattlie@medsphere.com>
Subject: RE: requesting LeadTools install assistance

Medsphere Enterprise Repo credentials for WI DHS:
U: rcm-lt01c1.dhsrcm.local
P: ace445d9eadf3761671a5687

To create these credentials, for reference (only for systems managed by customers):

SSH into pacakages.medsphere.com & switch to root
Run “/root/generate_medsphere_ent_repo_pw.sh” to generate random password value
Run “htpasswd /etc/httpd/conf/medsphere-enterprise.htpasswd FQDN_of_system” and provide values from previous step

Install/configure the repo using the creds created above per the documentation   here

--

Robert Kilian
Chief Information Officer
760.692.3724 | Office
949.874.2618 | Mobile

From: Lauren Lamb <lauren.lamb@medsphere.com> 
Sent: Wednesday, July 21, 2021 7:40 AM
To: Patrick Lim <patrick.lim@medsphere.com>
Cc: Brian Stockell <brian.stockell@medsphere.com>; Matt Boswell <matt.boswell@medsphere.com>; Adam Craft <adam.craft@medsphere.com>; Cheryl Brattlie <cheryl.brattlie@medsphere.com>; Robert Kilian <rkilian@medsphere.com>
Subject: RE: requesting LeadTools install assistance

Hello,

Adding the crew to the thread for discussion. I asked a couple questions on the team chat and it brought up some other questions.

Thanks,

Lauren Lamb
DevOps Systems Administrator
760.805.0240 | Mobile
877.633.7743 | Support
www.medsphere.com
 

From: Patrick Lim <patrick.lim@medsphere.com> 
Sent: Tuesday, July 20, 2021 5:30 PM
To: Lauren Lamb <lauren.lamb@medsphere.com>
Cc: Brian Stockell <brian.stockell@medsphere.com>
Subject: requesting LeadTools install assistance

Hi Lauren,

We have an RCM-only client, Wisconsin DHS, for which we’ve provisioned Azure vm’s including a CentOS machine called rcm-lt01c1.

Matt Boswell and Adam Craft told us that you could show us how to install LeadTools on a blank Linux box right? Would you be able this Friday to get us started on this?

Please let me know and I’ll send you a Zoom.

Thank you in advance,

Patrick Lim | Systems Engineer | 310.418.0721


