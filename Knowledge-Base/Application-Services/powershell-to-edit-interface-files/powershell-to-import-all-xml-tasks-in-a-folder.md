
```
$uid = Read-Host "Service Account (include domain e.g. openvista\patrick.lim)"
$pwd = Read-Host "Password"
$taskfolder = Read-Host "Task Folder"

Get-ChildItem -Filter *.xml |
Foreach-Object {
    $filename = $_.BaseName + '.xml'
    $taskname = $taskfolder + '\' + $_.BaseName
    Register-ScheduledTask -Xml (get-content $filename | out-string) -TaskName $taskname -User $uid -Password $pwd –Force
}
```

