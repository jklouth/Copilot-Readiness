<#
.SYNOPSIS
This script generates compliance reports for Microsoft 365 Compliance Center.

.DESCRIPTION
This script generates compliance reports for Microsoft 365 Compliance Center. It prompts the user to select the locations and compliance reports they would like to include in their analysis. The script then concatenates the Get-MCCAReport cmdlet with the user's selected locations and compliance reports to generate the desired reports.

.PARAMETER FilePath
The file path for this script is /c:/Users/JasonKLouth/OneDrive - Long View Systems Corporation/Documents/GitHub/Tech-Elixir-PSScripts/Scripts/MCCA.ps1

.EXAMPLE
.\MCCA.ps1
Runs the script and prompts the user to select the locations and compliance reports they would like to include in their analysis.

.NOTES
This script requires the MCCAPreview and ExchangeOnlineManagement modules to be installed. If they are not installed, the script will attempt to install them.
Author: Jason Louth
Date: November 2023
#>
Remove-Module MCCAPreview -ErrorAction SilentlyContinue
Remove-Module ExchangeOnlineManagement -ErrorAction SilentlyContinue
Unblock-File ".\*"
Unblock-File ".\Checks\*"
Unblock-File ".\Outputs\*"
Unblock-File ".\Remediation\*"
Unblock-File ".\Utilities\*"

#Check to see if the MCCAPreview module is installed, if not, install it
if (!(Get-Module -Name MCCAPreview -ListAvailable)) {
    Install-Module -Name MCCAPreview -Force
}

#If the MCCAPreview module is installed, import it
if (Get-Module -Name MCCAPreview -ListAvailable) {
    Import-Module -Name MCCAPreview -Force
}

#Get-MCCAReport -Geo @("nam") -Solution @("num")

#Get-MCCAReport -ExchangeEnvironmentName O365USGovGCCHigh

# Ask the user which locations they would like to include in their compliance analysis, separating each location with a comma. 
    write-host "Please select the locations you would like to include in your compliance analysis, separating each location with a comma. The following locations are available:"
    write-host "1. Asia-Pacific"
    write-host "2. Australia"
    write-host "3. Canada"
    write-host "4. Europe (excl. France) / Middle East / Africa"
    write-host "5. France"
    write-host "6. India"
    write-host "7. Japan"
    write-host "8. Korea"
    write-host "9. North America (excl. Canada)"
    write-host "10. South America"
    write-host "11. South Africa"
    write-host "12. Switzerland"
    write-host "13. United Arab Emirates"
    write-host "14. United Kingdom"
    
# Store the user's input into a variable $location and make sure the variable includes only an array of numbers 1-14, separated by commas
    $location = read-host "Please select the locations you would like to include in your compliance analysis, separating each location with a comma."
    $location = $location -split ',' | % { [int]$_ } | ? { $_ -ge 1 -and $_ -le 14 }

# Ask the user which compliance reports they would like to include in their compliance analysis, separating each with a comma. Store the user's input into a variable $reports
    write-host "Please select the compliance reports you would like to include in your compliance analysis, separating each with a comma. The following reports are available:"
    write-host "1. Data Loss Prevention"
    write-host "2. Information Protection"
    write-host "3. Information Governance"
    write-host "4. Records Management"
    write-host "5. Communication Compliance"
    write-host "6. Insider Risk Management"
    write-host "7. Audit"
    write-host "8. eDiscovery"

 # Store the user's input into a variable $Reports and make sure the variable includes only an array of numbers 1-8, separated by commas
    $reports = read-host "Please select the compliance reports you would like to include in your compliance analysis, separating each with a comma."
    $reports = $reports -split ',' | % { [int]$_ } | ? { $_ -ge 1 -and $_ -le 8 }  

# Concatenate the Get-MCCAReport -Solution @($report) -Geo @($Location)
Get-MCCAReport -Solution @($Reports) -Geo @($location)

# Ask the user if they would like to exit or return to the main menu
$Exit = Read-Host -Prompt 'Would you like to exit or return to the main menu? (Exit/Menu)'
# If the user selects Exit, exit the script
if ($Exit -eq 'Exit') {
    exit
}
# If the user selects Menu, return to the main menu
elseif ($Exit -eq 'Menu') {
    clear-host
    .\Main.ps1
}
