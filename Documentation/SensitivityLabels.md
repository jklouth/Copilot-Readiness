**Documentation for AllSensitivityLabels.ps1 Script**

---

## **Overview**
The `AllSensitivityLabels.ps1` script is designed to connect to Exchange Online and fetch all the sensitivity labels. It first checks if the necessary PowerShell module `ExchangeOnlineManagement` is installed on the machine. If it's not installed, the user is given the option to install it. The user then has the option to export the fetched sensitivity labels to a CSV file. After completing its tasks, the script disconnects from Exchange Online and offers the user the choice to either exit the script or return to the main menu.

## **Requirements**
1. The script requires the `ExchangeOnlineManagement` PowerShell module. If it is not present, the script can install it upon user consent.
2. The user needs to have the necessary permissions to connect to Exchange Online and retrieve sensitivity labels.

## **Usage**

### **Command to Run**
```powershell
.\AllSensitivityLabels.ps1
```
This command will initiate the script and start the process of connecting to Exchange Online and fetching the sensitivity labels.

### **Steps Performed by the Script**
1. **Check for Module**: The script starts by checking if the `ExchangeOnlineManagement` module is installed.
    - If it is not installed, the user will be prompted with the choice to install it. 
        - Selecting 'Y' will install the module.
        - Selecting 'N' will exit the script.

2. **Connection to Exchange Online**: If the necessary module is present, the script will ask for the user's User Principal Name (UPN) to connect to Exchange Online.

3. **Fetching Sensitivity Labels**: The script fetches all sensitivity labels from Exchange Online and stores them in the `$SensitivityLabels` variable.

4. **Export to CSV**: The user is prompted with a choice to export the fetched labels to a CSV file.
    - If the user selects 'Y', they are prompted to provide a path where the CSV file will be saved.
    - If the user selects 'N', the script proceeds to the next step without exporting the labels.

5. **Disconnect**: The script will then disconnect from Exchange Online.

6. **Exit or Return to Main Menu**: Finally, the user is presented with the option to either exit the script or return to the main menu.
    - Selecting 'Exit' will terminate the script.
    - Selecting 'Menu' will redirect the user to the main menu script `Main.ps1`.

## **Notes**
- Always ensure that you have the necessary permissions in Exchange Online before running the script.
- While the script offers to install the necessary module, it's a good practice to keep the PowerShell modules updated for the latest features and security patches.