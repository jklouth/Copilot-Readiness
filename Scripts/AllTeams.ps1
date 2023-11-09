<#
.SYNOPSIS
This script gets all Teams and exports the data to a CSV file if the user chooses to do so.

.DESCRIPTION
This script checks if the Teams PowerShell module is installed and prompts the user to install it if it is not. It then connects to Teams PowerShell, gets all Teams, and creates a variable to store them. The user is then prompted to export the data to a CSV file. If the user chooses to do so, they are prompted to enter the path they would like to export the data to. The data is then exported to the specified path. The script then disconnects from Teams and prompts the user to exit or return to the main menu.

.PARAMETER None
This script does not accept any parameters.

.EXAMPLE
.\AllTeams.ps1
Runs the script and gets all Teams.

.NOTES
This script requires the Teams PowerShell module to be installed.
Author: Jason Louth
Date: November 2023
#>

# Check if the Teams PowerShell module is installed
if (Get-Module -ListAvailable -Name MicrosoftTeams) {
    # If the Teams PowerShell module is installed, continue with the script
}
else {
    # If the Teams PowerShell module is not installed, prompt the user to install it
    $install = read-host "Teams PowerShell module is not installed. Would you like to install it? (Y/N)"
    # If the user selects Y, install the Teams PowerShell module
    if ($install -eq "Y") {
        # Install Teams PowerShell module
        Install-Module -Name MicrosoftTeams -Force
    }
    # If the user selects N, exit the script
    elseif ($install -eq "N") {
        exit
    }
}
# If the Teams PowerShell module is installed, continue with the script
# Connect to Teams PowerShell
Connect-MicrosoftTeams

# Get all Teams and create a variable to store them
$Teams = Get-Team -Property -Property DisplayName, Description, Visbility, MailNickName, Classification, Archived
# Ask user if they would like to export the data to a CSV file
$export = read-host "Would you like to export the data to a CSV file? (Y/N)"
# If the user selects Y, export the data to a CSV file to a path of their choice
if ($export -eq "Y") {
    $path = read-host "Please enter the path you would like to export the data to"
}

# Ask the user what they would like to name the file (do not include an extension)
$filename = read-host "What would you like to name the file? (Do not include an extension)"

# Append .csv to the $filename variable and export to the location in $path
$Teams | Select-Object -Property DisplayName, Description, Visbility, MailNickName, Classification, Archived | Export-CSV -Path "$path\$filename.csv"

# Disconnect from Teams
Disconnect-MicrosoftTeams

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