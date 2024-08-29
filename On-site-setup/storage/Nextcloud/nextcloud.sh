#!/bin/bash

# Update system packages and upgrade
sudo apt update && sudo apt upgrade -y

# Install Apache2, MariaDB, PHP, and required PHP modules
sudo apt install -y apache2 mariadb-server libapache2-mod-php php-gd php-mysql \
php-curl php-mbstring php-intl php-gmp php-bcmath php-xml php-imagick php-zip

# Secure MySQL installation (this is interactive and usually done manually)
# sudo mysql_secure_installation

# Create Nextcloud database and user
sudo mysql -u root -e "CREATE DATABASE nextcloud;"
sudo mysql -u root -e "CREATE USER 'nextclouduser'@'localhost' IDENTIFIED BY '11NCrease@@';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextclouduser'@'localhost';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"


# Download Nextcloud setup-nextcloud.php to the web directory
cd /var/www/html 
sudo wget https://download.nextcloud.com/server/installer/setup-nextcloud.php

# Set permissions for the Nextcloud web directory
sudo chown -R www-data:www-data /var/www/html/
sudo chmod 755 /var/www/html/

# Enable Apache mods needed by Nextcloud
sudo a2enmod rewrite headers env dir mime

# Restart Apache to apply changes
sudo systemctl restart apache2

# Instructions for manual steps here...
echo "Now, you should proceed by opening your web browser and navigating to http://<YourServerIPAddress>/setup-nextcloud.php to initiate the web-based setup process."

# The following commands can only be run after the web-based setup has completed
# sudo a2ensite nextcloud.conf

# Set owner of the file to the web server user, for example www-data
sudo chown www-data:www-data /var/www/html/nextcloud/config/config.php

# Ensure that the file has the correct read permissions
sudo chmod 640 /var/www/html/nextcloud/config/config.php



# config/config.php

#   'trusted_domains' => 
#   array (
#     0 => '140.82.13.150',
#     1 => 'drive.autofixersolution.com',
#   ),
