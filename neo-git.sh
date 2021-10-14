#!/usr/bin/env bash

neo-push()
{	git add .
	git commit -m "$1"
	git push
}

case $1 in 
	
	"--push") neo-push "$2";;
	"-p") neo-push "$2";;

"create")
	echo "creating directory..."
	mkdir $2
	cd $2
	echo "Generated by NeoGit" >> README.md
	git init
	git add .
	git branch -M main
	git remote add origin "$3"
	git commit -m "Creation commit"
	git push -u origin main
	;;

*)
	echo -e "\nUps... Maybe you digit something wrong.\nDigit --help for help."
	;;
esac

