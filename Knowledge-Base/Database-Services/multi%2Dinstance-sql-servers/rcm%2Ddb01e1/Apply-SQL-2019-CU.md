# Applied latest SQL 2019 CU

**Overall summary:**
-   Final result:                  Passed but reboot required, see logs for details
-   Exit code (Decimal):           3010
-   Start time:                    2021-02-19 13:22:24
-   End time:                      2021-02-19 13:39:02
-   Requested action:              Patch

**Instance MSSQLSERVER overall summary:**
-   Final result:                  Passed but reboot required, see logs for details
-   Exit code (Decimal):           3010
-   Start time:                    2021-02-19 13:27:22
-   End time:                      2021-02-19 13:32:00
-   Requested action:              Patch

**Instance AAT overall summary:**
-   Final result:                  Passed but reboot required, see logs for details
-   Exit code (Decimal):           3010
-   Start time:                    2021-02-19 13:32:03
-   End time:                      2021-02-19 13:38:32
-   Requested action:              Patch

**Machine Properties:**
-   Machine name:                  RCM-DB01E1
-   Machine processor count:       8
-   OS version:                    Microsoft Windows Server 2019 Datacenter (10.0.17763)
-   OS service pack:               
-   OS region:                     United States
-   OS language:                   English (United States)
-   OS architecture:               x64
-   Process architecture:          64 Bit
-   OS clustered:                  No

**Product features discovered:**
  
```
Product              Instance             Instance ID                    Feature                                  Language             Edition              Version         Clustered  Configured
  SQL Server 2019      MSSQLSERVER          MSSQL15.MSSQLSERVER            Database Engine Services                 1033                 Enterprise Edition: Core-based Licensing 15.0.4083.2     No         Yes       
  SQL Server 2019      MSSQLSERVER          MSSQL15.MSSQLSERVER            SQL Server Replication                   1033                 Enterprise Edition: Core-based Licensing 15.0.4083.2     No         Yes       
  SQL Server 2019      MSSQLSERVER          MSSQL15.MSSQLSERVER            Full-Text and Semantic Extractions for Search 1033                 Enterprise Edition: Core-based Licensing 15.0.4083.2     No         Yes       
  SQL Server 2019      MSSQLSERVER          MSSQL15.MSSQLSERVER            Data Quality Services                    1033                 Enterprise Edition: Core-based Licensing 15.0.2000.5     No         Yes       
  SQL Server 2019      MSSQLSERVER          MSAS15.MSSQLSERVER             Analysis Services                        1033                 Enterprise Edition: Core-based Licensing 15.0.4083.2     No         Yes       
  SQL Server 2019      AAT                  MSSQL15.AAT                    Database Engine Services                 1033                 Enterprise Edition: Core-based Licensing 15.0.4083.2     No         Yes       
  SQL Server 2019      AAT                  MSSQL15.AAT                    SQL Server Replication                   1033                 Enterprise Edition: Core-based Licensing 15.0.4083.2     No         Yes       
  SQL Server 2019      AAT                  MSSQL15.AAT                    Full-Text and Semantic Extractions for Search 1033                 Enterprise Edition: Core-based Licensing 15.0.4083.2     No         Yes       
  SQL Server 2019      AAT                  MSSQL15.AAT                    Data Quality Services                    1033                 Enterprise Edition: Core-based Licensing 15.0.2000.5     No         Yes       
  SQL Server 2019      AAT                  MSSQL15.AAT                    Machine Learning Services and Language Extensions 1033                 Enterprise Edition: Core-based Licensing 15.0.4083.2     No         Yes       
  SQL Server 2019      AAT                  MSSQL15.AAT                    AdvancedAnalytics\sql_inst_mr            1033                 Enterprise Edition: Core-based Licensing 15.0.4083.2     No         Yes       
  SQL Server 2019      AAT                  MSSQL15.AAT                    AdvancedAnalytics\sql_inst_mpy           1033                 Enterprise Edition: Core-based Licensing 15.0.4083.2     No         Yes       
  SQL Server 2019      AAT                  MSSQL15.AAT                    AdvancedAnalytics\sql_inst_java          1033                 Enterprise Edition: Core-based Licensing 15.0.2000.5     No         Yes       
  SQL Server 2019      AAT                  MSSQL15.AAT                    Azul-Java-Runtime                        1033                 Enterprise Edition: Core-based Licensing 15.0.4083.2     No         Yes       
  SQL Server 2019      AAT                  MSAS15.AAT                     Analysis Services                        1033                 Enterprise Edition: Core-based Licensing 15.0.4083.2     No         Yes
```

**Package properties:**
-   Description:                   Microsoft SQL Server 2019 
-   ProductName:                   SQL Server 2019
-   Type:                          RTM
-   Version:                       15
-   SPLevel:                       0
-   KBArticle:                     KB5000642
-   KBArticleHyperlink:            https://support.microsoft.com/?kbid=5000642
-   PatchType:                     QFE
-   AssociatedHotfixBuild:         0
-   Platform:                      x64
-   PatchLevel:                    15.0.4102.2
-   ProductVersion:                15.0.2000.5
-   GDRReservedRange:              15.0.2005.0:15.0.2010.0
-   Installation location:         L:\950acbe7c0c3c93650c844c3ea29\x64\setup\

**Updated product edition:**
-   Instance             Edition             
-   MSSQLSERVER          Enterprise Edition: Core-based Licensing
-   AAT                  Enterprise Edition: Core-based Licensing

**User Input Settings:**
-   ACTION:                        Patch
-   ALLINSTANCES:                  false
-   CLUSTERPASSIVE:                false
-   CONFIGURATIONFILE:             
-   ENU:                           true
-   HELP:                          false
-   IACCEPTPYTHONLICENSETERMS:     true
-   IACCEPTROPENLICENSETERMS:      true
-   IACCEPTSQLSERVERLICENSETERMS:  true
-   IACKNOWLEDGEENTCALLIMITS:      false
-   INDICATEPROGRESS:              false
-   INSTANCEID:                    <empty>
-   INSTANCENAME:                  <empty>
-   MRCACHEDIRECTORY:              
-   QUIET:                         false
-   QUIETSIMPLE:                   false
-   SUPPRESSPAIDEDITIONNOTICE:     false
-   SUPPRESSPRIVACYSTATEMENTNOTICE: false
-   UIMODE:                        Normal
-   X86:                           false

**Rules with failures or warnings:
Rules report file:**
- C:\Program Files\Microsoft SQL Server\150\Setup Bootstrap\Log\20210219_132223\SystemConfigurationCheck_Report.htm
