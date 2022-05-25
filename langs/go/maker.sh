NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	if [ -f $NAME.go ]; then
		echo -e "File $NAME.go exist, please remove to proced..."
		exit 1
	fi
	cp $DIRLOCALE/main.go .
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.go .
	cp $DIRLOCALE/makefile .
fi

if [ $1 == "lib" ]; then
	if [ -f $NAME ]; then
		echo -e "File $NAME exist, please remove to proced..."
		exit 1
	fi
	echo "This language not have libraries template yet."
fi
