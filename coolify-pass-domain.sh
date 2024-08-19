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






<VirtualHost *:443>
    ServerAdmin webmaster@localhost
    ServerName coolify.cyfamod.com

    # Reverse Proxy Configuration
    ProxyPreserveHost On
    ProxyPass / http://15.236.41.228:8000/
    ProxyPassReverse / http://15.236.41.228:8000/

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















traefik.enable=true
traefik.http.middlewares.gzip.compress=true
traefik.http.middlewares.redirect-to-https.redirectscheme.scheme=https
traefik.http.routers.http-0-mskowck.entryPoints=http
traefik.http.routers.http-0-mskowck.middlewares=gzip
traefik.http.routers.http-0-mskowck.rule=Host(`mskowck.15.236.41.228.sslip.io`) && PathPrefix(`/`)
traefik.http.routers.http-0-mskowck.service=http-0-mskowck
traefik.http.services.http-0-mskowck.loadbalancer.server.port=3000
caddy_0.encode=zstd gzip
caddy_0.handle_path.0_reverse_proxy={{upstreams 3000}}
caddy_0.handle_path=/*
caddy_0.header=-Server
caddy_0.try_files={path} /index.html /index.php
caddy_0=http://mskowck.15.236.41.228.sslip.io
caddy_ingress_network=coolify