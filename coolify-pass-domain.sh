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







/traefik # cd dynamic/
/traefik/dynamic # ls
Caddyfile                subdomain-routing.yml
/traefik/dynamic # cat subdomain-routing.yml
http:
  routers:
    my-subdomain-router:
      rule: "Host(`ipala.cyfamod.com`)"
      entryPoints:
        - http
        - https
      service: my-service
      tls:
        certResolver: letsencrypt
  services:
    my-service:
      loadBalancer:
        servers:
          - url: "http://es8sw40.15.236.41.228.sslip.io"
/traefik/dynamic # 



Caddyfile                subdomain-routing.yml
/traefik/dynamic # cat subdomain-routing.yml
http:
  routers:
    my-subdomain-router:
      rule: "Host(`ipala.cyfamod.com`)"
      entryPoints:
        - http
        - https
      service: my-service
      tls:
        certResolver: letsencrypt
  services:
    my-service:
      loadBalancer:
        servers:
          - url: "http://es8sw40.15.236.41.228.sslip.io"
/traefik/dynamic # cd ..
/traefik # ls
acme.json           docker-compose.yml  dynamic
/traefik # cat docker-compose.yml 
version: '3.8'
networks:
  coolify:
    external: true
services:
  traefik:
    container_name: coolify-proxy
    image: 'traefik:v2.11'
    restart: unless-stopped
    extra_hosts:
      - 'host.docker.internal:host-gateway'
    networks:
      - coolify
    ports:
      - '80:80'
      - '443:443'
      - '8080:8080'
    healthcheck:
      test: 'wget -qO- http://localhost:80/ping || exit 1'
      interval: 4s
      timeout: 2s
      retries: 5
    volumes:
      - '/var/run/docker.sock:/var/run/docker.sock:ro'
      - '/data/coolify/proxy:/traefik'
    command:
      - '--ping=true'
      - '--ping.entrypoint=http'
      - '--api.dashboard=true'
      - '--api.insecure=false'
      - '--entrypoints.http.address=:80'
      - '--entrypoints.https.address=:443'
      - '--entrypoints.http.http.encodequerysemicolons=true'
      - '--entryPoints.http.http2.maxConcurrentStreams=50'
      - '--entrypoints.https.http.encodequerysemicolons=true'
      - '--entryPoints.https.http2.maxConcurrentStreams=50'
      - '--providers.docker.exposedbydefault=false'
      - '--providers.file.directory=/traefik/dynamic/'
      - '--providers.file.watch=true'
      - '--certificatesresolvers.letsencrypt.acme.httpchallenge=true'
      - '--certificatesresolvers.letsencrypt.acme.storage=/traefik/acme.json'
      - '--certificatesresolvers.letsencrypt.acme.httpchallenge.entrypoint=http'
      - '--providers.docker=true'
      - '--providers.file.directory=/traefik/dynamic/'
      - '--providers.file.watch=true'

    labels:
      - traefik.enable=true
      - traefik.http.routers.traefik.entrypoints=http
      - traefik.http.routers.traefik.service=api@internal
      - traefik.http.services.traefik.loadbalancer.server.port=8080
      - coolify.managed=true/traefik # 