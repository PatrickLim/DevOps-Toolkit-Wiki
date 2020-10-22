This page highlights deployment scnenarios evaluated by DevOps Teams targeting the Medsphere Cloud Services Platform (MCSP) and focused on scalablility and automation.

_The following scenarios explore the technical limitations of MSC products/services; legacy best practices and recommendations are intentionally ignored._

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

> ProductKey: M3B78-37BC2-BF16A-7B9F1
```
PS M:\RCM\2017\2017.1\InsightCS\Setup>
```




3. ODBC Modifications

3. Considerations

4. FAQs

---










