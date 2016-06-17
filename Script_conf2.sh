#!/bin/bash

read -p "Quel est votre login d'administration ? :" login #Login d'administrati$
read -p "Quelle est l'adresse de la machine distante ? : " adresse #adresse de $
read -p "Quel est le nom du service ? : " service

scp -r ${login}@${adresse}:/etc/${service} /etc/${adresse}

sudo /etc/init.d/${service} restart

