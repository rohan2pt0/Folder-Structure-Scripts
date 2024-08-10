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
        # Create the folder
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
