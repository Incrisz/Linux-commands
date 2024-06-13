


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
    'vitamins-supplements': 'https://www.supermart.ng/collections/vitamins-supplements?page={}',
    'headaches-pain': 'https://www.supermart.ng/collections/headaches-pain?page={}',
    'coughing-sneezing': 'https://www.supermart.ng/collections/coughing-sneezing?page={}',
    'stomach-bowel': 'https://www.supermart.ng/collections/stomach-bowel?page={}',
    'contraception-sexual-pleasure': 'https://www.supermart.ng/collections/contraception-sexual-pleasure?page={}',
    'conception-pregnancy': 'https://www.supermart.ng/collections/conception-pregnancy?page={}',
    'allergy-infections': 'https://www.supermart.ng/collections/allergy-infections?page={}',
    'first-aid-test-kits': 'https://www.supermart.ng/collections/first-aid-test-kits?page={}',
    'sleep-aids': 'https://www.supermart.ng/collections/sleep-aids?page={}',
    'diet-weight-loss': 'https://www.supermart.ng/collections/diet-weight-loss?page={}',
    'eye-ear-care': 'https://www.supermart.ng/collections/eye-ear-care?page={}',
    'heart-blood': 'https://www.supermart.ng/collections/heart-blood?page={}',
    'braces-joint-support': 'https://www.supermart.ng/collections/braces-joint-support?page={}',
    'aromatherapy-essential-oils': 'https://www.supermart.ng/collections/aromatherapy-essential-oils?page={}'
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