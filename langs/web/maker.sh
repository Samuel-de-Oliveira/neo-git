NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	cp $DIRLOCALE/index.html ./$NAME.html
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/* .
fi

if [ $1 == "lib" ]; then
	echo -e "\nNo library for this language\n"
fi
