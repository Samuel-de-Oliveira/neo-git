#!/usr/bin/env bash

push()
{	git add .
	git commit -m "$1"
	git push
}
halp()
{	echo -e "Command: nvim [--param...] ...\nThis is the list of parameters from neo-vim:\n"

	echo -e "\t--push or -p >>: commit and push the repository in a command (nvim --push '(commit name...)');"
	echo -e "\t--commit or -c >>: Just commit the repository in a command (nvim --commit '(commit name...)');"
	echo -e "\t--help or -h >>: show the help message."
}
commit()
{	git add .
	git commit -m "$1"
}

case $1 in 
	
"--push") push "$2";;
"-p") push "$2";;

"--commit") commit "$2";;
"-c") commit "$2";;

"--help") halp;;
"-h") halp;;

*)echo -e "\nUps... Maybe you digit something wrong.\nDigit --help for help.";;
esac
