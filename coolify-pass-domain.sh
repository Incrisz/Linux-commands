sudo a2enmod rewrite

#  add all this in one file for http



<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName phylab.cyfamod.com

    # The root directory where your application files are located
    # DocumentRoot /var/www/html

    # Proxy settings to forward requests to the Docker container
    ProxyPass "/" "http://172.18.0.11:3000/" timeout=30
    ProxyPassReverse "/" "http://172.18.0.11:3000/"

    # Log settings
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    # If you need to enable certain modules or configurations, do so here
    # Include conf-available/serve-cgi-bin.conf
</VirtualHost>






<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName eureka.cyfamod.com

    # The root directory where your application files are located
    # DocumentRoot /var/www/html

    # Proxy settings to forward requests to the Docker container
    ProxyPass "/" "http://172.18.0.10:3000/" timeout=30
    ProxyPassReverse "/" "http://172.18.0.10:3000/"

    # Log settings
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    # If you need to enable certain modules or configurations, do so here
    # Include conf-available/serve-cgi-bin.conf
</VirtualHost>



<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName trafull.cyfamod.com

    # The root directory where your application files are located
    # DocumentRoot /var/www/html

    # Proxy settings to forward requests to the Docker container
    ProxyPass "/" "http://172.18.0.14:3000/" timeout=30
    ProxyPassReverse "/" "http://172.18.0.14:3000/"

    # Log settings
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    # If you need to enable certain modules or configurations, do so here
    # Include conf-available/serve-cgi-bin.conf
</VirtualHost>












#  add all this in one file for https

<VirtualHost *:443>
        ServerAdmin webmaster@localhost
        ServerName ipala.cyfamod.com

        # DocumentRoot /var/www/html
        # Reverse Proxy Configuration
        ProxyPreserveHost On
        ProxyPass / http://172.18.0.13:3000/
        ProxyPassReverse / http://172.18.0.13:3000/
        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined


        SSLEngine on

        #   A self-signed (snakeoil) certificate can be created by installing
  
        SSLCertificateFile      /etc/ssl/certs/ssl-cert-snakeoil.pem
        SSLCertificateKeyFile   /etc/ssl/private/ssl-cert-snakeoil.key


        <FilesMatch "\.(?:cgi|shtml|phtml|php)$">
                SSLOptions +StdEnvVars
        </FilesMatch>
        <Directory /usr/lib/cgi-bin>
                SSLOptions +StdEnvVars
        </Directory>
</VirtualHost>



<VirtualHost *:443>
    ServerAdmin webmaster@localhost
    ServerName phylab.cyfamod.com

    # Reverse Proxy Configuration
    ProxyPreserveHost On
    ProxyPass / http://172.18.0.11:3000/
    ProxyPassReverse / http://172.18.0.11:3000/

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    SSLEngine on

    # SSL Certificate Files
    SSLCertificateFile      /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile   /etc/ssl/private/ssl-cert-snakeoil.key

    <FilesMatch "\.(?:cgi|shtml|phtml|php)$">
        SSLOptions +StdEnvVars
    </FilesMatch>

    <Directory /usr/lib/cgi-bin>
        SSLOptions +StdEnvVars
    </Directory>
</VirtualHost>


<VirtualHost *:443>
    ServerAdmin webmaster@localhost
    ServerName eureka.cyfamod.com

    # Reverse Proxy Configuration
    ProxyPreserveHost On
    ProxyPass / http://172.18.0.10:3000/
    ProxyPassReverse / http://172.18.0.10:3000/

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    SSLEngine on

    # SSL Certificate Files
    SSLCertificateFile      /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile   /etc/ssl/private/ssl-cert-snakeoil.key

    <FilesMatch "\.(?:cgi|shtml|phtml|php)$">
        SSLOptions +StdEnvVars
    </FilesMatch>

    <Directory /usr/lib/cgi-bin>
        SSLOptions +StdEnvVars
    </Directory>
</VirtualHost>





<VirtualHost *:443>
    ServerAdmin webmaster@localhost
    ServerName trafull.cyfamod.com

    # Reverse Proxy Configuration
    ProxyPreserveHost On
    ProxyPass / http://172.18.0.14:3000/
    ProxyPassReverse / http://172.18.0.14:3000/

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    SSLEngine on

    # SSL Certificate Files
    SSLCertificateFile      /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile   /etc/ssl/private/ssl-cert-snakeoil.key

    RewriteEngine On
    RewriteCond %{HTTP_HOST} ^172\.18\.0\.14$ [OR]
    RewriteCond %{HTTP_HOST} ^www\.172\.18\.0\.14$
    RewriteRule (.*) https://trafull.cyfamod.com/$1 [R=301,L]


    <FilesMatch "\.(?:cgi|shtml|phtml|php)$">
        SSLOptions +StdEnvVars
    </FilesMatch>

    <Directory /usr/lib/cgi-bin>
        SSLOptions +StdEnvVars
    </Directory>
</VirtualHost>


