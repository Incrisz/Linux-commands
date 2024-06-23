import pandas as pd
import requests
from PIL import Image
from io import BytesIO
from openpyxl import Workbook
from openpyxl.drawing.image import Image as XLImage

# Function to download image from URL and return Excel-compatible image data
def url_to_image(url):
    try:
        # Download image from URL
        response = requests.get(url)
        image_data = response.content
        image = Image.open(BytesIO(image_data))
        
        # Resize image if needed
        # image = image.resize((width, height))  # Specify desired dimensions
        
        # Convert PIL image to openpyxl-compatible format
        img_io = BytesIO()
        image.save(img_io, format='PNG')  # Save as PNG for Excel compatibility
        img_io.seek(0)
        
        return img_io
    except Exception as e:
        print(f"Error downloading image from {url}: {e}")
        return None

# Example Excel file processing
excel_file = 'combined.xlsx'
output_file = 'output.xlsx'

# Read Excel file
df = pd.read_excel(excel_file)

# Create a new Excel workbook
wb = Workbook()
ws = wb.active

# Check if 'url' column exists in the DataFrame
if 'url' not in df.columns:
    print("Column 'url' not found in the Excel file.")
else:
    # Iterate through each row in the DataFrame
    for index, row in df.iterrows():
        url = row['url']  # Replace with the correct column name containing URLs
        if pd.notna(url):
            img_data = url_to_image(url)
            if img_data:
                img = XLImage(img_data)
                # Calculate cell coordinates based on row and column indices
                cell = f'A{index+1}'  # Adjust column letter as per your requirement
                ws.add_image(img, cell)

# Check if 'Product Image URL' column exists in the DataFrame
if 'Product Image URL' not in df.columns:
    print("Column 'Product Image URL' not found in the Excel file.")
else:
    # Iterate through each row in the DataFrame
    for index, row in df.iterrows():
        url = row['Product Image URL']  # Replace with the correct column name containing URLs
        if pd.notna(url):
            img_data = url_to_image(url)
            if img_data:
                img = XLImage(img_data)
                # Calculate cell coordinates based on row and column indices
                cell = f'B{index+1}'  # Adjust column letter as per your requirement
                ws.add_image(img, cell)

# Save the output Excel file
wb.save(output_file)
print(f"Images from URLs have been added to '{output_file}'")
