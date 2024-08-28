#!/bin/bash

# Update package lists
sudo apt update

# Install necessary packages
sudo apt install -y apache2 php libapache2-mod-php php-mysql php-mbstring php-xml php-intl php-zip unzip mariadb-server

# Secure MySQL installation (optional but recommended)
sudo mysql_secure_installation

# Set up MariaDB database and user for Roundcube
sudo mysql -u root -p <<_EOF_
CREATE DATABASE roundcubemail;
GRANT ALL PRIVILEGES ON roundcubemail.* TO 'roundcube'@'localhost' IDENTIFIED BY '1ncrease';
FLUSH PRIVILEGES;
EXIT;
_EOF_

# Download Roundcube from the official repository
cd /tmp
wget https://github.com/roundcube/roundcubemail/releases/download/1.6.8/roundcubemail-1.6.8-complete.tar.gz

# Check if wget was successful before proceeding
if [ $? -eq 0 ]; then
    # Extract Roundcube files
    tar xvf roundcubemail-1.6.8-complete.tar.gz
    # Move extracted files to the web server's directory
    sudo mv roundcubemail-1.6.8 /var/www/html/roundcube
    # Set appropriate permissions for the Roundcube folders
    sudo chown -R www-data:www-data /var/www/html/roundcube
else
    echo "Failed to download Roundcube. Please check your internet connection or the URL provided."
    exit 1
fi

# Create an Apache virtual host configuration file for Roundcube
sudo tee /etc/apache2/conf-available/roundcube.conf > /dev/null <<EOF 
Alias /roundcube /var/www/html/roundcube/public_html


<Directory "/var/www/html/roundcube/installer">
    Options +FollowSymlinks
    AllowOverride All
    Require all granted
</Directory>

<Directory /var/www/html/roundcube/public_html>
    Options +FollowSymlinks
    AllowOverride All
    Require all granted
</Directory>

<Directory /var/www/html/roundcube/bin/>
    Require all denied
</Directory>

<Directory /var/www/html/roundcube/config/>
    Require all denied
</Directory>

<Directory /var/www/html/roundcube/temp/>
    Require all denied
</Directory>

<Directory /var/www/html/roundcube/logs/>
    Require all denied
</Directory>
EOF

# Enable the new Apache configuration and reload the service
sudo a2disconf roundcube.conf
sudo a2enmod rewrite
sudo a2enmod alias
sudo systemctl reload apache2


# http://elbethelacademy.com/roundcube/

$config['support_url'] = 'http://support.elbethelacademy.com';
