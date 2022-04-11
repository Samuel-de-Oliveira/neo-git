NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	cp $DIRLOCALE/main.c ./$NAME
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.c .
	cp $DIRLOCALE/makefile .
fi

if [ $1 == "lib" ]; then
	mkdir Headers
	echo -e "#ifndef "$NAME"_H_INCLUDED"                       >> Headers/$NAME.h
	echo -e "#define "$NAME"_H_INCLUDED"                       >> Headers/$NAME.h
	echo -e "#include <stdio.h>"                               >> Headers/$NAME.h
	echo -e "\nvoid hello() {\n\tprintf(\"Hello, world\");\n}" >> Headers/$NAME.h
	echo -e "\n#endif"                		           >> Headers/$NAME.h
fi
