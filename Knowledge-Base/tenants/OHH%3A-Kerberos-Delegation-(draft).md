• setspn -L http/sql-p5a openvista\s_sqlserver 
• setspn -L http/sql-p5a.okheart.com openvista\s_sqlserver 
• once those (above are in place) 
• Update Active Directory Object = sql-p5a -> Delegation Tab 
• Add Kerberos Constrained Delegation (3rd option) 
• Click Add -> enter s_sqlserver 
• find http service classes which reference the following 
	1. http/reporting.reports 
	2. http/reporting.okheart.com/reports 
	3. http/sql-p5a/reports 
`http/sqpl-p5a.okheart.com/reports`


#Configure Analysis Services for Kerberos constrained delegation

Adding the following article to be used as a guide for OHH technical staff to configure Kerberos Constrained Delegation on their Active Directory objects.

https://docs.microsoft.com/en-us/analysis-services/instances/configure-analysis-services-for-kerberos-constrained-delegation?view=asallproducts-allversions#bkmk_delegate