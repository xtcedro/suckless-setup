#!/bin/bash

set -e
# Create directory for suckless programs
mkdir -p ~/.local/src

# Update package lists
sudo apt update -yyq  
sudo apt dist-upgrade -yyq
sudo apt full-upgrade -yyq


# Install necessary build dependencies
sudo apt-get install -y build-essential libx11-dev libxft-dev libxinerama-dev libharfbuzz-dev libxext-dev libxcb1-dev libxcb-res0-dev

# Install Neovim, Vim, Xinit, Picom, Xcompmgr, and Dialog
sudo apt install -y neovim vim xinit picom xcompmgr dialog xorg ufw fail2ban vlc smplayer chromium-browser lynx neofetch newsboat neomutt -yyq

# Clone all suckless programs into ~/.local/src
cd ~/.local/src
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/slock

# Compile each program
cd dwm && sudo make clean install && cd ..
cd st && sudo make clean install && cd ..
cd dmenu && sudo make clean install && cd ..
cd slock && sudo make clean install && cd ..

# Create .xinitrc file
echo "exec dwm" > ~/.xinitrc

# Change permissions on .xinitrc file
chmod +x ~/.xinitrc
exit
