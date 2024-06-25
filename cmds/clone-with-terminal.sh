wget -r -p -E -k https://pro-theme.com/html/lesh/transaero/01_home.html

wget -r -l1 -H -t1 -nd -N -np -A.jpg,.jpeg,.png,.gif -erobots=off https://www.supermart.ng/
# Replace http://www.example.com with the URL of the website you want to crawl.

# -r: Recursively crawl all linked pages
# -p: Preserve the directory structure of the website
# -E: Convert HTML links to relative links
# -k: Convert links to local copies

wget http://13.245.16.251/img/www.supermart.ng/cdn/shop.zip


# or use httrack
sudo apt-get install httrack

# clone 
httrack https://kaleidoscopic-pie-2341a3.netlify.app/template/ -O /var/www/html/template/ "+*.googleapis.com/*" "+*.gstatic.com/*" -v


# Method 2: Using a Scripting Language (Python)
import requests
from bs4 import BeautifulSoup

def crawl(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')

    # Extract relevant information from the page
    # ...

    # Find all links on the page
    links = soup.find_all('a', href=True)

    # Recursively crawl linked pages
    for link in links:
        new_url = link['href']
        crawl(new_url)

if __name__ == '__main__':
    start_url = 'http://www.example.com'
    crawl(start_url)



# Method 3: Using a Web Scraping Library (Scrapy)

import scrapy

class MySpider(scrapy.Spider):
    name = 'my_spider'
    allowed_domains = ['http://www.example.com']
    start_urls = ['http://www.example.com']

    def parse(self, response):
        # Extract relevant information from the page
        # ...

        # Find all links on the page
        links = response.css('a::attr(href)')

        # Recursively crawl linked pages
        for link in links:
            yield scrapy.Request(link, callback=self.parse)
