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
	echo -e "#ifndef "$NAME"_HPP_INCLUDED"                        >> $NAME.hpp
	echo -e "#define "$NAME"_HPP_INCLUDED"                        >> $NAME.hpp
	echo -e "#include <iostream>"                                 >> $NAME.hpp
	echo -e "using namespace std;"                                >> $NAME.hpp
	echo -e "\nvoid hello() {\n\tcout << \"Hello, world!\\n\"\n}" >> $NAME.hpp
	echo -e "\n#endif"                		              >> $NAME.hpp
fi
