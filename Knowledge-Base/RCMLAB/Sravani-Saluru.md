From: Sravani Saluru <srsaluru@microsoft.com> 
Sent: Tuesday, July 11, 2023 4:17 AM
To: Brian Stockell <brian.stockell@medsphere.com>
Subject: Sign up for private preview -Enhancement of authentication of AAD users using windows metadata for SQL MI

Hi Brian , 
I am Sravani from Microsoft working as a Program manager for security features for SQL DB , SQL MI, and SQL Server. I am reaching out to you as you are using windows authentication for AAD principal feature for SQL MI . We have a new feature coming up which will be extension / enhancement to windows auth, and it will be in private preview in first week of august. 
With this feature you can unblock below scenarios 
1.	when you are using Azure SQLMI Link, the database is read-only (you cannot create any login in the database).
After you cut over to SQLMI (as master copy), you must create your AAD service principal (email login) using this syntax "CREATE USER [UserName or Group Name] FROM External Provider" in SQLMI so that the logins will be added.  This assumes that you already have AD Connect to synchronize your logins with Azure AD. 
With this private preview feature we will enable customers to reuse their Azure AD principals without have to recreate them . 
This feature allows you to use the logins which are created from windows on SQL Managed Instance. This removed the limitation of SQL MI being read only and not able to recreate logins using external provider.
 
2.	With this feature, you can test any on-premises databases that you want to migrate to Azure SQLMI and still able to use windows authentication.
 You can Sign up for the private preview here https://aka.ms/sqlmi-auth-enhancement
Feel free to reach out to me if you have any questions. 
Regards, 
Sravani Saluru 
Senior Program Manager 
Azure SQL Data 
