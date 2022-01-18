
```
$domain = (get-addomain).DistinguishedName
$TargetDN = ("CN=Directory Service,CN=Windows NT,CN=Services,CN=Configuration," + $domain)
$ValuedsHeuristics = (Get-ADObject -Identity $TargetDN -Properties dsHeuristics).dsHeuristics
```


to disable SPN uniqueness set the dsHeuristics value to 000000000100000000024

https://support.microsoft.com/en-us/topic/kb5008382-verification-of-uniqueness-for-user-principal-name-service-principal-name-and-the-service-principal-name-alias-cve-2021-42282-4651b175-290c-4e59-8fcb-e4e5cd0cdb29
