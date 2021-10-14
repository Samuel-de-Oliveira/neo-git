#!/usr/bin/env bash

neo-push()
{	git add .
	git commit -m "$1"
	git push
}
halp()
{	echo -e "Command: nvim [--param...] ...\nThis is the list of parameters from neo-vim:\n"

	echo -e "\t--push or -p >>: commit and push the repository in a command (nvim --push '(commit name...)');"
	echo -e "\t--help or -h >>: show the help message."
}
commit()
{	echo "commit!"
}

case $1 in 
	
"--push") neo-push "$2";;
"-p") neo-push "$2";;

"--commit") commit;;
"-c") commit;;

"--help") halp;;
"-h") halp;;

*)echo -e "\nUps... Maybe you digit something wrong.\nDigit --help for help.";;
esac

