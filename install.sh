#!/usr/bin/bash

clear
echo "Neo-git version 1.0"
echo "Are you sure you want to install? [Y/n]"; read cmd
clear

if [ $cmd == 'y' ] || [ $cmd == 'Y' ]; then

	echo -e "The program is installing!\n"
	
	if [ ! -f /usr/bin/git ]; then
		echo "Installing git"
		if [ -f /etc/debian_version ]; then
			sudo apt install git -y
		elif [ -f /etc/arch_version ]; then
			sudo pacman -Syy git
		fi
	fi

	echo "Moving the main file to /usr/bin/"
	sudo cp neo-git.sh /usr/bin/ngit
	
	echo -e "\nThe installing is terminated!"
	echo "Press return to exit..."; read

	clear
else
	echo "abort!"	
fi
