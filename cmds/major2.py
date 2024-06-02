import os
import subprocess
import sys  # Import sys module

# List of script files
script_files = [
    'alcohol.py',
    'baby-kids.py',
    'cleaning.py',
    'drinks.py',
    'electronics.py',
    'frozen.py',
    'health-wellness.py',
    'household.py',
    'kitchen-dining.py',
    'office-supplies.py',
    'oil.py',
    'snacks.py',
    'toiletries.py',
    'mile-12-market.py',
    'fresh-food.py',
    'naija-food.py',
    'toiletries.py'
]

# Function to create folder for each script and run the script inside it
def run_script_in_folder(script_file):
    folder_name = os.path.splitext(script_file)[0]
    if os.path.exists(folder_name):
        print(f"Folder '{folder_name}' already exists. Skipping.")
        return
    os.makedirs(folder_name, exist_ok=True)  # Create folder if it doesn't exist
    subprocess.run(['cp', script_file, folder_name])  # Copy the script file into the folder
    os.chdir(folder_name)  # Change directory to the folder
    subprocess.run([sys.executable, script_file])  # Run the script
    os.chdir('..')  # Change back to the original directory

# Run each script file
for script_file in script_files:
    if os.path.isfile(script_file):
        run_script_in_folder(script_file)
    else:
        print(f"Script file '{script_file}' not found.")

print("All scripts executed successfully.")
