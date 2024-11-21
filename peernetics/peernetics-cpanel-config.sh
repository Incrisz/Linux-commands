# subdomain config(Cpanel WHM) added to the  /etc/apache/conf/httpd.conf

# To test if the config changes is okay before restarting web-server





# note : Main file is located at /etc/apache2/conf/httpd.conf


nano /etc/apache2/conf.d/loyaltyclub.conf 


# loyaltyclub subdomain


<VirtualHost *:80>
    ServerName loyaltyclub.peernetics.io
    ServerAlias www.loyaltyclub.peernetics.io
    # DocumentRoot /home/peernetics/loyaltyclub

    <Directory /home/peernetics/loyaltyclub>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>


    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
# sudo a2enmod proxy
# sudo a2enmod proxy_http
# sudo a2enmod ssl

<VirtualHost loyaltyclub.peernetics.io:443>
    ServerName loyaltyclub.peernetics.io
    ServerAlias www.loyaltyclub.peernetics.io
    # DocumentRoot /home/peernetics/loyaltyclub

      ProxyPreserveHost On
      ProxyPass / http://localhost:1213/
      ProxyPassReverse / http://localhost:1213/

    <IfModule ssl_module>
        SSLEngine on
        SSLCertificateFile      /etc/ssl/certs/ssl-cert-snakeoil.pem
        SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
    </IfModule>


    <Directory /home/peernetics/loyaltyclub>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>









# after inserting the file

# chmod 644 /etc/apache2/conf.d/loyaltyclub.conf

# apachectl configtest  or httpd -t

# systemctl reload httpd
