#!/bin/bash

# Update package list and install software-properties-common
apt update
apt install -y software-properties-common

# Add Ondřej Surý's PPA for PHP
add-apt-repository -y ppa:ondrej/php
apt update

# Install PHP 7.0
apt install -y php7.0 php7.0-dom php7.0-gd php7.0-intl php7.0-mbstring php7.0-xml php7.0-xsl php7.0-zip php7.0-curl php7.0-mysql php7.0-bcmath

# Install PHP 7.1
apt install -y php7.1 php7.1-dom php7.1-gd php7.1-intl php7.1-mbstring php7.1-xml php7.1-xsl php7.1-zip php7.1-curl php7.1-mysql php7.1-bcmath

# Install PHP 7.2
apt install -y php7.2 php7.2-dom php7.2-gd php7.2-intl php7.2-mbstring php7.2-xml php7.2-xsl php7.2-zip php7.2-curl php7.2-mysql php7.2-bcmath

# Install PHP 7.3
apt install -y php7.3 php7.3-dom php7.3-gd php7.3-intl php7.3-mbstring php7.3-xml php7.3-xsl php7.3-zip php7.3-curl php7.3-mysql php7.3-bcmath

# Install PHP 7.4
apt install -y php7.4 php7.4-dom php7.4-gd php7.4-intl php7.4-mbstring php7.4-xml php7.4-xsl php7.4-zip php7.4-curl php7.4-mysql php7.4-bcmath

# Install PHP 8.0
apt install -y php8.0 php8.0-dom php8.0-gd php8.0-intl php8.0-mbstring php8.0-xml php8.0-xsl php8.0-zip php8.0-curl php8.0-mysql php8.0-bcmath

# Install PHP 8.1
apt install -y php8.1 php8.1-dom php8.1-gd php8.1-intl php8.1-mbstring php8.1-xml php8.1-xsl php8.1-zip php8.1-curl php8.1-mysql php8.1-bcmath

# Install PHP 8.2 (If available in the repository, otherwise skip or use a different source)
apt install -y php8.2 php8.2-dom php8.2-gd php8.2-intl php8.2-mbstring php8.2-xml php8.2-xsl php8.2-zip php8.2-curl php8.2-mysql php8.2-bcmath


# Install PHP 8.3
apt install -y php8.3 php8.3-dom php8.3-gd php8.3-intl php8.3-mbstring php8.3-xml php8.3-xsl php8.3-zip php8.3-curl php8.3-mysql php8.3-bcmath

# You can check if it is available and add a similar command to install it.

# list all php installed

update-alternatives --list php

# Switch on terminal 

# Switch to PHP 7.0
update-alternatives --set php /usr/bin/php7.0

# Switch to PHP 7.1
update-alternatives --set php /usr/bin/php7.1

# Switch to PHP 7.2
update-alternatives --set php /usr/bin/php7.2

# Switch to PHP 7.3
update-alternatives --set php /usr/bin/php7.3

# Switch to PHP 7.4
update-alternatives --set php /err/bin/php7.4

# Switch to PHP 8.0
update-alternatives --set php /usr/bin/php8.0

# Switch to PHP 8.1 (if installed)
update-alternatives --set php /usr/bin/php8.2

# And so on for other versions...



# Example for switching from PHP 7.4 to PHP 8.0 for WEB

# Disable PHP 7.4 module
a2dismod php7.1

# Enable PHP 8.0 module
a2enmod php8.0

# Restart Apache to apply changes
systemctl restart apache2
