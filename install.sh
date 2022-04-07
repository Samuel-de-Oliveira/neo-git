#!/usr/bin/bash

clear
echo "\033[1mNeo-git version 2.0\033[m"
echo -e "Estimated space used: 3KB\nAre you sure you want to install? [Y/n]"; read cmd
clear

if [ $cmd == 'y' ] || [ $cmd == 'Y' ]; then

	echo -e "The program is installing!\n"
	
	echo -e "Check if the Git is intalled..."
	if [ ! -f /usr/bin/git ]; then
		echo -e "\033[31;1mGit not found\033[m, Please install it..."
		echo -e "\033[34;1mPress return to exit...\033[m"; read
		exit 1
	fi

	echo "Moving the main file to /usr/bin/"
	sudo cp neo-git.sh /usr/bin/ngit
	
	echo -e "\nThe installing is terminated!"
	echo -e "\033[34;1mPress return to exit...\033[m"; read
	clear
else
	echo "abort!"	
fi
