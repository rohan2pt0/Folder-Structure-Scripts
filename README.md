# Folder-Structure-Scripts

Welcome to the **Folder-Structure-Scripts** repository! This project includes scripts for creating a unified folder structure across your devices. These scripts automate the setup of a well-organized folder hierarchy to help streamline your workflow and enhance productivity.

## Table of Contents

- [Overview](#overview)
- [Folder Structure](#folder-structure)
- [Scripts](#scripts)
  - [Python Script](#python-script)
  - [PowerShell Script](#powershell-script)
- [How to Use](#how-to-use)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Overview

With the increasing volume of digital files, maintaining an organized folder structure can significantly improve your efficiency. This repository provides automation scripts for setting up a consistent folder hierarchy on your Windows laptop, making it easier to manage files and keep everything in one place.

## Folder Structure

The scripts will create the following folder hierarchy:

```
Root Folder
├── Personal
│   ├── Finances
│   │   ├── Banking
│   │   ├── Investments
│   │   ├── Taxes
│   │   ├── Insurance
│   │   ├── Budgets (optional)
│   │   └── Bills (optional)
│   ├── Health
│   │   ├── Medical Records
│   │   ├── Fitness
│   │   ├── Nutrition
│   │   └── Health Goals (optional)
│   ├── Goals
│   │   ├── Short-term
│   │   ├── Long-term
│   │   └── Progress Tracking (optional)
│   ├── Personal Projects
│   │   ├── Hobbies
│   │   └── Creative Work
│   │       ├── Drafts
│   │       └── Final Versions
│   ├── Acquaintances
│   │   ├── Contacts
│   │   │   ├── Friends
│   │   │   ├── Family
│   │   │   └── Colleagues
│   │   ├── Social Media (optional)
│   │   └── Correspondence
│   │       ├── Important Emails
│   │       └── Meeting Notes
│   ├── Personal Media
│   │   ├── Documents
│   │   ├── Photos
│   │   └── Videos
│   └── Archive
│       ├── Old Projects
│       └── Past Financial Records
└── Professional
    ├── Documents
    ├── Projects
    │   ├── Project A
    │   └── Project B
    ├── Resumes and Cover Letters
    ├── Certifications and Training
    └── Networking and Contacts
└── Shared
    └── For files shared with others
```

## Scripts

### Python Script

The Python script `create_folders.py` generates the folder structure defined above.

```python
import os

# Define the root directory
root_dir = 'E:\\Root Folder'

# Define the folder structure
folders = {
    'Personal': {
        'Finances': ['Banking', 'Investments', 'Taxes', 'Insurance', 'Budgets', 'Bills'],
        'Health': ['Medical Records', 'Fitness', 'Nutrition', 'Health Goals'],
        'Goals': ['Short-term', 'Long-term', 'Progress Tracking'],
        'Personal Projects': ['Hobbies', 'Creative Work'],
        'Acquaintances': {
            'Contacts': ['Friends', 'Family', 'Colleagues'],
            'Social Media': [],
            'Correspondence': ['Important Emails', 'Meeting Notes']
        },
        'Personal Media': ['Documents', 'Photos', 'Videos'],
        'Archive': ['Old Projects', 'Past Financial Records']
    },
    'Professional': {
        'Documents': [],
        'Projects': ['Project A', 'Project B'],
        'Resumes and Cover Letters': [],
        'Certifications and Training': [],
        'Networking and Contacts': []
    },
    'Shared': []
}

def create_folders(base_path, structure):
    for folder, subfolders in structure.items():
        path = os.path.join(base_path, folder)
        os.makedirs(path, exist_ok=True)
        print(f'Created: {path}')
        if isinstance(subfolders, dict):
            create_folders(path, subfolders)
        else:
            for subfolder in subfolders:
                subfolder_path = os.path.join(path, subfolder)
                os.makedirs(subfolder_path, exist_ok=True)
                print(f'Created: {subfolder_path}')

# Start creating folders
create_folders(root_dir, folders)
```

### PowerShell Script

The PowerShell script `Create-Folders.ps1` achieves the same task with a different approach.

```powershell
# Define the root directory
$rootDir = "E:\Root Folder"

# Define the folder structure
$folders = @{
    "Personal" = @{
        "Finances" = @("Banking", "Investments", "Taxes", "Insurance", "Budgets", "Bills")
        "Health" = @("Medical Records", "Fitness", "Nutrition", "Health Goals")
        "Goals" = @("Short-term", "Long-term", "Progress Tracking")
        "Personal Projects" = @("Hobbies", "Creative Work")
        "Acquaintances" = @{
            "Contacts" = @("Friends", "Family", "Colleagues")
            "Social Media" = @()
            "Correspondence" = @("Important Emails", "Meeting Notes")
        }
        "Personal Media" = @("Documents", "Photos", "Videos")
        "Archive" = @("Old Projects", "Past Financial Records")
    }
    "Professional" = @{
        "Documents" = @()
        "Projects" = @("Project A", "Project B")
        "Resumes and Cover Letters" = @()
        "Certifications and Training" = @()
        "Networking and Contacts" = @()
    }
    "Shared" = @()
}

function Create-Folders {
    param (
        [string]$basePath,
        [hashtable]$structure
    )
    
    foreach ($folder in $structure.Keys) {
        $path = Join-Path -Path $basePath -ChildPath $folder
        New-Item -Path $path -ItemType Directory -Force | Out-Null
        Write-Host "Created: $path"
        
        if ($structure[$folder] -is [hashtable]) {
            Create-Folders -basePath $path -structure $structure[$folder]
        } else {
            foreach ($subfolder in $structure[$folder]) {
                $subfolderPath = Join-Path -Path $path -ChildPath $subfolder
                New-Item -Path $subfolderPath -ItemType Directory -Force | Out-Null
                Write-Host "Created: $subfolderPath"
            }
        }
    }
}

# Start creating folders
Create-Folders -basePath $rootDir -structure $folders
```

## How to Use

1. **Clone the Repository:**
   ```sh
   git clone https://github.com/rohan2pt0/Folder-Structure-Scripts.git
   ```
2. **Run the Python Script:**
   - Ensure you have Python installed.
   - Navigate to the script’s directory and execute:
     ```sh
     python create_folders.py
     ```
3. **Run the PowerShell Script:**
   - Open PowerShell as an Administrator.
   - Navigate to the script’s directory and execute:
     ```powershell
     .\Create-Folders.ps1
     ```

## Contributing

Contributions are welcome! If you have suggestions for improvements or additional features, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

Feel free to reach out to me via GitHub issues or at [rohanc.beit@gmail.com](mailto:rohanc.beit@gmail.com) for any questions or feedback.
