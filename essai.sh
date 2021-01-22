#!/bin/bash

yes Y|bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
mv package.json ./.node-red
cd .node-red
npm install
cd ..
sudo systemctl enable nodered.service
node-red demo_v1.json