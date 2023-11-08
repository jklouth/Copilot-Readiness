<#
.SYNOPSIS
This script allows users to capture current tenant configuration settings via the Microsoft 365 Desired State Configuration Tool.

.DESCRIPTION
This script presents a menu to the user to select which configuration settings they would like to capture. The user can select from the following options: AzureAD, Exchange Online, Intune, Office 365, OneDrive, Planner, Power Platform, Security and Compliance, SharePoint Online, Teams, and All (Not suggested). Depending on the user's selection, the corresponding script will be executed to capture the configuration settings.

.PARAMETER None

.EXAMPLE
.\DSC.ps1

.NOTES
This script requires the Microsoft365DSC module to be installed. If the module is not installed, it will be installed automatically. If the module is already installed, its dependencies will be updated.

Author: Jason Louth
Date: November 2023
#>
# This script will allow users to capture current tenant configuration settings via the Microsoft 365 Desired State Configuration Tool
# Check to see if Microsoft365DSC is installed, and if not, install it
write-host "Checking if Microsoft365DSC is installed..."

if (!(Get-Module -Name Microsoft365DSC -ListAvailable)) {
    Install-Module -Name Microsoft365DSC -Force
}

# If Microsoft365DSC is installed, update its dependencies
if (Get-Module -Name Microsoft365DSC -ListAvailable) {
    Update-M365DSCDependencies
}

#Create a menu for the user to select which configuration settings they would like to capture including the following options: 1. AzureAD, 2. Exchange Online, 3. Intune, 4. Office 365, 5. OneDrive, 6. Planner, 7. Power Platform, 8. Security and Compliance, 9. SharePoint Online, 10. Teams, 11. All (Not suggested)
write-host "Please select which configuration settings you would like to capture:"
write-host "1. AzureAD"
write-host "2. Exchange Online"
write-host "3. Intune"
write-host "4. Office 365"
write-host "5. OneDrive"
write-host "6. Planner"
write-host "7. Power Platform"
write-host "8. Security and Compliance"
write-host "9. SharePoint Online"
write-host "10. Teams"
write-host "11. All (Not suggested)"
write-host "12. Exit"
$option = read-host "Please select an option from the menu above"

# If user selects option 1, clear the terminal
if ($option -eq 1) {
    clear-host
    # Run the AzureAD.ps1 script
    .\Scripts\DSC\AzureAD.ps1
}

# If user selects option 2, clear the terminal
if ($option -eq 2) {
    clear-host
    # Run the ExchangeOnline.ps1 script
    .\Scripts\DSC\ExchangeOnline.ps1
}

# If user selects option 3, clear the terminal
if ($option -eq 3) {
    clear-host
    # Run the Intune.ps1 script
    .\Scripts\DSC\Intune.ps1
}

# If user selects option 4, clear the terminal
if ($option -eq 4) {
    clear-host
    # Run the Office365.ps1 script
    .\Scripts\DSC\Office365.ps1
}

# If user selects option 5, clear the terminal
if ($option -eq 5) {
    clear-host
    # Run the OneDrive.ps1 script
    .\Scripts\DSC\OneDrive.ps1
}

# If user selects option 6, clear the terminal
if ($option -eq 6) {
    clear-host
    # Run the Planner.ps1 script
    .\Scripts\DSC\Planner.ps1
}

# If user selects option 7, clear the terminal
if ($option -eq 7) {
    clear-host
    # Run the PowerPlatform.ps1 script
    .\Scripts\DSC\PowerPlatform.ps1
}

# If user selects option 8, clear the terminal
if ($option -eq 8) {
    clear-host
    # Run the SecurityAndCompliance.ps1 script
    .\Scripts\DSC\SecurityAndCompliance.ps1
}

# If user selects option 9, clear the terminal
if ($option -eq 9) {
    clear-host
    # Run the SharePointOnline.ps1 script
    .\Scripts\DSC\SharePointOnline.ps1
}

# If user selects option 10, clear the terminal
if ($option -eq 10) {
    clear-host
    # Run the Teams.ps1 script
    .\Scripts\DSC\Teams.ps1
}

# If the user selects option 11, clear the terminal
if ($option -eq 11) {
    clear-host
    # Run the AllConfiguration.ps1 script
    .\Scripts\DSC\AllConfiguration.ps1
}

# If the user selects option 12, clear the terminal
if ($option -eq 12) {
    clear-host
    # Run the main.ps1 script
    .\Main.ps1
}

# If the user makes in invalid selection, repeat the menu
else {
    clear-host
    # Create a menu for the user to select which configuration settings they would like to capture including the following options: 1. AzureAD, 2. Exchange Online, 3. Intune, 4. Office 365, 5. OneDrive, 6. Planner, 7. Power Platform, 8. Security and Compliance, 9. SharePoint Online, 10. Teams, 11. All (Not suggested)
    write-host "Please select which configuration settings you would like to capture:"
    write-host "1. AzureAD"
    write-host "2. Exchange Online"
    write-host "3. Intune"
    write-host "4. Office 365"
    write-host "5. OneDrive"
    write-host "6. Planner"
    write-host "7. Power Platform"
    write-host "8. Security and Compliance"
    write-host "9. SharePoint Online"
    write-host "10. Teams"
    write-host "11. All (Not suggested)"
    write-host "12. Exit"
}
