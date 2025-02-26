#!/bin/bash

# Nome do usuário a ser criado
USUARIO="socks"

# Baixa o script socks5.sh
wget -O socks5.sh "https://www.dropbox.com/scl/fi/tdno45ek2qqm2tz76s5rr/socks5.sh?rlkey=ezwpz6iod1z3d36ykdqn6z0ic&st=5besdkxg"

# Concede permissões de execução
chmod 777 socks5.sh

# Executa o script
./socks5.sh

# Cria o usuário com shell nologin
sudo useradd -m -s /usr/sbin/nologin "$USUARIO"

# Define uma senha para o usuário (substitua 'SENHA' pela senha desejada)
echo "$USUARIO:1234" | sudo chpasswd

echo "Usuário $USUARIO criado com sucesso e senha definida."
