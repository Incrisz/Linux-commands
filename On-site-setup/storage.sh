# setup my linux server as a storage for all to use
sudo apt update
#!/bin/bash

# Update system repositories and install Samba
apt update
apt install -y samba samba-common-bin

# Create the shared directory if it doesn't exist
mkdir -p /home/ubuntu
chown nobody:nogroup /home/ubuntu
chmod 0777 /home/ubuntu

# Backup the original smb.conf file
cp /etc/samba/smb.conf /etc/samba/smb.conf.backup

# Configure the new Samba share
tee -a /etc/samba/smb.conf > /dev/null <<EOT
[SharedStorage]
    comment = Shared Storage
    path = /home/ubuntu
    browseable = yes
    guest ok = yes
    read only = no
    create mask = 0777
    directory mask = 0777
EOT

# Restart Samba service
systemctl restart smbd

echo "Samba shared storage configured successfully!"


# Setting up FileRun and Nextcloud

# Setting up FileRun

# Visit FileRun's download page to get the latest version of FileRun.
unzip FileRun.zip -d /path/to/your/web/directory/filerun

chown -R www-data:www-data /path/to/your/web/directory/filerun

CREATE DATABASE filerun;
GRANT ALL PRIVILEGES ON filerun.* TO 'filerun'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

# Navigate to http://<YourServerIP>/filerun in your web browser.

# Setting up NextCloud

sudo apt update
sudo apt install apache2 mariadb-server libapache2-mod-php
sudo apt install php-gd php-json php-mysql php-curl php-mbstring
sudo apt install php-intl php-imagick php-xml php-zip

sudo mysql_secure_installation

sudo mysql -u root -p
CREATE DATABASE nextcloud;
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextclouduser'@'localhost' IDENTIFIED BY 'yourpassword';
FLUSH PRIVILEGES;
EXIT;

wget https://download.nextcloud.com/server/releases/nextcloud-20.0.0.zip


unzip nextcloud-20.0.0.zip -d /var/www/html/

chown -R www-data:www-data /var/www/html/nextcloud/


<VirtualHost *:80>
    DocumentRoot "/var/www/html/nextcloud/"
    ServerName your-domain.com

    <Directory /var/www/html/nextcloud/>
        Require all granted
        AllowOverride All
        Options FollowSymLinks MultiViews

        <IfModule mod_dav.c>
            Dav off
        </IfModule>
    </Directory>
</VirtualHost>


sudo a2ensite nextcloud.conf


sudo a2enmod rewrite headers env dir mime

sudo systemctl restart apache2


