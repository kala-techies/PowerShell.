﻿<#
.SYNOPSIS
        Lists the IP addresses
.DESCRIPTION
        This PowerShell script queries all IP address information and prints it.
.EXAMPLE
        PS> ./list-ip-addresses.ps1
	✅ Public IP address 185.72.229.161, 2003:f2:6128:fd01:e543:601:30c2:a028 near Munich, Germany
.LINK
        https://github.com/fleschutz/PowerShell
.NOTES
        Author: Markus Fleschutz | License: CC0
#>

function WriteLocalInterface($interface) {
	$IPv4 = ""
	$IPv6 = ""
	$addresses = Get-NetIPAddress
	foreach ($addr in $addresses) {
		if ($addr.InterfaceAlias -like "$($interface)*") {
			if ($addr.AddressFamily -eq "IPv4") {
				$IPv4 = $addr.IPAddress
			} else {
				$IPv6 = $addr.IPAddress
			}
		}
	}
	if ($IPv4 -ne "" -or $IPv6 -ne "") {
		Write-Host "✅ Local $interface IP address $IPv4, $IPv6"
	}
}		

try {
	if (!$IsLinux) {
		WriteLocalInterface "Ethernet"
		WriteLocalInterface "WLAN"
		WriteLocalInterface "Bluetooth"
 	}
	if ($IsLinux) {
		[string]$publicIPv4 = (curl -4 --silent ifconfig.co)
		[string]$publicIPv6 = (curl -6 --silent ifconfig.co)
		[string]$city = (curl --silent ifconfig.co/city)
		[string]$country = (curl --silent ifconfig.co/country)
	} else {
		[string]$publicIPv4 = (curl.exe -4 --silent ifconfig.co)
		[string]$publicIPv6 = (curl.exe -6 --silent ifconfig.co)
		[string]$city = (curl.exe --silent ifconfig.co/city)
		[string]$country = (curl.exe --silent ifconfig.co/country)
	}
	if ("$publicIPv4" -eq "") { $publicIPv4 = "no IPv4" }
	if ("$publicIPv6" -eq "") { $publicIPv6 = "no IPv6" }
	if ("$city" -eq "")       { $city = "unknown city" }
	if ("$country" -eq "")    { $country = "unknown country" }
	Write-Host "✅ Public IP address $publicIPv4, $publicIPv6 near $city, $country"                                                 ; if ($country -eq "Russia") { Write-Host -foregroundColor red "DON'T TRUST PUTIN !!! FLEE NOW OR DIE AS SOLDIER IN UKRAINE !!!" }
	exit 0 # success
} catch {
        "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
        exit 1
}
