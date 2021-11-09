
```
$prod = Read-Host "Prod Folder"
$test = Read-Host "Test Folder"

Get-ChildItem -Filter *.xml |
Foreach-Object {
$content = Get-Content $_ -Raw
$content = $content -replace 'testXYZ', $test
$content = $content -replace 'prodABC', $prod
$content | Set-Content $_
}

Get-ChildItem -Filter *.xml | Rename-Item -NewName {$_.name -replace 'testXYZ', $test }
Get-ChildItem -Filter *.xml | Rename-Item -NewName {$_.name -replace 'prodABC', $prod }
```
