#Print to screen "This script is not ready yet, please select the DSC option from the main menu, then select Sharepoint Online and/or OneDrive"
write-host "This script is not ready yet, please select the DSC option from the main menu, then select Sharepoint Online and/or OneDrive"

#Ask use if they would like to exit or return to the main menu
$exit = read-host "Would you like to exit or return to the main menu? (Exit/Menu)"
#If the user selects Exit, exit the script
if ($exit -eq "Exit") {
    exit
}
#If the user selects Menu, clear the terminal and return to the main menu
elseif ($exit -eq "Menu") {
    clear-host
    #Run the Main.ps1 script
    .\Main.ps1
}
