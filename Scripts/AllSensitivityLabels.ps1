<#
.SYNOPSIS
This script checks if the ExchangeOnlineManagement PowerShell module is installed and installs it if it is not. It then connects to Exchange Online, retrieves all sensitivity labels, and exports them to a CSV file if the user chooses to do so. Finally, it disconnects from Exchange Online and prompts the user to either exit the script or return to the main menu.

.DESCRIPTION
This script is designed to retrieve all sensitivity labels in Exchange Online and export them to a CSV file if the user chooses to do so. It first checks if the ExchangeOnlineManagement PowerShell module is installed and installs it if it is not. It then connects to Exchange Online, retrieves all sensitivity labels, and exports them to a CSV file if the user chooses to do so. Finally, it disconnects from Exchange Online and prompts the user to either exit the script or return to the main menu.

.PARAMETER None

.EXAMPLE
.\AllSensitivityLabels.ps1

This example runs the script and retrieves all sensitivity labels in Exchange Online.

.NOTES
This script requires the ExchangeOnlineManagement PowerShell module to be installed. If it is not installed, the script will prompt the user to install it. This script also requires the user to have the necessary permissions to connect to Exchange Online and retrieve sensitivity labels.

.NOTES
    Author: Jason Louth
    Date:   November, 2023
#>

# Check if ExchangeOnlineManagement PowerShell module is installed, only write user-facing text to the terminal if the module is not installed

if (Get-Module -ListAvailable -Name ExchangeOnlineManagement) {
    # If the ExchangeOnlineManagement PowerShell module is installed, continue with the script
}
else {
    # If the ExchangeOnlineManagement PowerShell module is not installed, prompt the user to install it
    $install = read-host "ExchangeOnlineManagement PowerShell module is not installed. Would you like to install it? (Y/N)"
    # If the user selects Y, install the ExchangeOnlineManagement PowerShell module
    if ($install -eq "Y") {
        # Install ExchangeOnlineManagement PowerShell module
        Install-Module -Name ExchangeOnlineManagement -Force
    }
    # If the user selects N, exit the script
    elseif ($install -eq "N") {
        exit
    }
}

# If the ExchangeOnlineManagement PowerShell module is installed, continue with the script
# Ask user for their User Principal Name (UPN) and connect to Exchange Online
Connect-IPPSSession -UserPrincipalName $UserPrincipalName

# Get all sensitivity labels and create a variable to store them
$SensitivityLabels = Get-Label

# Ask user if they would like to export the data to a CSV file
$export = read-host "Would you like to export the data to a CSV file? (Y/N)"
# If the user selects Y, export the data to a CSV file to a path of their choice
if ($export -eq "Y") {
    $path = read-host "Please enter the path you would like to export the data to"
    $SensitivityLabels | Export-Csv -NoTypeInformation -Path $path
}

# Disconnect from Exchange Online
Disconnect-ExchangeOnline

# Ask the user if they would like to exit or return to the main menu
$exit = read-host "Would you like to exit or return to the main menu? (Exit/Menu)"
# If the user selects Exit, exit the script
if ($exit -eq "Exit") {
    exit
}
# If the user selects Menu, clear the terminal and return to the main menu
elseif ($exit -eq "Menu") {
    clear-host
    .\Main.ps1
}