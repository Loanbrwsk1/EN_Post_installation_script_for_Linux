echo ""
sudo ./config-ubuntu/config-ubuntu.sh
echo ""

if zenity --question --title="Configuration" --text="Do you want to launch the customization script (see the documentation) ?"
then
	echo -e "\033[1;32m==========GNOME configuration==========\033[0m"
    ./config-ubuntu/gnome-customization.sh
    echo ""
    echo -e "\033[1;32m==========Configuration is complete==========\033[0m"
    echo ""
else
        echo "GNOME configuration not launched"
fi
	

if zenity --question --title="Reboot" --text="Do you want to reboot now ?"
then
    systemctl reboot
else
    echo "Reboot canceled"
fi
