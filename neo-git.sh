#!/usr/bin/env bash

#--*---------- Neo-git Source Code ----------*--#
# 						#
# This code is created to make easier the push  #
# and the commit of Git.			#
#                                               #
# Warning: This code is only tested for Github  #
# platform if this not work in outher else you  #
# can make a issues ou fix by yourself.         #
# 						#
# Created by Samuel-de-Oliveira (Only for make  #
# his life more easier) 			#
#						#
#--*-----------------------------------------*--#

# Here are all functions who is used in parameters.
push()
{	if [ $# -eq 0 ]; then
		echo -e "\n\033[31mMissing arguments...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	git add .
	git commit -m "$1"
	git push
}
commit()
{	if [ $# -eq 0 ]; then
		echo -e "\n\033[31mMissing arguments...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	git add .
	git commit -m "$1"
}
create()
{	if [ $# -eq 0 ]; then
		echo -e "\n\033[31mMissing arguments...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	
}
halp()
{	echo -e "\nCommand: nvim [--parameter] ...\nThis is the list of parameters from neo-vim:\n"

	echo -e "\t \033[34;1m--push or -p \033[m>>: Commit and push the repository in a command (nvim --push '(commit name...)');"
	echo -e "\t \033[34;1m--commit or -c \033[m>>: Just commit the repository in a command (nvim --commit '(commit name...)');"
	echo -e "\t \033[34;1m--help or -h \033[m>>: Show the help message (nvim --help).\n"
}
version()
{	echo -e "\nNeoGit version: \033[33;1m1.1\033[m\nhave no warranty.\n"
}

# If the user digit nothing more, will show the help message.
if [ $# -eq 0 ]; then
	halp
	exit 1
fi

# Parameters:
case $1 in
	
"--push" | "-p") shift; push $*;;

"--commit" | "-c") shift; commit $*;;

"--help" | "-h") halp;; # I've created "halp" because the command "help" is reserved.

"--version" | "-v") version;;

"--create" | "-C") shift; create $*;;

*) echo -e "\n\033[31mUps... Maybe you digit something wrong.\033[m\nDigit \"ngit --help\" for help.\n";;

esac
