<#
.SYNOPSIS
This script connects to SharePoint Online and retrieves a list of all SharePoint sites. It also provides the option to export the list of sites to a CSV file.

.DESCRIPTION
This script checks if the SharePoint PowerShell module is installed and installs it if it is not. It then connects to SharePoint Online with an interactive login and retrieves a list of all SharePoint sites. The user is prompted to export the list of sites to a CSV file and asked for the path to the file. The script also provides the option to quit or return to the main menu.

.PARAMETER None

.EXAMPLE
.\AllSharePointSites.ps1

.NOTES
Author: Jason Louth
Date: November 2023
#>

# Validate SharePoint PowerShell Module is installed
if ($null -eq (Get-PSSnapin -Name Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue))
{
    Add-PSSnapin Microsoft.SharePoint.PowerShell
}
# If not installed - ask user if they would like to install SharePoint PowerShell Module
if ($null -eq (Get-PSSnapin -Name Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue))
{
    $install = Read-Host "The SharePoint PowerShell Module is not installed. Would you like to install it now? (y/n)"
    if ($install -eq "y")
    {
        Write-Host "Installing SharePoint PowerShell Module..."
        Install-Module -Name Microsoft.Online.SharePoint.PowerShell
        Write-Host "SharePoint PowerShell Module installed."
        Import-Module -Name Microsoft.Online.SharePoint.PowerShell
    }
    else
    {
        Write-Host "SharePoint PowerShell Module not installed. Exiting script."
        exit
    }
}
#If no, then exit script
# If yes, then install SharePoint PowerShell Module
# If installed - continue script
# Connect to SharePoint Online with an interactive login
Connect-SPOService

# Get all SharePoint sites
$site = Get-SPOSite -Limit All

#Ask user if they would like to export the list of sites to a CSV file and ask them for the path
$export = Read-Host "Would you like to export the list of sites to a CSV file? (y/n)"
if ($export -eq "y")
{
    $path = Read-Host "Please enter the path to the CSV file"
    $site | Select-Object -Property Title, Owner, URL, SharingCapability, SiteDefinedSharingCapability, DisableSharingForNonOwnerStatus, LastContentModifiedDate, Status, Template, StorageUsed | Export-CSV $path
}
else
{
    Write-Host "Exiting script."
    exit
}
#Ask the user if they would like to quit or exit to the main menu
$quit = Read-Host "Would you like to quit or exit to the main menu? (quit/menu)"
if ($quit -eq "quit")
{
    Write-Host "Exiting script."
    exit
}
else
{
    Write-Host "Returning to main menu."
    .\Main.ps1
}
```