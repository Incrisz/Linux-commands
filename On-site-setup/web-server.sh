#!/bin/bash

DIR="/var/www/html"
# DIR="/var/www"
LOCATION="easelow"

# Update packages and install necessary packages
sudo apt update
sudo apt-get install unzip
sudo apt-get install p7zip -y

sudo apt install apache2 -y


# Add the ondrej/php repository and install PHP 8.0
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install php8.0 -y



# to check packages installed
# sudo php -m



# Update packages and install necessary packages
sudo apt install php8.0-dom
sudo apt install php8.0-gd -y
sudo apt install php8.0-intl  
sudo apt install php8.0-mbstring -y
# sudo apt install php8.0-simplexml
sudo apt install php8.0-xml 
sudo apt install php8.0-xsl 
sudo apt install php8.0-zip -y
sudo apt-get install php8.0-curl
sudo apt install php8.0-pdo-mysql
sudo apt-get install php8.0-bcmath -y






# Install Composer
curl -sS https://getcomposer.org/installer | sudo php8.0 -- --install-dir=/usr/local/bin --filename=composer


# Update package list and install software-properties-common
sudo apt update
sudo apt install -y software-properties-common

# Add Ondřej Surý's PPA for PHP
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update

# Install PHP 7.0
sudo apt install -y php7.0 php7.0-dom php7.0-gd php7.0-intl php7.0-mbstring php7.0-xml php7.0-xsl php7.0-zip php7.0-curl php7.0-mysql php7.0-bcmath

# Install PHP 7.1
sudo apt install -y php7.1 php7.1-dom php7.1-gd php7.1-intl php7.1-mbstring php7.1-xml php7.1-xsl php7.1-zip php7.1-curl php7.1-mysql php7.1-bcmath

# Install PHP 7.2
sudo apt install -y php7.2 php7.2-dom php7.2-gd php7.2-intl php7.2-mbstring php7.2-xml php7.2-xsl php7.2-zip php7.2-curl php7.2-mysql php7.2-bcmath

# Install PHP 7.3
sudo apt install -y php7.3 php7.3-dom php7.3-gd php7.3-intl php7.3-mbstring php7.3-xml php7.3-xsl php7.3-zip php7.3-curl php7.3-mysql php7.3-bcmath

# Install PHP 7.4
sudo apt install -y php7.4 php7.4-dom php7.4-gd php7.4-intl php7.4-mbstring php7.4-xml php7.4-xsl php7.4-zip php7.4-curl php7.4-mysql php7.4-bcmath

# Install PHP 8.0
# sudo apt install -y php8.0 php8.0-dom php8.0-gd php8.0-intl php8.0-mbstring php8.0-xml php8.0-xsl php8.0-zip php8.0-curl php8.0-mysql php8.0-bcmath

# Install PHP 8.1
sudo apt install -y php8.1 php8.1-dom php8.1-gd php8.1-intl php8.1-mbstring php8.1-xml php8.1-xsl php8.1-zip php8.1-curl php8.1-mysql php8.1-bcmath

# Install PHP 8.2 (If available in the repository, otherwise skip or use a different source)
sudo apt install -y php8.2 php8.2-dom php8.2-gd php8.2-intl php8.2-mbstring php8.2-xml php8.2-xsl php8.2-zip php8.2-curl php8.2-mysql php8.2-bcmath


# Install PHP 8.3
sudo apt install -y php8.3 php8.3-dom php8.3-gd php8.3-intl php8.3-mbstring php8.3-xml php8.3-xsl php8.3-zip php8.3-curl php8.3-mysql php8.3-bcmath
