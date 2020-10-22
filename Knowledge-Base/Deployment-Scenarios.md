This page highlights deployment scnenarios evaluated by DevOps Teams targeting the Medsphere Cloud Services Platform (MCSP) and focused on scalablility and automation.

_The following scenarios explore the technical limitations of MSC products/services; legacy best practices and recommendations intentionally ignored._

---

# Install multiple versions of InsightCS on single VM
While it's not recommended to install more than one version of the InsightCS application suite on a single VM, it is technically possible.  The following outlines the steps taken to install InsightCS 2015.1, 2017.4, and 2019.3 on **rcm-spidey.openvista.net**.

## Insight2015.1.msi
> ProductKey: M3B78-37BC2-BF16A-7B9F1
```
PS M:\RCM\2015\2015.1\InsightCS\Setup> dir


    Directory: M:\RCM\2015\2015.1\InsightCS\Setup


Mode                LastWriteTime         Length Name                                                                                                        
----                -------------         ------ ----                                                                                                        
d-----       10/22/2020   7:08 AM                .MSI PRIOR BUILDS                                                                                           
-a----        6/23/2014  11:24 AM      202461696 Insight2015.1.msi                                                                                           
-a----         6/6/2014  10:00 AM            129 ProductKey.txt                                                                                              



PS M:\RCM\2015\2015.1\InsightCS\Setup> .\Insight2015.1.msi

PS M:\RCM\2015\2015.1\InsightCS\Setup>
```
> ![image.png](/.attachments/image-3ff57e6b-5316-43a0-9384-3e38a2818b62.png)

> ![image.png](/.attachments/image-a806b3eb-a9c5-4ae0-a619-a8227bcbb80e.png)



## Insight2017.4.msi

> ProductKey: FE954-96E48-6C5E3-37F25
```
PS M:\RCM\2017\InsightCS\Setup> dir


    Directory: M:\RCM\2017\InsightCS\Setup


Mode                LastWriteTime         Length Name                                                                       
----                -------------         ------ ----                                                                       
-a----        6/27/2018   4:31 PM      211068416 Insight2017.4.msi                                                          
-a----         4/2/2018   9:38 PM             71 ProductKey.txt                                                             



PS M:\RCM\2017\InsightCS\Setup> .\Insight2017.4.msi

PS M:\RCM\2017\InsightCS\Setup>
```
> ![image.png](/.attachments/image-5b913253-d953-4923-9158-63be8222be48.png)

> ![image.png](/.attachments/image-1f97ac2b-b860-43ac-931d-a0f540ffc1c2.png)



## Insight2019.3.msi

> ProductKey: C1D9B-49F98-FE75D-5D216
```
PS M:\RCM\2019\2019.3\Insight\Setup> dir


    Directory: M:\RCM\2019\2019.3\Insight\Setup


Mode                LastWriteTime         Length Name                                                                       
----                -------------         ------ ----                                                                       
-a----        5/20/2020  12:46 PM      190011392 Insight2019.3.msi                                                          
-a----        1/20/2020  11:07 AM             85 ProductKey.txt                                                             



PS M:\RCM\2019\2019.3\Insight\Setup> .\Insight2019.3.msi
```
> ![image.png](/.attachments/image-c044e145-b8a3-4980-a5b5-28cb19bee20a.png)

> ![image.png](/.attachments/image-28c945a2-8859-49c5-9653-4cdab2a293aa.png)



## ODBC Connection

> ![image.png](/.attachments/image-62580455-ccdf-464d-8122-e90840adb91f.png)

---










