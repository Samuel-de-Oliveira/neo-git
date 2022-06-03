NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	if [ -f $NAME.php ]; then
		echo "The file $NAME.php exist, please remove to proced"
		exit 1
	fi

	cp $DIRLOCALE/index.php ./$NAME.php
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/index.php .
fi

if [ $1 == "lib" ]; then
	if [ -f $NAME.php ]; then
		echo "The file $NAME.php exist, please remove to proced"
		exit 1
	fi
        
        echo "\nNo library for this language\n"
fi
