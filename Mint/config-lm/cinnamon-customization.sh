#! /bin/bash

zenity --question --title="Wallpapers" --text="Do you want additional wallpapers ? (may take a while)"
wallpaper=$?
zenity --question --title="Dynamics wallpapers" --text="Do you want dynamics wallpapers ?"
dynamic_wallpaper=$?

if [ $wallpaper -eq 0 ]
then
    git clone https://github.com/Loanbrwsk1/Wallpapers.git 
    cd Wallpapers
    mv ./wallpapers/ ~/Pictures/
    cd ..
    rm -fr ./Wallpapers/
fi

if [ $dynamic_wallpaper -eq 0 ]
then
    git clone https://github.com/Loanbrwsk1/Dynamic-wallpapers.git
    cd ./Dynamic-wallpapers/
    sudo mv ./Dynamic_Wallpapers/ /usr/share/backgrounds/
    sudo mv ./xml/* /usr/share/cinnamon-background-properties/
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
cd ./config-lm/
cp ./Path ~/.local/share/nemo/scripts/
echo ""

echo -e "\033[1;32m==========CINNAMON customization==========\033[0m"

echo "Desktop cutomization"
echo "Change time format"
gsettings set org.cinnamon.desktop.interface clock-show-seconds "true"
gsettings set org.cinnamon.desktop.interface clock-show-date "true"