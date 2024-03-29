#!/bin/bash

# Update packages and install necessary packages
sudo apt update
sudo apt install apache2 -y

# Add the ondrej/php repository and install PHP 7.2
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install php7.2 -y
sudo apt-get install php7.2-bcmath php7.2-bz2 php7.2-intl php7.2-gd php7.2-mbstring php7.2-mysql php7.2-zip -y
sudo apt-get install php7.4-bz2 php7.4-calendar php7.4-core php7.4-ctype php7.4-curl php7.4-date php7.4-exif php7.4-filter php7.4-ftp php7.4-gettext php7.4-gmp php7.4-hash php7.4-iconv php7.4-libxml php7.4-openssl php7.4-pcntl php7.4-pcre php7.4-readline php7.4-reflection php7.4-session php7.4-shmop php7.4-simplexml php7.4-spl php7.4-sqlite3 php7.4-standard php7.4-tokenizer php7.4-xml php7.4-zlib 


# Install Composer
curl -sS https://getcomposer.org/installer | sudo php8.0 -- --install-dir=/usr/local/bin --filename=composer

# Create virtual host file for Laravel application
sudo cat <<EOT >> /etc/apache2/sites-available/easelow.conf
<VirtualHost *:80>
    ServerName easelow.com.ng
    ServerAlias www.easelow.com.ng
    DocumentRoot /var/www/easelow

    <Directory /var/www/easelow>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOT

# Enable the virtual host and rewrite module, then restart Apache
sudo a2ensite easelow.conf
sudo a2enmod rewrite
sudo systemctl restart apache2

# Clone the Laravel application and install dependencies
sudo git clone https://github.com/Incrisz/easelow.git /var/www/easelow/
sudo composer install --no-interaction
sudo chown -R www-data:www-data /var/www/easelow/
sudo chmod -R 755 /var/www/easelow/
sudo chmod -R 755 /var/www/easelow/storage
sudo chmod -R 755 /var/www/easelow/bootstrap/cache


# Create environment file, generate application key, and migrate the database
cd /var/www/easelow/
cp .env.example .env
sudo nano .env # Edit the file with necessary configurations
sudo php artisan key:generate
sudo php artisan migrate


# Save this script in a file with a .sh extension (e.g. install_easelow.sh). Then, make the script executable with the command chmod +x install_easelow.sh. Finally, run the script with ./install_easelow.sh. This should automate the installation process.
#if it shows page not found 403 apache2 80 stuff...to solve add .htaccess and index.php files