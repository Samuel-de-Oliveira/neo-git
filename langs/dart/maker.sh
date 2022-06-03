NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	if [ -f $NAME.sh ]; then
		echo "The file $NAME.sh exist, please remove to proced"
		exit 1
	fi

	cp $DIRLOCALE/main.dart ./$NAME.dart
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.dart .
fi

if [ $1 == "lib" ]; then
	if [ -f $NAME.dart ]; then
		echo "The file $NAME.dart exist, please remove to proced"
		exit 1
	fi
        
      echo -e "\nNo library for this language...\n"
fi
