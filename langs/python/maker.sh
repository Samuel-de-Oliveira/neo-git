NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	if [ -f $NAME.py ]; then
		echo "The file $NAME.py exist, please remove to proced"
		exit 1
	fi

	cp $DIRLOCALE/main.py ./$NAME.py
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.py .
	touch requirements.txt

        echo "__cache__/" >> .gitignore
        echo "__cache__"  >> .gitignore
	echo "*.pyc"      >> .gitignore
fi

if [ $1 == "lib" ]; then
	if [ -d $NAME ]; then
		echo "The directory $NAME exist, please remove to proced"
		exit 1
	fi

	mkdir -p $NAME
	cp $DIRLOCALE/__init__.py $NAME/
fi
