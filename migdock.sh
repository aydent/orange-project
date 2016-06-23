#!/bin/bash

#récup des infos utilisateurs
read -p "Quel est votre login d'administration ? : " login #Login d'administrati$
read -p "Quelle est l'adresse de la machine distante ? : " adresse #adresse de $
read -p "Quel est le chemin du dossier contenant la plateforme ? : " chemin

#récup. du template compose et de la data
sudo scp -r ${login}@${adresse}:${chemin} ${chemin}

#informations user
echo " "
echo " lancement des containers "
echo " "
#récup. des clés et importation
#sudo mkdir /tmp/ssl
#sudo scp -r ${login}@${adresse}:/etc/ssl /tmp/ssl
#sudo cp /tmp/ssl/certs/* /etc/ssl/certs/
#sudo rm -r /tmp/ssl

#pause pour infos utilisateur
sleep 3

#lancement des applis
cd ${chemin}
sudo docker-compose up -d
