
```
$prod = Read-Host "Prod Folder"
$test = Read-Host "Test Folder"

Get-ChildItem -Filter *.xml |
Foreach-Object {
$content = Get-Content $_ -Raw
$content = $content -replace 'erh-rcm-test', $test
$content = $content -replace 'erh-rcm', $prod
$content | Set-Content $_
}

Get-ChildItem -Filter *.xml | Rename-Item -NewName {$_.name -replace 'erh-rcm-test', $test }
Get-ChildItem -Filter *.xml | Rename-Item -NewName {$_.name -replace 'erh-rcm', $prod }
```
