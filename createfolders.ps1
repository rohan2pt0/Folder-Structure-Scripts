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
