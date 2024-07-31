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
# pip install webdriver-manager




from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

# Path to your identified Chrome user profile
user_profile = '/home/cloud/.config/google-chrome/Profile 20'

# Set up Chrome options to use the profile
options = webdriver.ChromeOptions()
options.add_argument(f"user-data-dir={user_profile}")  # Specify the directory containing all profiles
options.add_argument("--no-sandbox")  # Bypass OS security model
options.add_argument("--disable-dev-shm-usage")  # Overcome limited resource problems
options.add_argument("--remote-debugging-port=9222")  # Debugging port
# options.add_argument("--headless")  # Run in headless mode (optional, if you don't need GUI)
options.add_argument("--disable-gpu")  # Applicable for headless mode to disable GPU
options.add_argument("--window-size=1920x1080")  # Set the window size to avoid potential issues
options.add_argument("--disable-extensions")  # Disable extensions to avoid conflicts
options.add_argument("--disable-software-rasterizer")  # Disable software rasterizer

print("Initializing WebDriver with WebDriverManager...")
# Initialize WebDriver with WebDriverManager
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options)

try:
    print("Opening WhatsApp Web...")
    # Open WhatsApp Web
    driver.get('https://web.whatsapp.com')

    # Wait for the user to scan the QR code if necessary
    print("Please scan the QR code to log in. Waiting for 30 seconds...")
    time.sleep(30)  # Wait time can be adjusted based on how long it takes to scan

    print("Locating the 'New Status' button...")
    # Locate and click the 'New Status' button
    new_status_btn = driver.find_element(By.XPATH, '//span[@data-icon="status-v3"]')
    new_status_btn.click()

    print("Waiting for the new status interface to load...")
    time.sleep(5)  # Give some time for the new status interface to load

    print("Uploading media file...")
    # Provide the path to the media file you want to upload
    media_path = '/home/cloud/Desktop/dsdsds.png'  # Update with the actual path to your media file
    upload_input = driver.find_element(By.XPATH, '//*[@type="file"]')
    upload_input.send_keys(media_path)

    print("Waiting for the media to upload...")
    time.sleep(5)  # Wait for the media to upload

    print("Adding caption to the status...")
    # Optionally, add a caption
    caption_box = driver.find_element(By.XPATH, '//div[@contenteditable="true"]')
    caption_box.send_keys('Automated status message!')

    print("Sending the status update...")
    # Locate the 'Send' button and click it
    send_btn = driver.find_element(By.XPATH, '//span[@data-icon="send"]')
    send_btn.click()

    print("Waiting to ensure the status is posted...")
    # Wait a bit to ensure the status is posted
    time.sleep(10)

finally:
    print("Closing the browser...")
    # Close the browser
    driver.quit()

print("Script completed successfully.")
