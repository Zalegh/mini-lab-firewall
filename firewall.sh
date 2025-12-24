#!/bin/bash
# Script pour configurer un firewall simple avec iptables

# Autoriser localhost
sudo iptables -A INPUT -i lo -j ACCEPT

# Autoriser SSH (port 22)
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Autoriser HTTP et HTTPS
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Autoriser connexions établies
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Bloquer tout le reste
sudo iptables -P INPUT DROP

echo "Firewall configuré !"
sudo iptables -L -v
