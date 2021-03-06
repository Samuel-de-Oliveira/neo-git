#!/usr/bin/env bash

#--*------------- Neo-git Source Code -------------*--#
#                                                     #
# This code is created to make easier the push        #
# and the commit of Git.			      #
#                                                     #
# Warning: This is the main file, the entire plugin   #
# works here, the program only verify the files from  #
# /usr/lib/neo-git/, so if you fond a error please    #
# report in a github issue. To see all commands type  #
# "ngit --help" and if you want to learn to how use   #
# plugin check the github repository:		      #
# https://github.com/Samuel-de-Oliveira/neo-git	      #
# 						      #
# Created by: Samuel-de-Oliveira                      #
# Thanks to contribuitors: None			      #
# Version: 1.0.1                                      #
# This software have no warranty		      #
#                                                     #
#--*-----------------------------------------------*--#

#--*----------- Suported languages templates -----------*--#
#                                                          #
# Suported languages: C, C++, Dart, Go, Java, Lua, Nodejs, #
# PHP, Python, Shell script, Web template (HTML, CSS,      #
# Javascript).                                             #
#                                                          #
#--*----------------------------------------------------*--#

# Check if git is installed.
if [ ! -f /usr/bin/git ]; then
	echo -e "\n\033[31;1mThe Git is not found\033[m, please install it to plugin works correctly\n"
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
	if [ -d $1 ]; then
		echo -e "\n\033[31m$2 directory exist, please remove to proced...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi

	# create folder and add files
	mkdir $1
	cd $1
	echo -e "# $1"                                           >> README.md
        echo -e "Project writed with $2 language"                >> README.md
	echo -e "$1 repository, created by: <!-- Your name -->"  >> README.md
	echo -e "\n ## How it work\n<!-- Your program info. -->" >> README.md
	echo -e "\n## Download\n<!-- Download info. -->"         >> README.md

        touch .gitignore .

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
	
	# Create files
	bash /usr/lib/neo-git/langs/$1/maker.sh file $2
}
libbuild()
{	if [ $# -eq 0 ]; then
		echo -e "\n\033[31mMissing arguments...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	if [ ! -d /usr/lib/neo-git/langs/$1/ ]; then
		echo -e "\n\033[31mLanguage not suported...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	if [ "$2" == "" ]; then
		echo -e "\n\033[31mPlease digit a valid name to create your library...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
	
	# create library
	bash /usr/lib/neo-git/langs/$1/maker.sh lib $2
}
push()
{	while true; do
	if [ -d .git/ ]; then
		git add .
		git commit -m "$1" &> /dev/null
		git push
		exit 1
	else
		if [ $PWD == "/" ]; then
			echo -e "\n\033[31mThis repository doesn't have Git, please try in a valid repository!\033[m\n"
			exit 1
		fi
		cd ..
	fi
	done
}
editrepo()
{       if [ $# -eq 0 ]; then
		echo -e "\n\033[31mMissing arguments...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
        if [ ! -d /usr/lib/neo-git/langs/$1/ ]
                echo -e "\n\033[mThe repository $1 doesn't exist...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
        fi

        cp -rf /usr/lib/neo-git/langs/$1/ .
}
append()
{	if [ $# -eq 0 ]; then
		echo -e "\n\033[31mMissing arguments...\033[m\nDigit \"ngit --help\" for help\n"
		exit 1
	fi
        if [ ! -d $1 ]; then
                echo -e "\n\033[31mThis directory doesn't exist...\033[m\nDigit \"ngit --help\" for help\n"
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

	echo -e "\t \033[34;1m--create or -C \033[m>>: Create a versioned repository (ngit --create [repository's name] [language template]);"
	echo -e "\t \033[34;1m--list or -l \033[m>>: Show the list of all suported languages (ngit --list);"
	echo -e "\t \033[34;1m--file or -f \033[m>>: Create a language template (ngit --file [language template] [file name]);"
	echo -e "\t \033[34;1m--append or -a \033[m>>: append a template (sudo ngit --append [template folder]);"
	echo -e "\t \033[34;1m--purge or -p \033[m>>: remove a template (sudo ngit --purge [template]);"
	echo -e "\t \033[34;1m--push or -P \033[m>>: Commit the whole repository and push it (ngit --push [commit name]);"
        echo -e "\t \033[34;1m--edit or -E \033[m>>: Copy a template for editing (ngit --edit [template name]);"
	echo -e "\t \033[34;1m--version or -v \033[m>>: Show version (ngit --version);"
	echo -e "\t \033[34;1m--help or -h \033[m>>: Show the help message (ngit --help).\n"
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

"--push" | "-P") shift; push "$*";;

"--library" | "-L") shift; libbuild $*;;

"--edit" | "-E") shift; editrepo $*;;

*) echo -e "\n\033[31mUps... Maybe you digit something wrong.\033[m\nDigit \"ngit --help\" for help.\n";;

esac
