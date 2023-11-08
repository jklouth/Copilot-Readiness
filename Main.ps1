<#
.SYNOPSIS
    Displays a menu of options and runs the corresponding PowerShell script based on the user's selection.

.DESCRIPTION
    This script displays a menu of options to the user and prompts them to select an option. Based on the user's selection, the corresponding PowerShell script is executed. The available options are:
    1. Run the Compliance Analyzer Tool
    2. Export All Sensivity Labels
    3. Export All Data Classifiers
    4. Export All Teams
    5. Export All SharePoint Sites
    6. Export All SharePoint Sites with their owners and members
    7. Export All External Users
    8. Export SharePoint and OneDrive Sharing and Access Control Policies
    9. Export Current Tenant Configuration with Microsoft 365 DSC
    10. Exit

.PARAMETER None

.EXAMPLE
    .\Main.ps1
    Displays the menu of options and runs the corresponding PowerShell script based on the user's selection.

.NOTES
    Author: Jason Louth
    Date:   November, 2023
#>

write-host "Please select an option from the menu below:"
write-host "1. Run the Compliance Analyzer Tool"
write-host "2. Export All Sensivity Labels" 
write-host "3. Export All Data Classifiers" 
write-host "4. Export All Teams" 
write-host "5. Export All SharePoint Sites" 
write-host "6. Export All SharePoint Sites with their owners and members"
write-host "7. Export All External Users"
write-host "8. Export SharePoint and OneDrive Sharing and Access Control Policies" 
write-host "9. Export Current Tenant Configuration with Microsoft 365 DSC"
write-host "10. Exit" 
$option = read-host "Please select an option from the menu above"

# If the user selects option 1, clear the terminal
if ($option -eq 1) { 
    clear-host
    # Run the MCCA.ps1 script
    .\Scripts\MCCA.ps1
}   

# If the user selects option 2, clear the terminal
if ($option -eq 2) { 
    clear-host
    # Run the AllSensitivityLabels.ps1 script
    .\Scripts\AllSensitivityLabels.ps1
}

# If the user selects option 3, clear the terminal
elseif ($option -eq 3) {
    clear-host
    # Run the AllDataClassifiers.ps1 script
    .\Scripts\AllDataClassifiers.ps1
}

# If the user selects option 4, clear the terminal
elseif ($option -eq 4) {
    clear-host
    # Run the AllTeams.ps1 script
    .\Scripts\AllTeams.ps1
}

# If the user selects option 5, clear the terminal
elseif ($option -eq 5) {
    clear-host
    # Run the AllSharePointSites.ps1 script
    .\Scripts\AllSharePointSites.ps1
}

# If the user selects option 6, clear the terminal
elseif ($option -eq 6) {
    clear-host
    # Run the TeamsMembership.ps1 script
    .\Scripts\TeamsMembership.ps1
}

# If the user selects option 7, clear the terminal
elseif ($option -eq 7) {
    clear-host
    # Run the ExternalUsers.ps1 script
    .\Scripts\ExternalUsers .ps1
}

# If the user selects option 8, clear the terminal
elseif ($option -eq 8) {
    clear-host
    # Run the SharePointSharingAndAccessControl.ps1 script
    .\Scripts\SPSharingAndAccessControl.ps1
}

# If the user selects option 9, clear the terminal
elseif ($option -eq 9) {
    clear-host
    # Run the DSC.ps1 script
    .\Scripts\DSC.ps1
}

# If the user selects option 10, exit the script
elseif ($option -eq 9) {
    exit
}






