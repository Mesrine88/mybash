#!/bin/bash

# Falls der Ordner /apps erst angelegt werden und das Repo myBash geclont werden muss, die nächsten Zeilen unkommentieren...
# mkdir /apps
# cd /apps
# git clone https://github.com/christitustech/mybash
# git clone https://github.com/Mesrine88/mybash

apt install zip wget dos2unix -y

cd /apps/mybash
dos2unix *

mkdir fonts
cd /apps/mybash/fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/3270.zip
sleep 15
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/CascadiaCode.zip
sleep 15
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/FiraCode.zip
sleep 15
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Inconsolata.zip
sleep 15
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
# apt install zoxide
# echo 'eval"$(zoxide init bash)"' >> ~/.bashrc

chmod +x setup.sh
bash ./setup.sh

source ~/.bashrc
