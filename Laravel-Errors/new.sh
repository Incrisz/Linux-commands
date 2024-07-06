# Composer detected issues in your platform: Your Composer dependencies require a PHP version ">= 8.2.0".

# Create a phpinfo.php file:

<?php
phpinfo();
?>

# Access the file via your browser:

http://your-server-ip/phpinfo.php


# Disable the current PHP module:

sudo a2dismod php8.0


sudo a2enmod php8.3

sudo systemctl restart apache2

composer update




# resolve a dependency installation with php version
composer require laracon21/colorcodeconverter --ignore-platform-reqs

composer require laracon21/combinations --ignore-platform-reqs

composer update --ignore-platform-reqs



coindlgo_mebany.sql








<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName yourdomain.com
    ServerAlias www.yourdomain.com

    DocumentRoot /var/www/html

    <Directory /var/www/html>
        AllowOverride All
        Require all granted
        Options Indexes FollowSymLinks MultiViews

        <IfModule mod_rewrite.c>
            RewriteEngine On
            RewriteCond %{REQUEST_FILENAME} !-f
            RewriteRule ^ index.php [L]
        </IfModule>
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>



sudo a2enmod rewrite

sudo a2dissite 000-default.conf
sudo systemctl restart apache2

sudo a2ensite 000-default.conf
sudo systemctl restart apache2



mysql -u root
CREATE DATABASE school;
CREATE USER 'incrisz'@'localhost' IDENTIFIED BY '1ncrease';
GRANT ALL PRIVILEGES ON *.* TO 'incrisz'@'localhost';
FLUSH PRIVILEGES;

EXIT;




sudo apt update
sudo apt install phpmyadmin

# During the installation, you'll be prompted to choose the web server that should be automatically configured to run phpMyAdmin. If you're using Apache, select it by pressing the spacebar, then press Enter.

# When asked to configure the database for phpMyadmin with dbconfig-common, select 'Yes'.

# You'll be prompted to enter the MySQL application password for phpMyAdmin; you can choose to leave this blank and a random password will be generated.

# You'll also need to input the password for the MySQL administrative user (root or another user with administrative privileges) to create the necessary database and user for phpMyAdmin.

sudo phpenmod mbstring

sudo systemctl restart apache2

sudo nano /etc/apache2/conf-available/phpmyadmin.conf