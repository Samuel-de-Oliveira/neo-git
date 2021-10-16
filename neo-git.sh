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

push()
{	git add .
	git commit -m "$1"
	git push
}
commit()
{	git add .
	git commit -m "$1"
}
halp()
{	echo -e "\nCommand: nvim [--parameter] ...\nThis is the list of parameters from neo-vim:\n"

	echo -e "\t \033[34;1m--push or -p \033[m>>: commit and push the repository in a command (nvim --push '(commit name...)');"
	echo -e "\t \033[34;1m--commit or -c \033[m>>: Just commit the repository in a command (nvim --commit '(commit name...)');"
	echo -e "\t \033[34;1m--help or -h \033[m>>: show the help message (nvim --help).\n"
}
case $1 in 
	
"--push") push "$2";;
"-p") push "$2";;

"--commit") commit "$2";;
"-c") commit "$2";;

# I have used "halp" because the command "help" is reserved.
"--help") halp;;
"-h") halp;;

*)echo -e "\n\033[31mUps... Maybe you digit something wrong.\033[m\nDigit --help for help.\n";;
esac
