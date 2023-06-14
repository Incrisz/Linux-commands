#!/bin/bash

# Create virtual host file for Laravel application
sudo cat <<EOT >> /etc/apache2/sites-available/hidden.conf
<VirtualHost *:80>


	ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/update

    <Directory /var/www/html/update>
        AllowOverride All
        Require all granted
        Options Indexes FollowSymLinks
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOT

sudo cat <<EOT >> /etc/apache2/sites-available/hidden-ssl.conf
<VirtualHost *:443>


	ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/update

    <Directory /var/www/html>
        AllowOverride All
        Require all granted
        Options Indexes FollowSymLinks
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined


    SSLEngine on
    SSLCertificateFile /etc/letsencrypt/live/update.easelow.com.ng/cert.pem
    SSLCertificateChainFile /etc/letsencrypt/live/update.easelow.com.ng/chain.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/update.easelow.com.ng/privkey.pem
</VirtualHost>
EOT
# Enable the virtual host and rewrite module, then restart Apache
sudo a2dissite 000-default.conf
sudo a2ensite hidden.conf
sudo a2ensite hidden-ssl.conf
sudo a2enmod rewrite
sudo systemctl restart apache2






# Apache2 check
sudo cd /home/ubuntu
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/apache-check.sh
sudo chmod +x apache-check.sh 
# sudo mv apache-check.sh /home/ubuntu/apache-check.sh
# sudo chmod +x apache-check.sh 

# cron-job setup   
# crontab -e  [code to check file]
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/cron-job.sh
sudo chmod +x cron-job.sh 
sudo su
sudo ./cron-job.sh

