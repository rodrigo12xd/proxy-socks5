#!/bin/bash

# Nome do usuário a ser criado
USUARIO="socks"
SENHA="1234"
echo "Atualizando pacotes..."
apt update -y >/dev/null 2>&1
echo "Instalando dante server..."
apt install dante-server -y >/dev/null 2>&1
cd /etc
rm danted.conf >/dev/null 2>&1
wget -O danted.conf https://raw.githubusercontent.com/rodrigo12xd/proxy-socks5/refs/heads/master/danted.conf >/dev/null 2>&1
chmod 777 danted.conf >/dev/null 2>&1
cd /root
systemctl restart danted >/dev/null 2>&1
echo "Criando usuario $USUARIO:$SENHA"
# Cria o usuário com shell nologin
sudo useradd -m -s /usr/sbin/nologin "$USUARIO" >/dev/null 2>&1
# Define uma senha para o usuário (substitua 'SENHA' pela senha desejada)
echo "$USUARIO:$SENHA" | sudo chpasswd >/dev/null 2>&1
echo "Usuário $USUARIO criado com sucesso e senha definida."

IP_PUBLICO=$(curl -s https://checkip.amazonaws.com)
echo "$IP_PUBLICO:5555:$USUARIO:$SENHA"
