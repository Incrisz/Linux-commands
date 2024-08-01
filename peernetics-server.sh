# subdomain config(Cpanel WHM) added to the  /etc/apache/conf/httpd.conf

# To test if the config changes is okay before restarting web-server
apachectl configtest

systemctl reload httpd


# loyaltyclub subdomain


<VirtualHost loyaltyclub.peernetics.io:80>
    ServerName loyaltyclub.peernetics.io
    ServerAlias www.loyaltyclub.peernetics.io
    DocumentRoot /home/peernetics/loyaltyclub

    <Directory /home/peernetics/loyaltyclub>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    # ErrorLog ${APACHE_LOG_DIR}/loyaltyclub-error.log
    # CustomLog ${APACHE_LOG_DIR}/loyaltyclub-access.log combined
</VirtualHost>

<VirtualHost loyaltyclub.peernetics.io:443>
    ServerName loyaltyclub.peernetics.io
    DocumentRoot /home/peernetics/loyaltyclub

  <IfModule ssl_module>
    SSLEngine on
    SSLCertificateFile /var/cpanel/ssl/apache_tls/peernetics.io/combined
</IfModule>


    <Directory /home/peernetics/loyaltyclub>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    # ErrorLog ${APACHE_LOG_DIR}/loyaltyclub-ssl-error.log
    # CustomLog ${APACHE_LOG_DIR}/loyaltyclub-ssl-access.log combined
</VirtualHost>
