
import os
import pandas as pd
import re

# Function to preprocess the strings
def preprocess_string(s):
    if isinstance(s, str):
        # Remove all non-alphanumeric characters, underscores, and convert to lowercase
        return re.sub(r'\W+|_', '', s).lower()
    return ''

# Path to the uploads.csv file
uploads_file_path = 'uploads.csv'

# Read the uploads.csv file
uploads_df = pd.read_csv(uploads_file_path)

# Preprocess the 'file_original_name' column in uploads_df
uploads_df['processed_name'] = uploads_df['file_original_name'].apply(preprocess_string)

# Ensure processed_name is unique in uploads_df
uploads_df.drop_duplicates(subset=['processed_name'], inplace=True)

# Add URL prefix to file_name column
uploads_df['url'] = 'https://easelowmarket.com/public/' + uploads_df['file_name']

# Directory containing the subdirectories with Excel files
root_directory = '/var/www/html/open/supermart/test'

# Loop through each subdirectory and Excel file
for subdir, _, files in os.walk(root_directory):
    for file in files:
        if file.endswith('.xlsx') or file.endswith('.xls'):
            file_path = os.path.join(subdir, file)
            print(f'Processing file: {file_path}')  # Debug: Print the file being processed
            # Read the Excel file
            excel_df = pd.read_excel(file_path)
            
            # Ensure the necessary columns exist
            if 'Product Name' in excel_df.columns:
                # Preprocess the 'Product Name' column in the excel_df
                excel_df['processed_product_name'] = excel_df['Product Name'].apply(preprocess_string)
                
                # Compare the processed columns
                matches = excel_df['processed_product_name'].isin(uploads_df['processed_name'])
                
                # If there are matches, create the 'url' column and populate it
                if matches.any():
                    # Create the 'url' column if it does not exist
                    if 'url' not in excel_df.columns:
                        excel_df['url'] = None
                    
                    # Map the processed product names to the 'url' column in uploads_df
                    mapping = uploads_df.set_index('processed_name')['url']
                    excel_df.loc[matches, 'url'] = excel_df.loc[matches, 'processed_product_name'].map(mapping)
                    
                    # Drop the temporary 'processed_product_name' column
                    excel_df.drop(columns=['processed_product_name'], inplace=True)
                    
                    # Save the modified Excel file
                    excel_df.to_excel(file_path, index=False)
                    print(f'Updated file: {file_path}')

# Clean up the uploads_df DataFrame by dropping the temporary columns
uploads_df.drop(columns=['processed_name', 'url'], inplace=True)













# Certainly! Here's a clear documentation of the script's purpose, functionality, and how it operates:

# ---

# **Script Documentation: Automated Excel File Processing**

# **Overview:**

# This script automates the process of comparing and updating Excel files located within specified subdirectories against a central CSV file (`uploads.csv`). The goal is to populate a `url` column in the Excel files based on matches found between their `Product Name` column and entries in `uploads.csv`.

# **Functionality:**

# 1. **Preprocessing:**
#    - **String Preprocessing:** 
#      - A helper function `preprocess_string(s)` is defined to standardize and clean strings by removing non-alphanumeric characters and converting them to lowercase. This ensures consistency in comparison.

# 2. **Data Loading:**
#    - The script first loads `uploads.csv` which contains columns `file_original_name` and `file_name`. It preprocesses `file_original_name` to create a `processed_name` column and ensures uniqueness.

# 3. **URL Generation:**
#    - A new `url` column is added to `uploads_df` by concatenating `https://easelowmarket.com/public/` with the `file_name` values. This creates a complete URL for each entry in `uploads.csv`.

# 4. **File Processing:**
#    - The script navigates through a specified root directory (`/var/www/html/open/supermart/test`), recursively searching for Excel files (`*.xlsx` and `*.xls`) in subdirectories.

# 5. **Excel File Handling:**
#    - For each Excel file found, it reads the file into a DataFrame (`excel_df`).
#    - It preprocesses the `Product Name` column to create `processed_product_name`.

# 6. **Matching and Updating:**
#    - The script compares `processed_product_name` from each Excel file against `processed_name` in `uploads_df`.
#    - If matches are found, it populates the `url` column in the Excel file by mapping `processed_product_name` to the corresponding `url` in `uploads_df`.

# 7. **Output:**
#    - After updating the `url` column in the Excel file, the script saves the modified DataFrame back to the original Excel file.

# 8. **Cleanup:**
#    - Temporary columns (`processed_name` and `url`) in `uploads_df` are dropped once all Excel files are processed.

# **Usage:**

# - Ensure Python environment with required dependencies (`pandas`, `os`, `re`) is set up.
# - Adjust `uploads_file_path`, `root_directory`, and file extensions (`*.xlsx`, `*.xls`) according to your directory structure and file naming conventions.
# - Run the script (`python opay.py`) in the appropriate environment to execute the automated processing of Excel files.

# **Notes:**

# - The script assumes `uploads.csv` has columns `file_original_name` and `file_name`.
# - It expects Excel files to have a `Product Name` column for comparison.
# - Ensure appropriate permissions and backups are in place when modifying Excel files.

# **Conclusion:**

# This script efficiently automates the task of updating Excel files based on matching criteria with a central CSV dataset. It streamlines the process of managing product information across multiple files, ensuring consistency and accuracy in URL data integration.

# ---

# This documentation provides a comprehensive overview of the script's purpose, functionality, usage instructions, and considerations, making it easier for users to understand and utilize the script effectively in their environment.