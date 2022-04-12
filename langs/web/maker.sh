NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	if [ -f $NAME.html ]; then
		echo "The file $NAME.html exist, please remove to proced"
		exit 1
	fi

	cp $DIRLOCALE/index.html ./$NAME.html
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/* .
fi

if [ $1 == "lib" ]; then
	echo -e "\nNo library for this language\n"
fi
