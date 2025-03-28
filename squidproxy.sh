apt update && apt install -y squid apache2-utils
rm /etc/squid/squid.conf
wget https://raw.githubusercontent.com/rodrigo12xd/proxy-socks5/refs/heads/master/squid.conf
mv squid.conf /etc/squid/squid.conf

sudo ufw allow 3128
sudo systemctl restart squid
