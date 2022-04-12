# neo-git

Neo git is a plugin/software that work with git. This software creates templates for a determined language with a simple command, perfect for those who uses Vim or VS code. It can auto generate git repositories, script files and libraries. The plugin also can add a template created by you (click [here](#add-template) for a tutorial) and/or remove one if you don't like it.

If you found a bug, a missing programing language or a syntax or ortografic error, the project is open for pull requests and issues, this will help me a lot and I will be so glad!

> :warning: The software is tested only on Linux, if it working on Mac OS please tell me in a issue

## Install

To install, clone the repository and run the install.sh file using this commands:

```sh	
git clone https://github.com/Samuel-de-Oliveira/neo-git
cd neo-git
sudo ./install.sh
```

## Usage

The program has three main parameters: `ngit -f`, `ngit -C` and `ngit -L`.
For examples below, I'll use the C++ language as base for the templates.

**`ngit -f`**: (ngit -f "programing language" "file name") creates a file of a determined language. For example, if you need to create a C++ file named "main.cpp" then run:

```sh
ngit -f cpp main
```

**`ngit -C`**: (ngit -C "Repository's name" "programing language") starts a project repository with git of a determined language. For example, if you need to create a C++ project named "project" then run:

```
ngit -C project cpp
```

**`ngit -L`**: (ngit -L "programing language" "file name") creates a library of a determined language. For example, if you need to create a C++ library named "book.h" then run:

```
ngit -L cpp book
```

> To see all supported languages run `ngit -l`

> To see list of all commands run `ngit -h`

> :warning: If don't have your desired language template already predefined give me a pull request and I'll work on it if possible.

## Add a template:

Create a repository with the language name, after this add files of the language and add a file named `maker.sh` with this script:

```sh
NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	if [ -f $NAME ]; then
		echo -e "File $NAME exist, please remove to proced..."
		exit 1
	fi
	# Here you write the file to copy using "ngit -f"
fi

if [ $1 == "dir" ]; then
	# Here you write the files to copy using "ngit -C"
fi

fi [ $1 == "lib" ]; then
	if [ -f $NAME ]; then
		echo -e "File $NAME exist, please remove to proced..."
		exit 1
	fi
	# here you write the files to copy using "ngit -L"
fi
```

> ℹ️ Note: is recommeded to known about shell scripts handling to manage templates creation.

Then, after configure your template, run (with root) `ngit -a (directory)` and it will be added to the application.

Finally, to check if it was added run `ngit -l` and to remove run `ngit -p (language name)`.

*<strong>Created by:</strong> Samuel de Oliveira 2022*
