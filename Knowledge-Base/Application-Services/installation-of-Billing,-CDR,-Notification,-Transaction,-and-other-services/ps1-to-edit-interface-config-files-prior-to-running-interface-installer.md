
```
$acronym = Read-Host "Acronym"
$proddsn = Read-Host "Prod DSN (example abc-rcm)"
$testdsn = Read-Host "Test DSN (example abc-rcm-test)"
$sislnkdsn = Read-Host "Sislnk DSN (example abc-rcm-sislnk)"
$shareloc = Read-Host "IcsInterface share location (example \\ap01w1-abc)"

$suffixprod = '_' + $acronym + 'Prod'
$suffixtest = '_' + $acronym + 'Test'
$newsislnk = ' ' + $sislnkdsn + ' '
$newprod = $proddsn + ' '
$newtest = $testdsn + ' '
$newshareloc = $shareloc + '\IcsInterface\Operations'

Get-ChildItem -Filter *.config |
Foreach-Object {
    $content = Get-Content $_ -Raw
    $content = $content -replace '_Main', $suffixprod
    $content = $content -replace ' Sislnk ', $newsislnk
    $content = $content -replace 'IcsMain ', $newprod
    $content = $content -replace '_Test', $suffixtest
    $content = $content -replace 'IcsTest ', $newtest
    $content = $content -replace [regex]::escape('C:\icsinterface\Operations'), $newshareloc
    $content | Set-Content $_
}

Get-ChildItem -Filter *.cfg |
Foreach-Object {
    $content = Get-Content $_ -Raw
    $content = $content -replace '_Main', $suffixprod
    $content = $content -replace '_Test', $suffixtest
    $content | Set-Content $_
}

Get-ChildItem -Filter *_Main* | Rename-Item -NewName {$_.name -replace '_Main', $suffixprod }
Get-ChildItem -Filter *_Test* | Rename-Item -NewName {$_.name -replace '_Test', $suffixtest }
```
