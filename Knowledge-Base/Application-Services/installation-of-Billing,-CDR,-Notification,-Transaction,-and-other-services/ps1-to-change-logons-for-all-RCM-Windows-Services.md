
```
$securePassword = '@EuoE9[11DdB6F$Kgen#'

# Get all services whose name ends with _Q193Prod
$services = Get-WmiObject -Class Win32_Service | Where-Object { $_.Name -like '*_Q193Prod' }

foreach ($service in $services) {
    Write-Output "Updating service: $($service.Name)"

    # Only pass StartName and StartPassword
    $result = $service.Change($null, $null, $null, $null, $null, $null, "openvista\rcmapp", $securePassword)

    if ($result.ReturnValue -eq 0) {
        Write-Output "Successfully updated $($service.Name)"
    } else {
        Write-Warning "Failed to update $($service.Name). Return code: $($result.ReturnValue)"
    }
}
```

