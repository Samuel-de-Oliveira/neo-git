NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	cp $DIRLOCALE/main.lua ./$NAME.lua
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.lua .
fi

if [ $1 == "lib" ]; then
	cp $DIRLOCALE/lib.lua ./$NAME.lua
fi
