NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	cp $DIRLOCALE/main.py ./$NAME.py
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.py .
fi

if [ $1 == "lib" ]; then
	mkdir -p $NAME
	cp $DIRLOCALE/__init__.py $NAME/
fi
