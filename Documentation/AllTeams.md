**Documentation for TeamsDataRetrieval.ps1 Script**

---

## **Overview**
The `TeamsDataRetrieval.ps1` script is built to connect to Microsoft Teams via PowerShell, fetch details about all the Teams present, and then optionally export this data to a CSV file. Prior to performing these actions, the script verifies the installation of the necessary `MicrosoftTeams` PowerShell module and provides the user an option to install it if it's missing. After all operations, the user has a choice to exit the script or return to the main menu.

## **Requirements**
1. The script needs the `MicrosoftTeams` PowerShell module. If not available, the script can install it, provided the user grants permission.
2. Necessary permissions in Microsoft Teams to fetch details about the Teams.

## **Usage**

### **Command to Run**
```powershell
.\TeamsDataRetrieval.ps1
```
By executing the above command, the script is initiated, which will then carry out its operations based on user choices.

### **Steps Performed by the Script**
1. **Module Verification**: At the onset, the script checks if the `MicrosoftTeams` module is installed.
    - If the module is missing, the user is prompted:
        - Select 'Y' to initiate the module's installation.
        - Select 'N' to terminate the script without installation.

2. **Connecting to Microsoft Teams**: On verifying the presence of the necessary module, the script establishes a connection to Microsoft Teams using the `Connect-MicrosoftTeams` cmdlet.

3. **Fetching Teams' Details**: It then retrieves details of all Teams, specifically the Display Name, Description, Visibility, Mail Nickname, Classification, and Archived status, storing this data in the `$Teams` variable.

4. **Data Export Option**: The user is inquired if they wish to export the fetched Teams' details to a CSV file.
    - On choosing 'Y', they are prompted to specify a path where the CSV file should be saved. The script then exports the data to this location.
    - Opting for 'N' moves the script to its next operation without exporting.

5. **Disconnecting from Microsoft Teams**: Post data retrieval (and optional export), the script disconnects from Microsoft Teams using the `Disconnect-MicrosoftTeams` cmdlet.

6. **Exit or Return**: Lastly, the user is asked if they wish to exit the script or navigate back to the main menu.
    - 'Exit' ends the script.
    - 'Menu' clears the terminal and redirects the user to the main menu script, `Main.ps1`.

## **Notes**
- It's essential to ensure that you possess the required permissions in Microsoft Teams to retrieve Team details before running the script.
- Regularly updating PowerShell modules is a recommended practice to avail the latest features and security updates.