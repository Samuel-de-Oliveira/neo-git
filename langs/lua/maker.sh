NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	if [ -f $NAME.lua ]; then
		echo "The file $NAME.lua exist, please remove to proced"
		exit 1
	fi

	cp $DIRLOCALE/main.lua ./$NAME.lua
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.lua .
fi

if [ $1 == "lib" ]; then
	if [ -f $NAME.lua ]; then
		echo "The file $NAME.lua exist, please remove to proced"
		exit 1
	fi

	cp $DIRLOCALE/lib.lua ./$NAME.lua
fi
