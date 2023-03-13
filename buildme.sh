c#!/bin/bash

set -e
# Create directory for suckless programs and configs
mkdir -p ~/.local/src
mkdir -p ~/.config/shell
mkdir -p ~/.config/nvim
mkdir -p ~/.config/x11
mkdir -p ~/.config/dunst
mkdir -p ~/.config/zathura


# Update package lists
sudo apt update -yyq  
sudo apt dist-upgrade -yyq
sudo apt full-upgrade -yyq
sudo apt autoremove -yyq

# Install unattended-upgrades and set dpkg to update automatically
sudo apt install unattended-upgrades -yyq && sudo dpkg-reconfigure --priority=low unattended-upgrades

# Install necessary build dependencies
sudo apt install build-essential libx11-dev libxft-dev libxinerama-dev libharfbuzz-dev libxext-dev libxcb1-dev libxcb-res0-dev libxrandr-dev \
  libxfont-dev libjpeg-dev -yyq

# Install Neovim, Vim, Xinit, Picom, Xcompmgr, and Dialog
sudo apt install neovim vim xinit picom xcompmgr dialog xorg nmap rsync os-prober suckless-tools filezilla zathura sxiv calcurse python3.9-full python3-pip calendar nnn lfm dunst xfce4-terminal qterminal xscreensaver xscreensaver-gl xscreensaver-gl-extra gnome-disk-utility gparted xscreensaver-screensaver-bsod ufw fail2ban vlc smplayer chromium-browser lynx neofetch newsboat neomutt -yyq

# Clone all suckless programs into ~/.local/src
cd ~/.local/src
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dmenu
git clone https:/c/git.suckless.org/slock
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
#cd surf && sudo make clean install && cd ..
cd ii && sudo make clean install && cd ..

# Create .xinitrc file
echo "exec dwm" >> ~/.config/x11/xinitrc
# Change permissions on .xinitrc file
chmod +x ~/.config/x11/xinitrc
exit
