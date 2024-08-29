

# Setting up NextCloud

sudo apt update && sudo apt upgrade
sudo apt install apache2 mariadb-server libapache2-mod-php php-gd php-mysql \
php-curl php-mbstring php-intl php-gmp php-bcmath php-xml php-imagick php-zip




# sudo mysql_secure_installation

sudo mysql -u root
CREATE DATABASE nextcloud;
CREATE USER 'nextclouduser'@'localhost' IDENTIFIED BY '11NCrease@@';
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextclouduser'@'localhost' IDENTIFIED BY '11NCrease@@';
FLUSH PRIVILEGES;
EXIT;

wget https://download.nextcloud.com/server/installer/setup-nextcloud.php


chown -R www-data:www-data /var/www/html/setup-nextcloud.php
chmod 755 /var/www/html/setup-nextcloud.php

chown -R www-data:www-data /var/www/html/
chmod 755 /var/www/html/

# Now, you would typically proceed by opening your web browser and navigating to
# http://<YourServerIPAddress>/setup-nextcloud.php to initiate the web-based setup process.

sudo a2ensite nextcloud.conf

# a2enmod rewrite
# a2enmod headers
# a2enmod env
# a2enmod dir
# a2enmod mime

sudo a2enmod rewrite headers env dir mime

sudo systemctl restart apache2



# config/config.php

#   'trusted_domains' => 
#   array (
#     0 => '140.82.13.150',
#     1 => 'drive.autofixersolution.com',
#   ),
