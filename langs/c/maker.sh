NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	if [ -f $NAME.c ]; then
		echo "The file $NAME.c exist, please remove to proced"
		exit 1
	fi

	cp $DIRLOCALE/main.c ./$NAME.c
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.c .
	cp $DIRLOCALE/makefile .
fi

if [ $1 == "lib" ]; then
	if [ -f $NAME.h ]; then
		echo "The file $NAME.h exist, please remove to proced"
		exit 1
	fi

	echo -e "#ifndef "$NAME"_H_INCLUDED"      >> $NAME.h
	echo -e "#define "$NAME"_H_INCLUDED"      >> $NAME.h
	echo -e "#include <stdio.h>\n"            >> $NAME.h
	echo -e "void hello() {"                  >> $NAME.h
	echo -e "\tprintf(\"Hello, world!\");\n}" >> $NAME.h
	echo -e "\n#endif"                        >> $NAME.h
fi
