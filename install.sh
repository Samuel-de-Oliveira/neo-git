#!/usr/bin/bash

clear
echo "Are you sure you want to install? [Y/n]"; read cmd
clear

if [ $cmd == 'y' ] || [ $cmd == 'Y' ]; then

	echo -e "The program is installing!\n"

	echo "Moving the main file to /usr/bin/"
	sudo cp ngit.sh /usr/bin/ngit
	
	echo -e "\nThe installing is terminated!"
	echo "Press return to exit..."; read
	clear
else
	echo "abort!"	
fi
