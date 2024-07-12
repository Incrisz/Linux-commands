# sudo apt update
# sudo apt install python3-venv
# python3 -m venv myenv
# source myenv/bin/activate
# pip install autoscraper pandas openpyxl
# pip install Pillow
# pip install autoscraper
# pip install selenium
# pip install pandas openpyxl
# pip install pytesseract Pillow
# sudo apt-get install tesseract-ocr



# extract numbers from images to text
import pytesseract
from PIL import Image
import re
import os

def extract_phone_numbers_from_images(directory_path):
    phone_numbers = []

    # Define a regular expression pattern for phone numbers
    phone_number_pattern = r'\+?\d[\d\s-]{7,}\d'

    # Loop through all files in the directory
    for filename in os.listdir(directory_path):
        if filename.lower().endswith(('.png', '.jpg', '.jpeg', '.tiff', '.bmp', '.gif')):
            # Load the image using PIL
            image_path = os.path.join(directory_path, filename)
            image = Image.open(image_path)

            # Perform OCR on the image
            text = pytesseract.image_to_string(image)

            # Find all phone numbers in the text
            found_numbers = re.findall(phone_number_pattern, text)
            phone_numbers.extend(found_numbers)

    return phone_numbers

# Example usage
directory_path = '/home/ubuntu/f'
phone_numbers = extract_phone_numbers_from_images(directory_path)
print(phone_numbers)
