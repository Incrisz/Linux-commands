# sudo apt update
# sudo apt install python3-venv
# python3 -m venv myenv
# source myenv/bin/activate
# pip install autoscraper pandas openpyxl
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
        product_image_url = product_block.find('img', class_='rimage__image')['data-lazy-src']

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
        product_image_url = product_block.find('img', class_='rimage__image')['data-lazy-src']
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
            product_image_url = product_block.find('img', class_='rimage__image')['data-lazy-src']
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
