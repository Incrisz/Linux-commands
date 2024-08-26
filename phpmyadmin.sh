#!/bin/bash

# Update package information
sudo apt update
sudo apt install expect -y


# Install MySQL server
sudo apt install mysql-server -y

# Secure MySQL installation using an expect script
SECURE_MYSQL=$(expect -c "
set timeout 10
spawn sudo mysql_secure_installation

# Answer 'Yes' to set up VALIDATE PASSWORD component
expect \"Press y|Y for Yes, any other key for No:\"
send \"n\r\"

# Choose 'No' for remove anonymous users
expect \"Remove anonymous users? (Press y|Y for Yes, any other key for No) :\"
send \"n\r\"

# Choose 'No' for disallow remote root login
expect \"Disallow root login remotely? (Press y|Y for Yes, any other key for No) :\"
send \"n\r\"

# Choose 'No' for remove test database
expect \"Remove test database and access to it? (Press y|Y for Yes, any other key for No) :\"
send \"n\r\"

# Choose 'Yes' to reload privilege tables now
expect \"Reload privilege tables now? (Press y|Y for Yes, any other key for No) :\"
send \"y\r\"

expect eof
")

echo "$SECURE_MYSQL"





# Install PHP and required extensions:
sudo add-apt-repository -y ppa:ondrej/php
sudo apt install php8.0 libapache2-mod-php8.0 php8.0-mysql -y


# OR


#!/bin/bash

# Update package list and upgrade system
sudo apt update -y
sudo apt upgrade -y

# Set debconf selections for phpMyAdmin
# Replace 'your_mysql_root_password' with the password you want to assign to the MySQL root user
MYSQL_ROOT_PASSWORD="1ncrease"
PHPMYADMIN_PASSWORD="1ncrease" # If you want to set a specific phpMyAdmin application password

echo "Setting up debconf selections for phpMyAdmin..."
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $MYSQL_ROOT_PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PHPMYADMIN_PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PHPMYADMIN_PASSWORD"

# Install phpMyAdmin
echo "Installing phpMyAdmin..."
sudo apt install phpmyadmin -y

# Configure Apache to recognize phpMyAdmin
# echo "Configuring Apache to include phpMyAdmin configuration..."
# echo "Include /etc/phpmyadmin/apache.conf" | sudo tee -a /etc/apache2/apache2.conf

# Restart Apache to apply the changes
echo "Restarting Apache server..."
sudo service apache2 restart

# Change MySQL root user authentication method and set the password
echo "Updating MySQL root user authentication method..."
sudo mysql -u root <<_EOF_
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
exit
_EOF_

echo "phpMyAdmin installation and configuration completed."



# Open your web browser and enter the following URL:

http://your_server_ip/phpmyadmin
# Replace your_server_ip with the actual IP address or domain name of your server.

# Log in with the MySQL root username and password you set during the installation.

# That's it! You should now have MySQL and phpMyAdmin installed and accessible on your Ubuntu server



























