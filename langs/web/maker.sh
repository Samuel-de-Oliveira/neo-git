NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	if [ -f $NAME.html ]; then
		echo "The file $NAME.html exist, please remove to proced..."
		exit 1
	fi

	cp $DIRLOCALE/index.html ./$NAME.html
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/* .
        rm -rf maker.sh
fi

if [ $1 == "lib" ]; then
        if [ -d $NAME ]; then
          echo -e "The directory $NAME exist, please remove to proced..."
	fi
        mkdir -p $NAME
        cp $DIRLOCALE/* ./$NAME
	rm -rf maker.sh
fi
