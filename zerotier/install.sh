# install on linux
sudo curl -s https://install.zerotier.com | sudo bash

# check service
systemctl start zerotier-one

# join a network on winows / linux
zerotier-cli join [network-id]
zerotier-cli join 856127940c39fc00

# network directories 
Linux: /var/lib/zerotier-one/networks.d/
macOS: /Library/Application Support/ZeroTier/One/networks.d/
Windows: %LOCALAPPDATA%\ZeroTier\One\networks.d\