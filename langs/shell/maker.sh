NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	if [ -f $NAME.sh ]; then
		echo "The file $NAME.sh exist, please remove to proced"
		exit 1
	fi

	cp $DIRLOCALE/main.sh ./$NAME.sh
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.sh .
fi

if [ $1 == "lib" ]; then
	echo -e "\nNo library for this language\n"
fi
