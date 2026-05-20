# get-failed-logins.ps1
# Purpose: Collect failed Windows login events from the Security log.
# Event ID 4625 = An account failed to log on.

$OutputPath = "..\outputs\failed-logins.csv"

Write-Host "Collecting failed login events from the Windows Security log..."

Get-WinEvent -FilterHashtable @{
    LogName = 'Security'
    Id = 4625
} |
Select-Object TimeCreated, Id, ProviderName, MachineName, Message |
Export-Csv -Path $OutputPath -NoTypeInformation

Write-Host "Failed login events exported to $OutputPath"
