Install the Certbot tool: Certbot is a popular tool that can automate the process of obtaining and installing SSL certificates from Let's Encrypt. You can install Certbot using the following command:


#sudo apt-get install certbot python3-certbot-apache -y
sudo apt install python3-certbot-nginx

sudo apt-get update
sudo apt-get install certbot


Obtain an SSL certificate: Once you have Certbot installed, you can use it to obtain an SSL certificate for your domain. The following command will obtain a certificate for your domain using the Apache plugin:


#sudo certbot --apache -d mebany.com
#sudo certbot --nginx -d easelowmarket.com


Set up automatic renewal: SSL certificates issued by Let's Encrypt are valid for 90 days. To ensure that your certificate remains valid, you should set up automatic renewal. Certbot can handle this for you by creating a cron job that runs twice daily to check if your certificate is due for renewal. To set up automatic renewal, run the following command:


#sudo certbot renew --dry-run


incase

#sudo certbot certonly --force-renewal --cert-name easelow.com
#sudo certbot renew --force-renewal


log location
sudo cd /var/log/letsencrypt/letsencrypt.log


To generate a multi domain purpose cert
# openssl genrsa -out private.key 2048
# openssl req -new -key private.key -out csr.csr


location of the files

Apache HTTP Server:

SSL certificate file: /etc/ssl/certs/your_certificate.crt
Private key file: /etc/ssl/private/your_private_key.key

Nginx:

SSL certificate file: /etc/nginx/ssl/your_certificate.crt
Private key file: /etc/nginx/ssl/your_private_key.key