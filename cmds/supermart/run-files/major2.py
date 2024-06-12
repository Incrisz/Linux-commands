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
















import os
import subprocess
import sys

# List of script files
script_files = [
    'alcohol.py',
    '/var/www/html/open/supermart/baby-kids.py',
    '/var/www/html/open/supermart/cleaning.py',
    '/var/www/html/open/supermart/drinks.py',
    '/var/www/html/open/supermart/electronics.py',
    '/var/www/html/open/supermart/food-cupboard.py',
    '/var/www/html/open/supermart/fresh-food.py',
    '/var/www/html/open/supermart/frozen.py',
    '/var/www/html/open/supermart/health-wellness.py',
    '/var/www/html/open/supermart/household.py',
    '/var/www/html/open/supermart/kitchen-dining.py',
    '/var/www/html/open/supermart/mile-12-market.py',
    '/var/www/html/open/supermart/naija-food.py',
    '/var/www/html/open/supermart/office-supplies.py',
    '/var/www/html/open/supermart/oil.py',
    '/var/www/html/open/supermart/snacks.py',
    '/var/www/html/open/supermart/toiletries.py'
]

# Parent directory name
parent_directory = 'easelow'
os.makedirs(parent_directory, exist_ok=True)

# Function to create a folder for each script and run the script inside it
def run_script_in_folder(script_file, parent_dir):
    folder_name = os.path.join(parent_dir, os.path.splitext(script_file)[0])
    try:
        if os.path.exists(folder_name):
            print(f"Folder '{folder_name}' already exists. Skipping.")
            return
        os.makedirs(folder_name, exist_ok=True)  # Create folder if it doesn't exist
        subprocess.run(['cp', script_file, folder_name])  # Copy the script file into the folder
        os.chdir(folder_name)  # Change directory to the folder
        result = subprocess.run([sys.executable, script_file], capture_output=True, text=True)  # Run the script
        print(f"Output of {script_file}:\n{result.stdout}")
        if result.stderr:
            print(f"Error in {script_file}:\n{result.stderr}")
    except Exception as e:
        print(f"An error occurred while processing '{script_file}': {e}")
    finally:
        os.chdir('..')  # Change back to the original directory

# Run each script file
for script_file in script_files:
    if os.path.isfile(script_file):
        run_script_in_folder(script_file, parent_directory)
    else:
        print(f"Script file '{script_file}' not found.")

print("All scripts executed.")
