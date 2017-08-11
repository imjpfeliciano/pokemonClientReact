#!/bin/bash

#0. LIBS
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -


#1. instalar git
sudo apt-get install -y git

#2. instalar nvm
# sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | sh
# source ~/.profile

# #3. instalar node 6
# nvm install 6
sudo apt-get install -y nodejs

# #4. instalar yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# #5. instalar create-react-native-app
sudo yarn global add create-react-app

# #6. instalar create-react-native-app
sudo yarn global add create-react-native-app

