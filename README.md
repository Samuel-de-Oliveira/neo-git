# neo-git

Neo-Git is a plugin for Git, it creates a git
repository and adds files depending on the
programing language. and this only with a
simple command in termianl.

## install
To install, clone the repository and run the install.sh
file using this commands:

```sh	
git clone https://github.com/Samuel-de-Oliveira/neo-git
cd neo-git
sudo ./install.sh
```
## How to create a template:
Create a repository in /usr/lib/neo-git/langs/ with the
language that you want, after this add files of the language,
after this add a file named `maker.sh` and write this:

```sh
NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	# Here you write the file to copy using "ngit -f"
fi

if [ $1 == "dir" ]; then
	# Here you write the files to copy using "ngit -C"
fi
```
### Example

## How to Use:
To use you just need to write this in terminal: `ngit
[--command] ...`.

If you want to see all parameters list type `ngit --help`

*<strong>Created by:</strong> Samuel de Oliveira 2021*
