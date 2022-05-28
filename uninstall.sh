#!/usr/bin/env bash
# -*--- Neo Git uninstaller source code ---*- #

clear
echo -e "Everything into /usr/lib/neo-git/ will be removed."
echo -e "Are you sure you want to uninstall? [Y/n]"; read cmd
clear

if [ $cmd == 'y' ] || [ $cmd == 'Y' ]; then

	echo -e "The program is uninstalling!\n"
	
	if [ -f /usr/bin/ngit ]; then
              echo -e "Removing executer in /usr/bin/..."
              sudo rm /usr/bin/ngit
        fi

        if [ -d /usr/lib/neo-git/ ]; then
              echo -e "Removing neo-git directory..."
              sudo rm -rf /usr/lib/neo-git/
        fi
	
	echo -e "\nThe uninstalling is terminated!"
	echo -e "\033[34;1mPress return to exit...\033[m"; read
	clear
else
	echo "abort!"	
fi
