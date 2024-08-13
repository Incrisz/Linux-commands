# subdomain config(Cpanel WHM) added to the  /etc/apache/conf/httpd.conf

# To test if the config changes is okay before restarting web-server





# note : Main file is located at /etc/apache2/conf/httpd.conf


nano /etc/apache2/conf.d/loyaltyclub.conf 


# loyaltyclub subdomain


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
    ServerAlias www.loyaltyclub.peernetics.io
    # DocumentRoot /home/peernetics/loyaltyclub

      ProxyPreserveHost On
      ProxyPass / http://localhost:3000/
      ProxyPassReverse / http://localhost:3000/

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









# after inserting the file

chmod 644 /etc/apache2/conf.d/loyaltyclub.conf

apachectl configtest

systemctl reload httpd
