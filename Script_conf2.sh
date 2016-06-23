#!/bin/bash

read -p "Quel est votre login d'administration ? :" login #Login d'administrati$
read -p "Quelle est l'adresse de la machine distante ? : " adresse #adresse de $
read -p "Quel est le nom du service ? : " service

sudo scp -r ${login}@${adresse}:/etc/${service} /etc/${adresse}
sudo mkdir /tmp/ssl
sudo scp -r ${login}@${adresse}:/etc/ssl /tmp/ssl
sudo cp /tmp/ssl/certs/* /etc/ssl/certs/
sudo rm -r /tmp/ssl
sudo /etc/init.d/${service} restart
