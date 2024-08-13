1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: ens5: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP group default qlen 1000
    link/ether 06:a6:fb:95:b2:63 brd ff:ff:ff:ff:ff:ff
    inet 172.31.12.94/20 metric 100 brd 172.31.15.255 scope global dynamic ens5
       valid_lft 3587sec preferred_lft 3587sec
    inet6 fe80::4a6:fbff:fe95:b263/64 scope link 
       valid_lft forever preferred_lft forever
3: br-458f39564428: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:56:7b:0a:0d brd ff:ff:ff:ff:ff:ff
    inet 172.19.0.1/16 brd 172.19.255.255 scope global br-458f39564428
       valid_lft forever preferred_lft forever
    inet6 fe80::42:56ff:fe7b:a0d/64 scope link 
       valid_lft forever preferred_lft forever
4: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:89:a4:b2:a7 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:89ff:fea4:b2a7/64 scope link 
       valid_lft forever preferred_lft forever
5: br-f350675cbb8b: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:0a:df:d0:8f brd ff:ff:ff:ff:ff:ff
    inet 172.18.0.1/16 brd 172.18.255.255 scope global br-f350675cbb8b
       valid_lft forever preferred_lft forever
    inet6 fe80::42:aff:fedf:d08f/64 scope link 
       valid_lft forever preferred_lft forever
7: veth7bf325f@if6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether 2e:29:94:60:6e:c6 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::2c29:94ff:fe60:6ec6/64 scope link 
       valid_lft forever preferred_lft forever
9: vethdce7dce@if8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-458f39564428 state UP group default 
    link/ether 8e:58:26:c1:74:f4 brd ff:ff:ff:ff:ff:ff link-netnsid 11
    inet6 fe80::8c58:26ff:fec1:74f4/64 scope link 
       valid_lft forever preferred_lft forever
11: vethde27207@if10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
    link/ether 06:53:15:9e:69:ab brd ff:ff:ff:ff:ff:ff link-netnsid 3
    inet6 fe80::453:15ff:fe9e:69ab/64 scope link 
       valid_lft forever preferred_lft forever
13: veth749be0c@if12: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-458f39564428 state UP group default 
    link/ether ae:3e:33:26:74:2d brd ff:ff:ff:ff:ff:ff link-netnsid 4
    inet6 fe80::ac3e:33ff:fe26:742d/64 scope link 
       valid_lft forever preferred_lft forever
15: veth937460a@if14: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether 26:07:df:fc:ab:44 brd ff:ff:ff:ff:ff:ff link-netnsid 1
    inet6 fe80::2407:dfff:fefc:ab44/64 scope link 
       valid_lft forever preferred_lft forever
21: veth9d157b3@if20: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether aa:cb:f2:42:d5:30 brd ff:ff:ff:ff:ff:ff link-netnsid 5
    inet6 fe80::a8cb:f2ff:fe42:d530/64 scope link 
       valid_lft forever preferred_lft forever
23: vethc162da4@if22: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether 26:7a:f3:0f:11:c7 brd ff:ff:ff:ff:ff:ff link-netnsid 6
    inet6 fe80::247a:f3ff:fe0f:11c7/64 scope link 
       valid_lft forever preferred_lft forever
25: vethc37e2d0@if24: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether 5e:fc:8a:37:aa:e5 brd ff:ff:ff:ff:ff:ff link-netnsid 2
    inet6 fe80::5cfc:8aff:fe37:aae5/64 scope link 
       valid_lft forever preferred_lft forever
27: vethae675bf@if26: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether fa:d2:94:44:0a:46 brd ff:ff:ff:ff:ff:ff link-netnsid 10
    inet6 fe80::f8d2:94ff:fe44:a46/64 scope link 
       valid_lft forever preferred_lft forever
29: veth1af34d5@if28: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether 36:1f:50:f7:2c:e8 brd ff:ff:ff:ff:ff:ff link-netnsid 9
    inet6 fe80::341f:50ff:fef7:2ce8/64 scope link 
       valid_lft forever preferred_lft forever
31: vethfe1fb88@if30: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether 02:b7:75:c4:7a:62 brd ff:ff:ff:ff:ff:ff link-netnsid 11
    inet6 fe80::b7:75ff:fec4:7a62/64 scope link 
       valid_lft forever preferred_lft forever
317: veth334cd7d@if316: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether b6:fe:d6:1d:aa:a1 brd ff:ff:ff:ff:ff:ff link-netnsid 18
    inet6 fe80::b4fe:d6ff:fe1d:aaa1/64 scope link 
       valid_lft forever preferred_lft forever
149: veth6f5804c@if148: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether 16:04:6f:5d:88:ca brd ff:ff:ff:ff:ff:ff link-netnsid 7
    inet6 fe80::1404:6fff:fe5d:88ca/64 scope link 
       valid_lft forever preferred_lft forever
151: veth54ca594@if150: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether ba:ae:2c:96:2e:99 brd ff:ff:ff:ff:ff:ff link-netnsid 8
    inet6 fe80::b8ae:2cff:fe96:2e99/64 scope link 
       valid_lft forever preferred_lft forever
161: veth6a758f6@if160: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether c6:87:35:aa:20:c3 brd ff:ff:ff:ff:ff:ff link-netnsid 12
    inet6 fe80::c487:35ff:feaa:20c3/64 scope link 
       valid_lft forever preferred_lft forever
163: veth7eb6e12@if162: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether 0a:89:ad:1e:e4:b6 brd ff:ff:ff:ff:ff:ff link-netnsid 14
    inet6 fe80::889:adff:fe1e:e4b6/64 scope link 
       valid_lft forever preferred_lft forever
201: vethcac1117@if200: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether 42:46:ba:1f:28:67 brd ff:ff:ff:ff:ff:ff link-netnsid 16
    inet6 fe80::4046:baff:fe1f:2867/64 scope link 
       valid_lft forever preferred_lft forever
249: vethc94286c@if248: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether 0e:ed:ec:e2:b7:c6 brd ff:ff:ff:ff:ff:ff link-netnsid 15
    inet6 fe80::ced:ecff:fee2:b7c6/64 scope link 
       valid_lft forever preferred_lft forever
255: veth91c0f75@if254: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f350675cbb8b state UP group default 
    link/ether 52:0c:2a:db:35:44 brd ff:ff:ff:ff:ff:ff link-netnsid 13
    inet6 fe80::500c:2aff:fedb:3544/64 scope link 
       valid_lft forever preferred_lft forever


root@ip-172-31-12-94:/home/ubuntu# docker network ls

NETWORK ID     NAME      DRIVER    SCOPE
e120ff957dd3   bridge    bridge    local
f350675cbb8b   coolify   bridge    local
11d2637ba863   host      host      local
458f39564428   m48w0c0   bridge    local
02522b084bd4   none      null      local




root@ip-172-31-12-94:/home/ubuntu# bridge link
7: veth7bf325f@if6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
9: vethdce7dce@if8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-458f39564428 state forwarding priority 32 cost 2 
11: vethde27207@if10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master docker0 state forwarding priority 32 cost 2 
13: veth749be0c@if12: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-458f39564428 state forwarding priority 32 cost 2 
15: veth937460a@if14: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
21: veth9d157b3@if20: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
23: vethc162da4@if22: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
25: vethc37e2d0@if24: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
27: vethae675bf@if26: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
29: veth1af34d5@if28: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
31: vethfe1fb88@if30: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
149: veth6f5804c@if148: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
151: veth54ca594@if150: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
161: veth6a758f6@if160: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
163: veth7eb6e12@if162: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
201: vethcac1117@if200: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
249: vethc94286c@if248: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
255: veth91c0f75@if254: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 
317: veth334cd7d@if316: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master br-f350675cbb8b state forwarding priority 32 cost 2 




















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










<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName phylab.cyfamod.com

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

      - traefik.http.routers.myapp.rule=Host(`phylab.cyfamod.com`)
      - traefik.http.routers.myapp.entrypoints=https
      - traefik.http.routers.myapp.tls.certresolver=letsencrypt
      - traefik.http.routers.myapp.service=myapp-service
      - traefik.http.services.myapp-service.loadbalancer.server.port=3000 # Replace with your actual service port

      - coolify.managed=true 










      traefik.enable=true
      traefik.http.middlewares.gzip.compress=true
      traefik.http.middlewares.redirect-to-https.redirectscheme.scheme=https
      traefik.http.routers.http-0-mskowck.entryPoints=http
      traefik.http.routers.http-0-mskowck.middlewares=redirect-to-https
      traefik.http.routers.http-0-mskowck.rule=Host(`mskowck.15.236.41.228.sslip.io`) && PathPrefix(`/`)
      traefik.http.routers.http-0-mskowck.service=http-0-mskowck
      traefik.http.routers.https-0-mskowck.entryPoints=https
      traefik.http.routers.https-0-mskowck.middlewares=gzip
      traefik.http.routers.https-0-mskowck.rule=Host(`mskowck.15.236.41.228.sslip.io`) && PathPrefix(`/`)
      traefik.http.routers.https-0-mskowck.service=https-0-mskowck
      traefik.http.routers.https-0-mskowck.tls.certresolver=letsencrypt
      traefik.http.routers.https-0-mskowck.tls=true
      traefik.http.services.http-0-mskowck.loadbalancer.server.port=3000
      traefik.http.services.https-0-mskowck.loadbalancer.server.port=3000
      caddy_0.encode=zstd gzip
      caddy_0.handle_path.0_reverse_proxy={{upstreams 3000}}
      caddy_0.handle_path=/*
      caddy_0.header=-Server
      caddy_0.try_files={path} /index.html /index.php
      caddy_0=https://mskowck.15.236.41.228.sslip.io
      caddy_ingress_network=coolify






      labels:
  traefik.enable=true
  traefik.http.middlewares.gzip.compress=true
  traefik.http.middlewares.redirect-to-https.redirectscheme.scheme=https
  traefik.http.routers.http-myapp.entryPoints=http
  traefik.http.routers.http-myapp.middlewares=redirect-to-https
  traefik.http.routers.http-myapp.rule=Host(`phylab.cyfamod.com`) && PathPrefix(`/`)
  traefik.http.routers.http-myapp.service=http-myapp
  traefik.http.routers.https-myapp.entryPoints=https
  traefik.http.routers.https-myapp.middlewares=gzip
  traefik.http.routers.https-myapp.rule=Host(`phylab.cyfamod.com`) && PathPrefix(`/`)
  traefik.http.routers.https-myapp.tls.certresolver=letsencrypt
  traefik.http.routers.https-myapp.tls=true
  traefik.http.services.http-myapp.loadbalancer.server.port=3000
  traefik.http.services.https-myapp.loadbalancer.server.port=3000
  caddy_0.encode=zstd gzip
  caddy_0.handle_path.0_reverse_proxy={{upstreams 3000}}
  caddy_0.handle_path=/*
  caddy_0.header=-Server
  caddy_0.try_files={path} /index.html /index.php
  caddy_0=https://phylab.cyfamod.com
  caddy_ingress_network=coolify

