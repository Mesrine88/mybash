#!/bin/bash

mkdir /apps
cd /apps

apt install zip wget dos2unix -y

# git clone https://github.com/christitustech/mybash
git clone https://github.com/Mesrine88/mybash

cd /apps/mybash
dos2unix *

chmod +x setup.sh
./setup.sh

mkdir fonts
cd /apps/mybash/fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/3270.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/CascadiaCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Inconsolata.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/NerdFontsSymbolsOnly.zip

# entzippen
unzip -o 3270.zip
unzip -o CascadiaCode.zip
unzip -o FiraCode.zip
unzip -o Inconsolata.zip
unzip -o NerdFontsSymbolsOnly.zip

# Aufräumen
rm -rf *.zip
# find /starship/mybash/fonts -maxdepth 1 -type f -name "*.zip" -delete

# Ordner für Schriften erstellen und den gesamten Inhalt des derz. Folders verschieben
mkdir ~/.fonts
mv * ~/.fonts
fc-cache -vf

cd ..
rmdir fonts

# Install Zoxide
apt install zoxide
echo 'eval"$(zoxide init bash)"' >> ~/.bashrc


source ~/.bashrc
