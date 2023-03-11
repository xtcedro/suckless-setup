#!/bin/bash

set -e
# Create directory for suckless programs
mkdir -p ~/.local/src

# Update package lists
sudo apt update -yyq  
sudo apt dist-upgrade -yyq
sudo apt full-upgrade -yyq
sudo apt autoremove -yyq

# Install unattended-upgrades and set dpkg to update automatically
sudo apt install unattended-upgrades -yyq && sudo dpkg-reconfigure --priority=low unattended-upgrades

# Install necessary build dependencies
sudo apt-get install -yyq build-essential libx11-dev libxft-dev libxinerama-dev libharfbuzz-dev libxext-dev libxcb1-dev libxcb-res0-dev

# Install Neovim, Vim, Xinit, Picom, Xcompmgr, and Dialog
sudo apt install -yyq neovim vim xinit picom xcompmgr dialog xorg ufw fail2ban vlc smplayer chromium-browser lynx neofetch newsboat neomutt -yyq

# Clone all suckless programs into ~/.local/src
cd ~/.local/src
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/slock
git clone https://git.suckless.org/slstatus
git clone https://git.suckless.org/sent
git clone https://git.suckless.org/tabbed
git clone https://git.suckless.org/sic
git clone https://git.suckless.org/surf
git clone https://git.suckless.org/ii

# Compile each program
cd dwm && sudo make clean install && cd ..
cd st && sudo make clean install && cd ..
cd dmenu && sudo make clean install && cd ..
cd slock && sudo make clean install && cd ..
cd slstatus && sudo make clean install && cd ..
cd sent && sudo make clean install && cd ..
cd tabbed && sudo make clean install && cd ..
cd sic && sudo make clean install && cd ..
cd surf && sudo make clean install && cd ..
cd ii && sudo make clean install && cd ..

# Create .xinitrc file

echo "exec dwm" > ~/.xinitrc

# Change permissions on .xinitrc file
chmod +x ~/.xinitrc
exit
