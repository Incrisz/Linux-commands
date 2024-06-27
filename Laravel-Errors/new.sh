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
