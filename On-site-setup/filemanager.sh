# file browser
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

# Where:

# -p is the port to listen on
# -a is the IP address to listen on
# -r is the root directory that you’d like to serve. In most cases on Unix, this is /var/www/html/
filebrowser -p 8080 -a 0.0.0.0 -r /var/www/html/ &
# filebrowser -p 8000 -a 0.0.0.0 -r /var/www/html/own &

filebrowser -p 8080 -a 0.0.0.0 -r /var/www/html/ -d /home/ubuntu/filebrowser.db &
filebrowser -p 8082 -a 0.0.0.0 -r /var/www/html/own -d /home/ubuntu/filebrowser1.db &

# login admin / admin

sudo lsof -i :8000