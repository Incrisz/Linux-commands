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



cd $DIR/
# Folder for git work

# sudo git clone git@github.com:Incrisz/hidden.git
sudo git clone https://github.com/Incrisz/easelow.git

cd $LOCATION
cd app/
sudo git clone https://github.com/Incrisz/exceptions.git
sudo mv exceptions/Exceptions $DIR/$LOCATION/app/
cd ..
sudo mkdir storage/framework/cache/data

# sudo cp .env.example .env
# composer tester

sudo composer update -n

# use this if it complains of versions 
# composer global require laravel/installer --update-with-all-dependencies

# sudo wget https://easelowstore.s3.amazonaws.com/envaf.txt
sudo touch .env
cd app/
sudo mv exceptions/CoreComponentRepository.php /var/www/html/mebany-ecomm//vendor/mehedi-iitdu/core-component-repository/src/
sudo rm -r exceptions
cd ..
# sudo wget https://github.com/Incrisz/Linux-commands/blob/main/.env

# sudo ./env.sh
# sudo rm env.sh

sudo find . -type f -exec chmod 644 {} \;
sudo find . -type d -exec chmod 755 {} \;

sudo chown -R www-data:www-data .
sudo chmod -R 755 .
sudo chmod -R 755 storage
sudo chmod -R 755 storage/ *
sudo chmod -R 755 bootstrap/cache

# To test the whole setup
php artisan key:generate
php artisan cache:clear
php artisan config:clear
php artisan config:cache
php artisan optimize:clear
php artisan route:clear
php artisan view:clear


sudo service apache2 restart



# How to Pull and Run
# sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/raw/main/setup/install.sh   
# OR
# sudo curl -LO https://raw.githubusercontent.com/Incrisz/Linux-commands/raw/main/setup/install.sh

# sudo chmod +x install.sh
# sudo ./install.sh