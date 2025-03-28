apt update && apt install -y squid apache2-utils


sudo ufw allow 3128
sudo systemctl restart squid
