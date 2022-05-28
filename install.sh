#!/usr/bin/env bash
# -*--- Neo Git installer source code ---*- #

clear
echo -e "\033[1mNeo-git version 1.0\033[m"
echo -e "The program will create a folder in /usr/lib/ and add the shell file in /usr/bin/."
echo -e "Estimated space used: 9.5KB\nAre you sure you want to install? [Y/n]"; read cmd
clear

if [ $cmd == 'y' ] || [ $cmd == 'Y' ]; then

	echo -e "The program is installing!\n"
	
	echo -e "Check if the Git is intalled..."
	if [ ! -f /usr/bin/git ]; then
		echo -e "\033[31;1mGit not found\033[m, Please install it..."
		echo -e "\033[34;1mPress return to exit...\033[m"; read
                clear
		exit 1
	fi
	
	if [ ! -d /usr/lib/neo-git/ ]; then
		echo "Creating neo-git folder in /usr/lib/..."
		sudo mkdir /usr/lib/neo-git/
	fi

	echo "Moving languages templates to /usr/lib/neo-git/..."
	sudo cp -rf langs/ /usr/lib/neo-git/

	echo "Moving the executer file to /usr/bin/..."
	sudo cp neo-git.sh /usr/bin/ngit
	
	echo -e "\nThe installing is terminated!"
	echo -e "\033[34;1mPress return to exit...\033[m"; read
	clear
else
	echo "abort!"	
fi
