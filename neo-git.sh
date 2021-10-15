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

	echo -e "\t--push or -p >>: commit and push the repository in a command (nvim --push '(commit name...)');"
	echo -e "\t--commit or -c >>: Just commit the repository in a command (nvim --commit '(commit name...)');"
	echo -e "\t--help or -h >>: show the help message (nvim --help).\n"
}
case $1 in 
	
"--push") push "$2";;
"-p") push "$2";;

"--commit") commit "$2";;
"-c") commit "$2";;

# I have used "halp" because the command "help" is reserved.
"--help") halp;;
"-h") halp;;

*)echo -e "\nUps... Maybe you digit something wrong.\nDigit --help for help.\n";;
esac
