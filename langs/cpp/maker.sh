NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	cp $DIRLOCALE/main.cpp ./$NAME
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.cpp .
	cp $DIRLOCALE/makefile .
fi

if [ $1 == "lib" ]; then
	mkdir $NAME
	cp $DIRLOCALE/main.hpp $NAME
fi
