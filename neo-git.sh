#!/usr/bin/env bash

#--*----------- Neo-git Source Code -----------*--#
#                                                 #
# This code is created to make easier the push    #
# and the commit of Git.			  #
#                                                 #
# Warning: This is the main file, the entire	  #
# plugin works here, the program only copy file   #
# from /usr/lib/neo-git/, so if you fond a error  #
# please report in a github issue		  #
# 						  #
# Created by: Samuel-de-Oliveira                  #
#                                                 #
#--*-------------------------------------------*--#

# Check if git is installed.
if [ ! -f /usr/bin/git ]; then
	echo -e "\n\033[31;1mThe git is not found\033[m, please install it to plugin works correctly"
	exit 1
fi

# Here are all functions who is used in parameters.
repobuild()
{	if [ $# -eq 0 ]; then
		echo -e "\n\033[31mMissing arguments...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	if [ ! -d /usr/lib/neo-git/langs/$2/ ]; then
		echo -e "\n\033[31mLanguage not suported...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	if [ "$2" == "" ]; then
		echo -e "\n\033[31mPlease digit a valid name for tamplate...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi

	# create folder and add files
	mkdir $1
	cd $1
	echo -e "# $1"                                               >> README.md
	echo -e "This is the $1 repository, created by: [Your name]" >> README.md
	echo -e "\n ## How it work\n[Your program info]"             >> README.md
	echo -e "\n## Download\n[Download info]"                     >> README.md
	bash /usr/lib/neo-git/langs/$2/maker.sh dir

	# Start git in repository
	(git init
	git add .
	git commit -m "Ready..."
	git branch -M master) &> /dev/null
}
filebuild()
{	if [ $# -eq 0 ]; then
		echo -e "\n\033[31mMissing arguments...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	if [ ! -d /usr/lib/neo-git/langs/$1/ ]; then
		echo -e "\n\033[31mLanguage not suported...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	if [ "$2" == "" ]; then
		echo -e "\n\033[31mPlease digit a valid name for your file...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi

	bash /usr/lib/neo-git/langs/$1/maker.sh file $2
}
push()
{	
	while true; do
	if [ -d .git/ ]; then
		git add .
		git commit -m $1
		git push
		exit 1
	else
		if [ $PWD == "/" ]; then
			echo -e "\n\033[31mRepoditory git not found, please try in a valid repository!\033[m\n"
			exit 1
		fi
		cd ..
	fi
	done
}
append()
{	if [ $# -eq 0 ]; then
		echo -e "\n\033[31mMissing arguments...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	if [ ! -f $1/maker.sh ]; then
		echo -e "\n\033[31mRepository don't have maker.sh file...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	if [ ! $USER == "root" ]; then
		echo -e "\n\033[31mYou need root to append a template...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	
	cp -rf $1 /usr/lib/neo-git/langs/
}
purge()
{	if [ $# -eq 0 ]; then
		echo -e "\n\033[31mMissing arguments...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	if [ ! $USER == "root" ]; then
		echo -e "\n\033[31mYou need root to append a template...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi

	rm -rf /usr/lib/neo-git/langs/$1
}
halp()
{	echo -e "\nCommand: ngit [--parameter] ...\nThis is the list of parameters from neo-vim:\n"

	echo -e "\t \033[34;1m--create or -C \033[m>>: Create a versioned repository (nvim --create [repository's name] [language template])"
	echo -e "\t \033[34;1m--list or -l \033[m>>: Show the lis of suported languages"
	echo -e "\t \033[34;1m--file or -f \033[m>>: Create a language template (nvim --file [language template] [file name])"
	echo -e "\t \033[34;1m--append or -a \033[m>>: append a template (sudo nvim --append [template folder])"
	echo -e "\t \033[34;1m--purge or -p \033[m>>: remove a template (sudo nvim --purge [template])"
	echo -e "\t \033[34;1m--push or -P \033[m>>: Commit the whole repository and push it (nvim --push [commit name])"
	echo -e "\t \033[34;1m--version or -v \033[m>>: Show version (nvin --version)"
	echo -e "\t \033[34;1m--help or -h \033[m>>: Show the help message (nvim --help).\n"
}
version()
{	echo -e "\nNeoGit version: \033[33;1m1.0\033[m. Have no warranty.\nCreated by: Samuel de Oliviera (github: Samuel-de-Oliveira)\n"
}

# If the user digit nothing more, will show the help message.
if [ $# -eq 0 ]; then
	halp
	exit 1
fi

# Parameters:
case $1 in
	
"--create" | "-C") shift; repobuild $@;;

"--help" | "-h") halp;; # I've created "halp" because the command "help" is reserved.

"--version" | "-v") version;;

"--list" | "-l") ls /usr/lib/neo-git/langs/;;

"--append" | "-a") shift; append $@;;

"--purge" | "-p") shift; purge $@;;

"--file" | "-f") shift; filebuild $@;;

"--push" | "-P") shift; push $*;;

*) echo -e "\n\033[31mUps... Maybe you digit something wrong.\033[m\nDigit \"ngit --help\" for help.\n";;

esac
