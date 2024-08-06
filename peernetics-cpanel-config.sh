<VirtualHost *:80>
    ServerName loyaltyclub.peernetics.io
    ServerAlias www.loyaltyclub.peernetics.io
    DocumentRoot /home/peernetics/loyaltyclub

    <Directory /home/peernetics/loyaltyclub>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog /var/log/httpd/loyaltyclub-error.log
    CustomLog /var/log/httpd/loyaltyclub-access.log combined
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

    ErrorLog /var/log/httpd/loyaltyclub-ssl-error.log
    CustomLog /var/log/httpd/loyaltyclub-ssl-access.log combined
</VirtualHost>
