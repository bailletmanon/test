#!/bin/bash
echo "Ce script va installer la boxenergie sur votre raspberry."

echo "Début d'installation de Node-Red et Node.js."
yes Y|bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
echo "Fin d'installation de Node-Red et Node.js"

echo "Ajout du flow Node-Red de la boxenergie"
mv package.json ./.node-red
mv flows_raspberrypi.json ./.node-red

echo "Installation des noeuds requis."
cd .node-red
npm install >> /dev/null
cd ..

echo "Activation du lancement automatique de Node-Red au démarrage de votre raspberry." 
sudo systemctl enable nodered.service
