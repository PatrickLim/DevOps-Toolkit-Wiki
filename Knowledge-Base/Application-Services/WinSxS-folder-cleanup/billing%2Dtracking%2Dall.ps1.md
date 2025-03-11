

```
$resultset = @()
$output = @()

# Sherman AHS
$resultset += [PSCustomObject]@{
	server = "db03e1-msc"
	instance = "ahs"
	db = "ahs-rcm"
}

# Catholic CCC
$resultset += [PSCustomObject]@{
	server = "db02e1-msc"
	instance = "ccc"
	db = "ccc-rcm"
}

# Corterra COW
$resultset += [PSCustomObject]@{
	server = "db02e1-msc"
	instance = "cow"
	db = "cow-rcm"
}

# Samaritan SBC
$resultset += [PSCustomObject]@{
	server = "db01e1-msc"
	instance = "sbc"
	db = "sbc-rcm"
}

# Ashley AAT
$resultset += [PSCustomObject]@{
	server = "db01e1-msc"
	instance = "aat"
	db = "aat-rcm"
}

# Arkansas ASH
$resultset += [PSCustomObject]@{
	server = "db03e1-msc"
	instance = "ash"
	db = "ash-rcm"
}

# Carrollton CRMC
$resultset += [PSCustomObject]@{
	server = "rcm-db02e1"
	instance = "crmc"
	db = "crmc-rcm"
}

# OneCore OCH
$resultset += [PSCustomObject]@{
	server = "db02e1-msc"
	instance = "och"
	db = "och-rcm"
}

# Twin Vistas VSTA
$resultset += [PSCustomObject]@{
	server = "db01e1-msc"
	instance = "vsta"
	db = "vsta-rcm"
}

# Guadalupe GCH
$resultset += [PSCustomObject]@{
	server = "db03w1-msc"
	instance = "gch"
	db = "gch-rcm"
}

foreach ($entry in $resultset) {
	$server = $entry.server
	$instance = $entry.instance
	$db = $entry.db
	$sqlinstance = "$server\$instance"
	$query = "select RUN_DATE=CONVERT(varchar(10), RUN_DATE, 20),STEP_NO,START_TIME,END_TIME,DURATION,USERNAME from [$db]..BILLING_TRACKING where ROW_NO = (select max(row_no) from [$db]..BILLING_TRACKING)"
	$Result = Invoke-Sqlcmd -ServerInstance $sqlinstance -Query $query -ErrorAction Stop -trustservercertificate
	if ($Result -and $Result.STEP_NO -ne $null) {
		$output += [PSCustomObject]@{
			db = $db
			step = $Result.STEP_NO
			user = $Result.USERNAME
			rundate = $Result.RUN_DATE
			starttime = $Result.START_TIME
			endtime = $Result.END_TIME
			duration = $Result.DURATION
		}
	}
}

$output | format-table
```


