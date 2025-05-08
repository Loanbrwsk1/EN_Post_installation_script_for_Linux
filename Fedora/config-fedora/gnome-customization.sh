#!/bin/bash

zenity --question --title="Wallpapers" --text="Do you want additional wallpapers ?"
wallpaper=$?
zenity --question --title="Dynamics wallpapers" --text="Do you want dynamics wallpapers ?"
dynamic_wallpaper=$?

if [ $wallpaper -eq 0 ]
then
    git clone https://github.com/Loanbrwsk1/Wallpapers.git 
    rm -fr ./Wallpapers/.git/
    mv ./Wallpapers/ ~/Images/
fi

if [ $dynamic_wallpaper -eq 0 ]
then
    git clone https://github.com/Loanbrwsk1/Dynamic-wallpapers.git
    cd ./Dynamic-wallpapers/
    sudo mv ./Dynamic_Wallpapers/ /usr/share/backgrounds/
    sudo mv ./xml/* /usr/share/gnome-background-properties/
    mv ./Screenshots_dynamic_wallpapers/ ~/Images/
    cd ..
    rm -rf ./Dynamic-wallpapers/
fi

echo -e "\033[1;32m==========Copy useful files==========\033[0m"
echo ""
if [[ $(grep -c "fmaj=" ~/.bashrc) -lt 1 ]] ; then
    echo '

alias maj="sudo dnf upgrade -y"
alias install="sudo dnf install -y"
alias remove="sudo dnf remove -y"
alias finstall="flatpak install flathub -y"
alias fremove="flatpak remove -y"
alias fmaj="flatpak update -y"
alias fsearch="flatpak search"' >> ~/.bashrc
fi
cd ./config-fedora/
cp ./Path ~/.local/share/nautilus/scripts/
echo ""

echo -e "\033[1;32m==========General configuration of GNOME==========\033[0m"
echo " - Window buttons"
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
echo " - Over-amplification"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
echo " - Calendar display in the top panel"
gsettings set org.gnome.desktop.calendar show-weekdate true
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

echo "Nautilus configuration"
echo " - Desactivation of the opening of the folder when an element is inserted"
gsettings set org.gnome.nautilus.preferences open-folder-on-dnd-hover false
echo " - Double click activation"
gsettings set org.gnome.nautilus.preferences click-policy 'double'
echo " - Change in sort order"
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true

echo "GNOME Text Editor configuration"
gsettings set org.gnome.TextEditor highlight-current-line false
gsettings set org.gnome.TextEditor show-line-numbers true

echo "Dash-to-Dock activation"

gnome-shell-extension-tool -e dash-to-dock@micxgx.gmail.com