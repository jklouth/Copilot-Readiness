A powershell script aggregator for extracting tenant information related to security and compliance for the purposes of analysis and reporting
This script is in constant development - please send bug reports and/or suggestions to jason.louth@lvs1.com


How to Use the Security, Compliance and Analysis Tool for Microsoft 365
A guide for consultants 
Questions, Comments, Concerns – please contact jason.louth@lvs1.com

Contents
1. Analysis Tool	
  Compliance Analyzer	
  Export All Sensitivity Labels	
  Export All Data Classifiers	
  Export All Teams	
  Export All SharePoint Sites	
  Export All Teams with their owners and members	
  Export All External Users	
  Export SharePoint and OneDrive Sharing and Access Control Policies	
  Export Current Tenant Configuration with Microsoft 365 DSC	


1. Analysis Tool
Description
The Analyzer Tool is a PowerShell tool that aggregates a number of useful powershell scripts and tools to help you quickly assess different areas within a Microsoft 365 tenant to support conversations around increased security and compliance with a lens on Copilot release, but usable across all areas of security and compliance. 
Usage
To run the Compliance Analyzer Tool, follow these steps:
•	Download the tool from GitHub here
•	Open PowerShell as an administrator and navigate to the folder where the script is located.
•	Run the script by typing .\Main.ps1 and press Enter.
Explanation
The Analysis Tool provides an aggregation of tools and scripts to simplify your discovery journey for conversations and assessment work where you’re tasked with finding gaps and suggesting steps for remediation and/or improvement.
Compliance Analyzer
Description
The Analyzer Tool is a PowerShell script that collects information about the Microsoft 365 environment and generates reports with recommendations for improving compliance and security. It also provides a number of other reports to provide talking points on identities and access within SharePoint, OneDrive for Business and Teams to bring visibility around security within these tools. Ultimately, this helps to paint a picture and socialize the importance of monitoring oversharing. 
Usage
To run the Compliance Analyzer Tool, follow these steps:
•	Select Option #1 from the menu.
•	Follow the on-screen prompts to export Security and Compliance reporting with remediation suggestions.
•	Upon completion, return to the scripts menu or exit PowerShell.

Export All Sensitivity Labels
Description
Sensitivity labels are a way to classify and protect documents and emails based on their level of confidentiality and sensitivity. Sensitivity labels can be applied manually by users or automatically by policies. Sensitivity labels can also enforce encryption, access restrictions, watermarks, headers, and footers on the labeled content.
Usage
To export all sensitivity labels from the Microsoft 365 tenant, follow these steps:
•	Select Option #2 from the menu.
•	Follow the on-screen prompts.
•	Upon completion, return to the scripts menu or exit PowerShell.
Explanation
Exporting all sensitivity labels from the Microsoft 365 tenant can help you review and audit the current labels and their settings. You can also use the exported file to import the labels to another tenant or to modify the labels using PowerShell.
Export All Data Classifiers
Description
Data classifiers are a way to identify and categorize sensitive data types, such as credit card numbers, social security numbers, or health records. Data classifiers can be used to apply sensitivity labels, data loss prevention policies, or retention policies to the data that matches the classifiers. Data classifiers can be built-in, custom, or imported from external sources.
Usage
To export all data classifiers from the Microsoft 365 tenant, follow these steps:
•	Select Option #3 from the main menu.
•	Follow the on-screen prompts.
•	Upon completion, return to the scripts menu or exit PowerShell.
Explanation
Exporting all data classifiers from the Microsoft 365 tenant can help you review and audit the current classifiers and their settings. You can also use the exported file to import the classifiers to another tenant or to modify the classifiers using PowerShell.
Export All Teams
Description
Teams are a way to collaborate and communicate with people in your organization or external partners. Teams can have channels, tabs, apps, files, chats, meetings, and calls. Teams can also have settings and policies that control their creation, membership, guest access, and compliance.
Usage
To export all teams from the Microsoft 365 tenant, follow these steps:
•	Select Option #4 from the main menu.
•	Follow the on-screen prompts.
•	Upon completion, return to the scripts menu or exit PowerShell.
Explanation
Exporting all teams from the Microsoft 365 tenant can help you review and audit the current teams and their settings. You can also use the exported file to import the teams to another tenant or to modify the teams using PowerShell.
Export All SharePoint Sites
Description
SharePoint sites are a way to store and share files, lists, pages, and news with people in your organization or external partners. SharePoint sites can have libraries, lists, web parts, apps, workflows, and permissions. SharePoint sites can also have settings and policies that control their creation, access, and compliance.
Usage
To export all SharePoint sites from the Microsoft 365 tenant, follow these steps:
•	Select Option #5 from the main menu.
•	Follow the on-screen prompts.
•	Upon completion, return to the scripts menu or exit PowerShell.
Explanation
Exporting all SharePoint sites from the Microsoft 365 tenant can help you review and audit the current sites and their settings. You can also use the exported file to import the sites to another tenant or to modify the sites using PowerShell.
Export All Teams with their owners and members
Description
Teams with their owners and members are a way to see who has access and control over the sites and their content. Owners can manage the site settings, permissions, and policies. Members can add, edit, and delete the site content. Visitors can view the site content.
Usage
To export all SharePoint sites with their owners and members from the Microsoft 365 tenant, follow these steps:
•	Select Option #6 from the main menu.
•	Follow the on-screen prompts and wait – this is a time consuming action
•	Upon completion, return to the scripts menu or exit PowerShell.
Explanation
Exporting all SharePoint sites with their owners and members from the Microsoft 365 tenant can help you review and audit the access and ownership of the sites and their content. You can also use the exported file to import the sites and their owners and members to another tenant or to modify them using PowerShell.
Export All External Users
Description
External users are people who are not part of your organization but have access to some of your Microsoft 365 resources, such as teams, SharePoint sites, or files. External users can be guests or anonymous. Guests have a sign-in account and are invited by your organization. Anonymous users do not have a sign-in account and access the resources through a link.
Usage
To export all external users from the Microsoft 365 tenant, follow these steps:
•	Select Option #7 from the main menu.
•	Follow the on-screen prompts.
•	Upon completion, return to the scripts menu or exit PowerShell.
Explanation
Exporting all external users from the Microsoft 365 tenant can help you review and audit the external access and activity in your organization. You can also use the exported file to import the external users to another tenant or to modify them using PowerShell.
Export SharePoint and OneDrive Sharing and Access Control Policies
Description
This script has yet to be fully written - SharePoint and OneDrive sharing and access control policies are a way to control how and with whom the files and folders in SharePoint and OneDrive can be shared. Sharing and access control policies can be set at the tenant level, the site level, or the individual level. Sharing and access control policies can also define the types of links, the expiration dates, the permissions, and the external access for the shared files and folders.
Usage
To export SharePoint and OneDrive sharing and access control policies from the Microsoft 365 tenant, follow these steps:
•	Select Option #8 from the main menu.
•	Follow the on-screen prompts.
•	Upon completion, return to the scripts menu or exit PowerShell.
Explanation
Exporting SharePoint and OneDrive sharing and access control policies from the Microsoft 365 tenant can help you review and audit the current policies and their settings. You can also use the exported file to import the policies to another tenant or to modify the policies using PowerShell.
Export Current Tenant Configuration with Microsoft 365 DSC
Description
Microsoft 365 DSC (Desired State Configuration) is a way to automate the configuration and deployment of Microsoft 365 resources, such as teams, SharePoint sites, sensitivity labels, data classifiers, and policies. Microsoft 365 DSC can also export the current configuration of the Microsoft 365 tenant as a PowerShell script that can be used to replicate or restore the configuration in another tenant.
Usage
To export the current tenant configuration with Microsoft 365 DSC, follow these steps:
•	Select Option #9 from the main menu.
•	Follow the on-screen prompts and select which exports you would like to run.
•	Using the Full export will take a lot of time, and is not suggested unless it’s a requirement.
•	Upon completion, return to the scripts menu or exit PowerShell.
Explanation
Exporting the current tenant configuration with Microsoft 365 DSC can help you backup and restore the configuration of the Microsoft 365 tenant. You can also use the exported file to import the configuration to another tenant or to modify the configuration using PowerShell.

