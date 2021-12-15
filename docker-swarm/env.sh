#!/bin/bash
 
echo "Enter environments for traefik and portainer"
read -p "EMAIL: " email
read -p "WILD_DOMAIN: " wild_domain
read -p "USERNAME: " username
read -p -s "PASSWORD: " password

export EMAIL=$email
export WILD_DOMAIN=$wild_domain
export USERNAME=$username
export PASSWORD=$password
export HASHED_PASSWORD=$(openssl passwd -apr1 $PASSWORD)
export TRAEFIK_REPLICAS=1

echo "Environments successfully set!"
