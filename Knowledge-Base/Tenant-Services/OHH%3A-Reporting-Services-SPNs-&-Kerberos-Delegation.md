# Reporting Services SPNs on Clustered SQL Servers
Service Principle Names (FQDNs, Hostnames, & Aliases) should be registered for the **SQL Server Cluster & Nodes** where SQL Server Reporting Services Instances have been deployed.

## Cluster SPNs

- http/sql-p5a.okheart.com okheart\s_sqlserver
- http/sql-p5a okheart\s_sqlserver

## Cluster Alias SPNs

- http/reporting.okheart.com okheart\s_sqlserver
- http/reporting okheart\s_sqlserver

## Cluster Node SPNs

- http/ohn-sqlprd5.okheart.com okheart\s_sqlserver
- http/ohn-sqlprd5 okheart\s_sqlserver
- http/ohs-sqlprd5.okheart.com okheart\s_sqlserver
- http/ohs-sqlprd5 okheart\s_sqlserver

### [SPNs on Clustered SQL Server with two SQL Instances](https://social.msdn.microsoft.com/Forums/sqlserver/en-US/3089c106-7bb8-404f-916a-ad589baf3f44/spns-on-clustered-server-with-two-sql-instances?forum=sqlsecurity)

- Linked article to be used as guide for OHH technical staff to configure SPNs for the **Reporting Services Instances** deployed within an SQL Server Cluster.

---

# Update Active Directory objects for Kerberos Delegation

- Add Kerberos Constrained Delegation (3rd option) 
- Click Add -> enter **s_sqlserver** 
- Select the **http** service classes that have been registered for the SQL Reporting Services Instances


### [Configure Analysis Services for Kerberos constrained delegation](https://docs.microsoft.com/en-us/analysis-services/instances/configure-analysis-services-for-kerberos-constrained-delegation?view=asallproducts-allversions#bkmk_delegate)

Linked article to be used as a guide for OHH technical staff to configure Kerberos Constrained Delegation on their Active Directory objects.

---


