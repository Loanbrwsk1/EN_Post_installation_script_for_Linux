#!/bin/bash

zenity --question --title="Wallpapers" --text="Do you want additional wallpapers ? (may take a while)"
wallpaper=$?
zenity --question --title="Dynamics wallpapers" --text="Do you want dynamics wallpapers ?"
dynamic_wallpaper=$?

if [ $wallpaper -eq 0 ]
then
    git clone https://github.com/Loanbrwsk1/Wallpapers.git 
    cd Wallpapers
    mv ./wallpapers/* ~/.local/share/backgrounds/
    cd ..
    rm -fr ./Wallpapers/
fi

if [ $dynamic_wallpaper -eq 0 ]
then
    git clone https://github.com/Loanbrwsk1/Dynamic-wallpapers.git
    cd ./Dynamic-wallpapers/
    sudo mv ./Dynamic_Wallpapers/ /usr/share/backgrounds/
    sudo mv ./xml/* /usr/share/gnome-background-properties/
    mv ./Screenshots_dynamic_wallpapers/ ~/Pictures/
    cd ..
    rm -rf ./Dynamic-wallpapers/
fi

echo -e "\033[1;32m==========Copy useful files==========\033[0m"
if [[ $(grep -c "fmaj=" ~/.bashrc) -lt 1 ]] ; then
	echo '

alias maj="sudo apt update && sudo apt full-upgrade -y"
alias install="sudo apt install -y"
alias remove="sudo apt remove -y"
alias finstall="flatpak install flathub -y"
alias fremove="flatpak remove -y"
alias fmaj="flatpak update -y"
alias fs="flatpak search"' >> ~/.bashrc
fi
cd ./config-zorin/
cp ./Path ~/.local/share/nautilus/scripts/
echo ""

echo -e "\033[1;32m==========Configuration générale de GNOME==========\033[0m"
echo " - Over-amplification"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
echo " - Change date and time format"
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-format "24h"
echo " - Touch Pad settings"
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad click-method "areas"
echo " - Cleaning up temporary files and trash over 30 days"
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy remove-old-trash-files true
gsettings set org.gnome.desktop.privacy old-files-age "30"