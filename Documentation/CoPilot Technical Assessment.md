# Documentation for Export Data Script

## Overview
The script is designed to provide the user with a series of options to export specific types of data, such as sensitivity labels, data classifiers, Microsoft Teams, and SharePoint sites. The exported data can either be displayed in the terminal or saved to a CSV file based on the user's preference.

## How to Use

### 1. Start the Script
Run the script in PowerShell. The user will be presented with the following menu options:

```
Please select an option from the menu below:
1. Export All Sensivity Labels
2. Export All Data Classifiers
3. Export All Teams
4. Export All Teams with External Sharing & Guests
5. Export All SharePoint Sites
6. Export All SharePoint Sites with External Sharing & Guests
7. Exit


### 2. Choose an Option
Enter the number corresponding to the desired action.

### 3. Follow the Prompts
Once an option is chosen, the script may ask additional questions or provide further instructions. Depending on the choice, you might be prompted to decide if you want to export the data to a CSV file or display it in the terminal.

### 4. Exporting to a CSV File
If you choose to export the data to a CSV:

- You'll be asked, `Would you like to export the data to a CSV file? (Y/N)`
- If you select `Y`, you'll be prompted to provide the path where you'd like to save the CSV file. For example, `C:\exports\data.csv`.

### 5. Displaying Data in the Terminal
If you choose not to export to a CSV:

- You'll be asked, `Would you like to export the data to a CSV file? (Y/N)`
- If you select `N`, the data will be displayed in the terminal.

### 6. Exit or Return to Menu
After each operation, you will be prompted with the question, `Would you like to exit or return to the main menu? (Exit/Menu)`. 

- If you select `Exit`, the script will terminate.
- If you select `Menu`, you will be returned to the main menu to choose another operation or to exit the script.

## Notes
1. This script assumes that various other scripts like `ExportAllSensitivityLabels.ps1`, `ExportAllDataClassifiers.ps1`, etc., are present in the same directory as this script.
2. Error handling and validation are not present in this provided script. It's recommended to add these for a more robust solution.
3. When choosing a path for CSV export, ensure you have the necessary permissions to write to that location.
4. Always ensure you're running the script in a safe and controlled environment, especially when dealing with sensitive data.

## Conclusion
This script provides an interactive way to extract and view/export data. Ensure you have all the prerequisite scripts in place and follow the menu prompts to navigate through the options.
