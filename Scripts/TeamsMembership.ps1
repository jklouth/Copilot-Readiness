
<#
.SYNOPSIS
This script retrieves the membership information for all Microsoft Teams in the organization and exports it to a CSV file.

.DESCRIPTION
This script uses the MicrosoftTeams PowerShell module to connect to Microsoft Teams and retrieve the membership information for all Teams in the organization. The script then prompts the user to enter a path and file name to save the membership information to a CSV file. Finally, the script prompts the user to either exit the script or return to the main menu.

.PARAMETER None
This script does not accept any parameters.

.EXAMPLE
.\TeamsMembership.ps1
Runs the script and retrieves the membership information for all Teams in the organization.

.INPUTS
This script does not accept any input.

.OUTPUTS
This script outputs a CSV file containing the membership information for all Teams in the organization.

.NOTES
Author: Jason Louth
Date:   November 7, 2023
#>
Install-Module -Name MicrosoftTeams -Force
 
Connect-MicrosoftTeams -AccountId <UPN>
 
$AllTeams = (Get-Team).GroupID
$TeamList = @()
 
Foreach ($Team in $AllTeams)
{       
        $TeamGUID = $Team.ToString()
        $TeamName = (Get-Team | ?{$_.GroupID -eq $Team}).DisplayName
        $TeamOwner = (Get-TeamUser -GroupId $Team | ?{$_.Role -eq 'Owner'}).Name
        $TeamMember = (Get-TeamUser -GroupId $Team | ?{$_.Role -eq 'Member'}).Name
 
        $TeamList = $TeamList + [PSCustomObject]@{TeamName = $TeamName; TeamObjectID = $TeamGUID; TeamOwners = $TeamOwner -join ', '; TeamMembers = $TeamMember -join ', '}
}
#Ask the user for the path to save the CSV file to
$Path = Read-Host -Prompt 'Please enter the path to save the CSV file to'
#Ask the user for the name of the CSV file
$FileName = Read-Host -Prompt 'Please enter the name of the CSV file'
#Export the data to a CSV file
$TeamList | export-csv $Path\$FileName.csv -NoTypeInformation
#Ask the user if they would like to exit or return to the main menu
$Exit = Read-Host -Prompt 'Would you like to exit or return to the main menu? (Exit/Menu)'
#If the user selects Exit, exit the script
if ($Exit -eq 'Exit') {
    exit
}
#If the user selects Menu, return to the main menu
elseif ($Exit -eq 'Menu') {
    clear-host
    .\Main.ps1
}
#If the user enters an invalid option, display an error message and return to the main menu
else {
    write-host "Invalid option. Please try again."
    clear-host
    .\Main.ps1
}