# Composer detected issues in your platform: Your Composer dependencies require a PHP version ">= 8.2.0".

# Create a phpinfo.php file:

<?php
phpinfo();
?>

# Access the file via your browser:

http://your-server-ip/phpinfo.php


# Disable the current PHP module:

sudo a2dismod php7.1


sudo a2enmod php8.0

sudo systemctl restart apache2

composer update




# resolve a dependency installation with php version
composer require laracon21/colorcodeconverter --ignore-platform-reqs

composer require laracon21/combinations --ignore-platform-reqs

composer update --ignore-platform-reqs



coindlgo_mebany.sql