<#
.SYNOPSIS
This script checks if the ExchangeOnlineManagement PowerShell module is installed, connects to Exchange Online, gets all Data Classifiers, and exports the data to a CSV file if the user chooses to. 

.DESCRIPTION
This script checks if the ExchangeOnlineManagement PowerShell module is installed. If it is not installed, the user is prompted to install it. The script then connects to Exchange Online and gets all Data Classifiers. The user is prompted to export the data to a CSV file. If the user chooses to export the data, they are prompted to enter the path to export the data to. The script then exports the data to the specified path. Finally, the script disconnects from Exchange Online and prompts the user to either exit or return to the main menu.

.PARAMETER UserPrincipalName
The User Principal Name (UPN) of the user to connect to Exchange Online with.

.EXAMPLE
.\AllDataClassifiers.ps1 -UserPrincipalName user@contoso.com
This example runs the AllDataClassifiers.ps1 script and connects to Exchange Online with the user principal name user@contoso.com.

.NOTES
This script requires the ExchangeOnlineManagement PowerShell module to be installed. If the module is not installed, the user will be prompted to install it.

    Author: Jason Louth
    Date:   November, 2023
#>


# Check if the ExchangeOnlineManagement PowerShell module is installed
if (Get-Module -ListAvailable -Name ExchangeOnlineManagement) {
    # If the ExchangeOnlineManagement PowerShell module is installed, continue with the script
}
else {
    # If the ExchangeOnlineManagement PowerShell module is not installed, prompt the user to install it
    $install = read-host "Exchange Online Management PowerShell module is not installed. Would you like to install it? (Y/N)"
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
# Get all Data Classifiers and create a variable to store them
$DataClassifiers = Get-DlpSensitiveInformationType
# Ask user if they would like to export the data to a CSV file
$export = read-host "Would you like to export the data to a CSV file? (Y/N)"
# If the user selects Y, export the data to a CSV file to a path of their choice
if ($export -eq "Y") {
    $path = read-host "Please enter the path you would like to export the data to"
    $DataClassifiers | Export-Csv -NoTypeInformation -Path $path
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
    # Run the Main.ps1 script
    .\Main.ps1
}
