NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	cp $DIRLOCALE/main.lua ./$NAME
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.lua .
fi

if [ $1 == "lib" ]; then

fi
