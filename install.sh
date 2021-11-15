#!/usr/bin/bash

clear
echo "Neo-git version 1.1"
echo -e "Estimated space used: 2KB\nAre you sure you want to install? [Y/n]"; read cmd
clear

if [ $cmd == 'y' ] || [ $cmd == 'Y' ]; then

	echo -e "The program is installing!\n"
	
	if [ ! -f /usr/bin/git ]; then
		echo -e "\033[31;1mGit not found\033[m, Installing git..."
		if [ -f /etc/debian_version ]; then
			sudo apt install git -y
		elif [ -f /etc/arch-release ]; then
			sudo pacman -Syy git
		elif [ -f /etc/gentoo-release ]; then
			sudo emerge --sync dev-vcs/git
		fi
	fi

	echo "Moving the main file to /usr/bin/"
	sudo cp neo-git.sh /usr/bin/ngit
	
	echo -e "\nThe installing is terminated!"
	echo -e "\033[34;1mPress return to exit...\033[m"; read
	clear
else
	echo "abort!"	
fi
