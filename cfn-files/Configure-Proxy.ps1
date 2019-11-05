# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0
# Updated: Josh Hawkins (@BinaryFaultline)

# References:

[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [String]$ProxyIP
)

# Setting the proxy server
$ProxyHost = "http://" + $ProxyIP + ":3128"
Write-Host "Setting the proxy server to $ProxyHost"


Set-ItemProperty -Force -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "ProxyEnable" -Value 1 -Type dword
Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "ProxyEnable"

Set-ItemProperty -Force -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "AutoDetect" -Value 0 -Type dword
Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "AutoDetect"

Set-ItemProperty -Force -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "ProxyServer" -Value $ProxyHost
Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "ProxyServer"

Set-ItemProperty -Force -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "ProxySettingsPerUser" -Value 0 -Type dword
Get-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "ProxySettingsPerUser"