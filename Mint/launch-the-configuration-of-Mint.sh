echo ""
sudo ./config-lm/config-lm.sh
echo ""

if zenity --question --title="Configuration" --text="Do you want to launch the configuration script for CINNAMON (see the documentation) ?"
then
    echo -e "\033[1;32m==========CINNAMON configuration==========\033[0m"
    ./config-lm/cinnamon-customization.sh
    echo ""
    echo -e "\033[1;32m==========Configuration is complete==========\033[0m"
    echo ""
else
        echo "CINNAMON configuration not launched"
fi
	

if zenity --question --title="Reboot" --text="Do you want to reboot now ?"
then
    systemctl reboot
else
    echo "Reboot canceled"
fi
