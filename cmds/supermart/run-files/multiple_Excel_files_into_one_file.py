
# The script combines multiple Excel files located within a specified directory and
#  its subdirectories into a single Excel file, 
#  with each original file being placed on a separate sheet in the combined file.





import pandas as pd
import glob
import os

# Define the base directory containing the subdirectories with Excel files
base_directory_path = '/var/www/html/open/supermart/test'

# Use glob to find all Excel files recursively in the base directory
excel_files = glob.glob(os.path.join(base_directory_path, '**', '*.xlsx'), recursive=True)

# Check if there are any Excel files found
if not excel_files:
    print("No Excel files found in the specified directory.")
else:
    # Create a new Excel writer object
    with pd.ExcelWriter('combined.xlsx', engine='openpyxl') as writer:
        for excel_file in excel_files:
            try:
                # Read each Excel file
                df = pd.read_excel(excel_file)
                # Ensure DataFrame is not empty
                if df.empty:
                    print(f"Warning: {excel_file} is empty and will be skipped.")
                    continue
                
                # Use the file name without the extension as the sheet name
                sheet_name = os.path.splitext(os.path.basename(excel_file))[0]
                # Ensure the sheet name is unique and within Excel's sheet name limit
                if len(sheet_name) > 31:
                    sheet_name = sheet_name[:27] + '...'
                
                # Write the DataFrame to a new sheet in the output file
                df.to_excel(writer, sheet_name=sheet_name, index=False)
            except Exception as e:
                print(f"Error processing file {excel_file}: {e}")
    
    print("All files have been combined into 'combined.xlsx'")

