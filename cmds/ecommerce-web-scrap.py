# sudo apt update
# sudo apt install python3-venv
# python3 -m venv myenv
# source myenv/bin/activate
# pip install autoscraper pandas openpyxl
# pip install Pillow
# pip install autoscraper








# JUST DISPLAY ON TERMINAL 

import requests
from bs4 import BeautifulSoup

# URL of the website you want to scrape
url = 'https://www.supermart.ng/collections/food-cupboard'

# Send a GET request to the URL
response = requests.get(url)

# Check if the request was successful
if response.status_code == 200:
    # Parse the HTML content of the page
    soup = BeautifulSoup(response.content, 'html.parser')

    # Find all product blocks
    product_blocks = soup.find_all('div', class_='product-block__inner')

    # Iterate through each product block and extract information
    for product_block in product_blocks:
        # Extract product image URL
        product_image_url = product_block.find('img', class_='rimage__image')['data-lazy-src'].replace('{width}', '220')
        # Check if the URL starts with '//'
        if product_image_url.startswith('//'):
            product_image_url = 'https:' + product_image_url
        product_image_urls.append(product_image_url)

        # Extract product name
        product_name = product_block.find('a', class_='title').text.strip()

        # Extract product price
        product_price = product_block.find('span', class_='amount').text.strip()

        # Print the extracted information
        print("Product Image URL:", product_image_url)
        print("Product Name:", product_name)
        print("Product Price:", product_price)
        print()  # Add a newline for better readability
else:
    print("Failed to retrieve the page")




































# EXPORT TO EXCEL(SINGLE)

import requests
from bs4 import BeautifulSoup
import pandas as pd

# URL of the website you want to scrape
url = 'https://www.supermart.ng/collections/food-cupboard'

# Send a GET request to the URL
response = requests.get(url)

# Check if the request was successful
if response.status_code == 200:
    # Parse the HTML content of the page
    soup = BeautifulSoup(response.content, 'html.parser')

    # Find all product blocks
    product_blocks = soup.find_all('div', class_='product-block__inner')

    # Lists to store the scraped data
    product_image_urls = []
    product_names = []
    product_prices = []

    # Iterate through each product block and extract information
    for product_block in product_blocks:
        # Extract product image URL
        product_image_url = product_block.find('img', class_='rimage__image')['data-lazy-src'].replace('{width}', '220')
             # Check if the URL starts with '//'
        if product_image_url.startswith('//'):
            product_image_url = 'https:' + product_image_url
        product_image_urls.append(product_image_url)

        # Extract product name
        product_name = product_block.find('a', class_='title').text.strip()
        product_names.append(product_name)

        # Extract product price
        product_price = product_block.find('span', class_='amount').text.strip()
        product_prices.append(product_price)

    # Create a DataFrame with the extracted data
    data = {
        'Product Image URL': product_image_urls,
        'Product Name': product_names,
        'Product Price': product_prices
    }
    df = pd.DataFrame(data)

    # Export the DataFrame to an Excel file
    df.to_excel('supermart_products.xlsx', index=False)

    print("Data exported to supermart_products.xlsx")
else:
    print("Failed to retrieve the page")









































# EXPORT TO EXCEL + PAGINATION



import requests
from bs4 import BeautifulSoup
import pandas as pd

# Base URL of the website you want to scrape
base_url = 'https://www.supermart.ng/collections/food-cupboard?page={}'

# Lists to store the scraped data
product_image_urls = []
product_names = []
product_prices = []

# Iterate over each page
page_number = 1
while True:
    # Construct the URL for the current page
    url = base_url.format(page_number)

    # Send a GET request to the URL
    response = requests.get(url)

    # Check if the request was successful
    if response.status_code == 200:
        # Parse the HTML content of the page
        soup = BeautifulSoup(response.content, 'html.parser')

        # Find all product blocks
        product_blocks = soup.find_all('div', class_='product-block__inner')

        # If there are no product blocks on the page, stop the loop
        if not product_blocks:
            break

        # Iterate through each product block and extract information
        for product_block in product_blocks:
            # Extract product image URL
            product_image_url = product_block.find('img', class_='rimage__image')['data-lazy-src'].replace('{width}', '220')
            # Check if the URL starts with '//'
            if product_image_url.startswith('//'):
                product_image_url = 'https:' + product_image_url
            product_image_urls.append(product_image_url)

            # Extract product name
            product_name = product_block.find('a', class_='title').text.strip()
            product_names.append(product_name)

            # Extract product price
            product_price = product_block.find('span', class_='amount').text.strip()
            product_prices.append(product_price)

        # Increment the page number for the next iteration
        page_number += 1
    else:
        print("Failed to retrieve the page")
        break

# Create a DataFrame with the extracted data
data = {
    'Product Image URL': product_image_urls,
    'Product Name': product_names,
    'Product Price': product_prices
}
df = pd.DataFrame(data)

# Export the DataFrame to an Excel file
df.to_excel('supermart_products.xlsx', index=False)

print("Data exported to supermart_products.xlsx")

























# Read the Excel file to get the product names and image URLs.
# Download each image using its URL.
# Save the image with the product name as the filename.


import requests
import pandas as pd
import os

# Load the data from the Excel file
df = pd.read_excel('supermart_products.xlsx')

# Ensure the directory for saving images exists
os.makedirs('product_images', exist_ok=True)

# Function to ensure the URL has the scheme
def ensure_scheme(url):
    if not url.startswith(('http://', 'https://')):
        return 'https://' + url
    return url

# Iterate over the DataFrame rows
for index, row in df.iterrows():
    product_name = row['Product Name']
    product_image_url = row['Product Image URL']

    # Ensure the URL has the scheme
    product_image_url = ensure_scheme(product_image_url)

    # Clean the product name to create a valid filename
    valid_filename = ''.join(c for c in product_name if c.isalnum() or c in (' ', '-', '_')).rstrip()

    # Set the image file path
    image_path = os.path.join('product_images', f"{valid_filename}.jpg")

    # Download the image and save it
    try:
        response = requests.get(product_image_url)
        if response.status_code == 200:
            with open(image_path, 'wb') as f:
                f.write(response.content)
            print(f"Downloaded {product_name}")
        else:
            print(f"Failed to download {product_name} (status code: {response.status_code})")
    except Exception as e:
        print(f"Error downloading {product_name}: {e}")

print("Image downloading completed")






































#  convert images to WebP format:

from PIL import Image
import os

# Function to convert image to WebP format
def convert_to_webp(input_path, output_path):
    try:
        # Open the image file
        with Image.open(input_path) as img:
            # Convert the image to WebP format
            img.save(output_path, 'WEBP')
            print(f"Image converted to WebP: {output_path}")
    except Exception as e:
        print(f"Failed to convert image to WebP: {e}")

# Path to the directory containing images
input_dir = 'product_images'

# Path to the directory where WebP images will be saved
output_dir = 'new'

# Iterate through each image file in the input directory
for filename in os.listdir(input_dir):
    if filename.endswith('.jpg') or filename.endswith('.jpeg') or filename.endswith('.png'):
        # Construct the input and output paths for each image
        input_path = os.path.join(input_dir, filename)
        output_path = os.path.join(output_dir, os.path.splitext(filename)[0] + '.webp')

        # Convert the image to WebP format
        convert_to_webp(input_path, output_path)











