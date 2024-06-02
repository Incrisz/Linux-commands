


#supermart
import requests
from bs4 import BeautifulSoup
import pandas as pd
from PIL import Image
import os

# Function to ensure the URL has the scheme
def ensure_scheme(url):
    if not url.startswith(('http://', 'https://')):
        return 'https:' + url
    return url

# Function to download images
def download_image(url, path):
    try:
        response = requests.get(url)
        response.raise_for_status()
        with open(path, 'wb') as f:
            f.write(response.content)
        print(f"Downloaded {path}")
    except Exception as e:
        print(f"Failed to download {path}: {e}")

# Function to convert images to WebP format
def convert_to_webp(input_path, output_path):
    try:
        with Image.open(input_path) as img:
            img.save(output_path, 'WEBP')
        print(f"Converted {input_path} to WebP format")
    except Exception as e:
        print(f"Failed to convert {input_path} to WebP: {e}")

# List of base URLs to scrape
base_urls = {
    'beer-stout-cider': 'https://www.supermart.ng/collections/beer-stout-cider?page={}',
    'bitters-herbal-drinks': 'https://www.supermart.ng/collections/bitters-herbal-drinks?page={}',
    'red-wine': 'https://www.supermart.ng/collections/red-wine?page={}',
    'white-wine': 'https://www.supermart.ng/collections/white-wine?page={}',
    'rose-wine': 'https://www.supermart.ng/collections/rose-wine?page={}',
    'sparkling-wine': 'https://www.supermart.ng/collections/sparkling-wine?page={}',
    'champagne': 'https://www.supermart.ng/collections/champagne?page={}',
    'brandy-cognac-whisky': 'https://www.supermart.ng/collections/brandy-cognac-whisky?page={}',
    'aperitifs-liqueurs': 'https://www.supermart.ng/collections/aperitifs-liqueurs?page={}',
    'gin-vodka': 'https://www.supermart.ng/collections/gin-vodka?page={}',
    'rum': 'https://www.supermart.ng/collections/rum?page={}',
    'tequila': 'https://www.supermart.ng/collections/tequila?page={}',
    'alcopops': 'https://www.supermart.ng/collections/alcopops?page={}',
    'drinks-in-bulk': 'https://www.supermart.ng/collections/drinks-in-bulk?page={}'
}



# Iterate over each base URL
for category, base_url in base_urls.items():
    # Lists to store the scraped data
    product_image_urls = []
    product_names = []
    product_prices = []

    # Iterate over each page
    page_number = 1
    while True:
        url = base_url.format(page_number)
        response = requests.get(url)

        if response.status_code != 200:
            print(f"Failed to retrieve page {page_number} for URL {base_url}")
            break

        soup = BeautifulSoup(response.content, 'html.parser')
        product_blocks = soup.find_all('div', class_='product-block__inner')

        if not product_blocks:
            break

        for product_block in product_blocks:
            image_url = product_block.find('img', class_='rimage__image')['data-lazy-src'].replace('{width}', '220')
            image_url = ensure_scheme(image_url)
            product_image_urls.append(image_url)

            product_name = product_block.find('a', class_='title').text.strip()
            product_names.append(product_name)

            product_price = product_block.find('span', class_='amount').text.strip()
            product_prices.append(product_price)

        page_number += 1

    # Create a DataFrame and export to Excel
    df = pd.DataFrame({
        'Product Image URL': product_image_urls,
        'Product Name': product_names,
        'Product Price': product_prices
    })
    excel_file = f'{category}_products.xlsx'
    df.to_excel(excel_file, index=False)
    print(f"Data exported to {excel_file}")

    # Ensure directories exist
    images_dir = f'{category}_product_images'
    webp_dir = f'{category}_webp_images'
    os.makedirs(images_dir, exist_ok=True)
    os.makedirs(webp_dir, exist_ok=True)

    # Download images
    for index, row in df.iterrows():
        product_name = row['Product Name']
        product_image_url = row['Product Image URL']
        product_image_url = ensure_scheme(product_image_url)
        valid_filename = ''.join(c for c in product_name if c.isalnum() or c in (' ', '-', '_')).rstrip().replace(' ', '_')

        image_path = os.path.join(images_dir, f"{valid_filename}.jpg")
        download_image(product_image_url, image_path)

    # Convert images to WebP
    for filename in os.listdir(images_dir):
        if filename.endswith('.jpg') or filename.endswith('.jpeg') or filename.endswith('.png'):
            input_path = os.path.join(images_dir, filename)
            output_path = os.path.join(webp_dir, os.path.splitext(filename)[0] + '.webp')
            convert_to_webp(input_path, output_path)

print("Image downloading and conversion to WebP completed")
