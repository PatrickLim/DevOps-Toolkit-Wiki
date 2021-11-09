$svcacct = Read-Host "Service Account"

Add-WindowsFeature RSAT-AD-PowerShell

$runner = get-aduser -identity $svcacct 

$x = $runner.sid.value

Get-ChildItem -Filter *.xml |
Foreach-Object {
    $content = Get-Content $_ -Raw
    $content = $content -replace 'S-1-5-21-1261747247-2964624308-3797183450-27380', $x
    $content | Set-Content $_
}
