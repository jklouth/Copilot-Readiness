<#
.SYNOPSIS
This script retrieves all guest users in Azure AD and counts the number of unique domains and guests per domain.

.DESCRIPTION
This script installs the AzureAD module and connects to Azure AD. It then retrieves all guest users in Azure AD and counts the number of unique domains and guests per domain. The user is prompted to export the data to a CSV file and to exit or return to the main menu.

.PARAMETER None
This script has no parameters.

.EXAMPLE
.\ExternalUsers.ps1
This command runs the script and retrieves all guest users in Azure AD.

.NOTES
This script requires the AzureAD module to be installed. The user must have the appropriate permissions to connect to Azure AD and retrieve guest user information.
Author: Jason Louth
Date: November 2023
#>
# Get the Azure AD module and Connect to Azure AD if you haven't already
Install-Module AzureAD -Repository PSGallery

#Connect to AzureAD
Connect-AzureAD

# Get all guests
$GuestUsers = Get-AzureADUser -Filter "UserType eq 'Guest'" -All $true

# Define a new object to gather output
$GuestUsersAndDomain =  @()


 $GuestUsers | ForEach-Object {
   
                        # Put all details into an object

                        
                        # Work out guest domain
                        $string = $($_.UserPrincipalName)
                        $split1 = $string -split '#EXT#'
                        $split2 = $split1[0] -split '_'                        
                        
                        $output = New-Object -TypeName PSobject 

                        $output | add-member NoteProperty "ObjectId" -value $($_.ObjectId)
                        $output | add-member NoteProperty "DisplayName" -value $($_.DisplayName)
                        $output | add-member NoteProperty "GuestDomain" -value $split2[1].ToLower()
                        $output | add-member NoteProperty "UserPrincipalName" -value $($_.UserPrincipalName)

                        $GuestUsersAndDomain += $output
                        }
    

# Count the instances of a domain

$UniqueDomains = $GuestUsersAndDomain | Select-Object -Property GuestDomain -Unique

# Define a new object to gather output
$UsersbyDomainCount =  @()

ForEach ($domain in $UniqueDomains) {

    # Write-host "Getting number of instances of $($domain.GuestDomain)"

    $MatchingUsers = $GuestUsersAndDomain | Where-Object {$_.GuestDomain -eq $($domain.guestdomain)}
                        
                        # $MatchingUsers
    
                        # Put all details into an object

                        $MatchingUsersCount = $MatchingUsers | Measure-Object | Select-Object Count
                    
                        
                        $output = New-Object -TypeName PSobject 
                        $output | add-member NoteProperty "GuestDomain" -value $($domain.guestdomain)
                        $output | add-member NoteProperty "GuestUserCount" -value $($MatchingUsersCount.Count)


                        $UsersbyDomainCount += $output
     }

         
Write-Host "Number of guest users:                $($GuestUsers.Count)"
Write-Host "Number of unique domains:             $($UniqueDomains.Count)"
Write-Host 
Write-Host "Unique Guests per domain:"
$UsersbyDomainCount | Sort-Object GuestUserCount -Descending | Format-Table -AutoSize

#Ask if user wants to export to CSV
$export = read-host "Would you like to export the data to a CSV file? (Y/N)"
# If the user selects Y, export the data to a CSV file to a path of their choice
if ($export -eq "Y") {
    $path = read-host "Please enter the path you would like to export the data to"
    
}

#Ask the user what they would like to name the file (do not include an extension)
$filename = read-host "What would you like to name the file? (Do not include an extension)"

# Append .csv to the $filename variable and export to the location in $path
$UsersbyDomainCount | Export-Csv -NoTypeInformation -Path "$path\$filename.csv"

#Ask if user would like to exit or return to menu
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
