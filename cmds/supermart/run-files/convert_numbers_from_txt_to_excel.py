import pandas as pd

# Function to read phone numbers from a text file and write to an Excel file
def phone_numbers_to_excel(txt_file_path, excel_file_path):
    # Read the phone numbers from the text file
    with open(txt_file_path, 'r') as file:
        phone_numbers = file.read().splitlines()

    # Create a DataFrame from the phone numbers
    df = pd.DataFrame(phone_numbers, columns=['Phone Number'])

    # Write the DataFrame to an Excel file
    df.to_excel(excel_file_path, index=False)

# File paths
txt_file_path = 'phone_numbers.txt'
excel_file_path = 'phone_numbers.xlsx'

# Call the function
phone_numbers_to_excel(txt_file_path, excel_file_path)
