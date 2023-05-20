# Update the package lists on your server:

sudo apt update
# Install MySQL server:

sudo apt install mysql-server -y
# During the installation, you'll be prompted to set a password for the MySQL root user. Choose a secure password and remember it.

# Secure the MySQL installation by running the security script:

sudo mysql_secure_installation
# This script will guide you through securing various aspects of your MySQL installation. You can choose the default recommended options.

# Install PHP and required extensions:

sudo apt install php8.0 libapache2-mod-php8.0 php8.0-mysql -y
# Install phpMyAdmin:

sudo apt install phpmyadmin -y
# During the installation, you'll be prompted to select the web server that should be automatically configured for phpMyAdmin. Choose apache2 using the spacebar, and then press Enter to continue.

# In the next prompt, select Yes to configure the database for phpMyAdmin with dbconfig-common.

# Provide the MySQL root user password that you set earlier when prompted.

# Configure Apache to recognize phpMyAdmin:

sudo nano /etc/apache2/apache2.conf
# Add the following line at the bottom of the file:


Include /etc/phpmyadmin/apache.conf
# Save the file and exit the text editor.

# Restart Apache to apply the changes:

sudo service apache2 restart
# Access phpMyAdmin in a web browser:

mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1ncrease';


# Open your web browser and enter the following URL:

http://your_server_ip/phpmyadmin
# Replace your_server_ip with the actual IP address or domain name of your server.

# Log in with the MySQL root username and password you set during the installation.

# That's it! You should now have MySQL and phpMyAdmin installed and accessible on your Ubuntu server