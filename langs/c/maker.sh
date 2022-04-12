NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	cp $DIRLOCALE/main.c ./$NAME.c
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.c .
	cp $DIRLOCALE/makefile .
fi

if [ $1 == "lib" ]; then
	echo -e "#ifndef "$NAME"_H_INCLUDED"      >> $NAME.h
	echo -e "#define "$NAME"_H_INCLUDED"      >> $NAME.h
	echo -e "#include <stdio.h>\n"            >> $NAME.h
	echo -e "void hello() {"                  >> $NAME.h
	echo -e "\tprintf(\"Hello, world!\");\n}" >> $NAME.h
	echo -e "\n#endif"                        >> $NAME.h
fi
