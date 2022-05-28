NAME=$2
DIRLOCALE=$(dirname -- $(readlink -fn -- "$0"))

if [ $1 == "file" ]; then
	if [ -f $NAME.cpp ]; then
		echo "The file cNAME.hpp exist, please remove to proced"
		exit 1
	fi

	cp $DIRLOCALE/main.cpp ./$NAME.cpp
fi

if [ $1 == "dir" ]; then
	cp $DIRLOCALE/main.cpp .
	cp $DIRLOCALE/makefile .

        echo "a.out" >> .gitignore
fi

if [ $1 == "lib" ]; then
	if [ -f $NAME.hpp ]; then
		echo "The file $NAME.hpp exist, please remove to proced"
		exit 1
	fi

	echo -e "#ifndef "$NAME"_HPP_INCLUDED"    >> $NAME.hpp
	echo -e "#define "$NAME"_HPP_INCLUDED"    >> $NAME.hpp
	echo -e "#include <iostream>"             >> $NAME.hpp
	echo -e "#include <stdio.h>"              >> $NAME.hpp
	echo -e "using namespace std;"            >> $NAME.hpp
	echo -e "\nvoid hello() {"                >> $NAME.hpp
	echo -e "\tcout << \"Hello, world!\";\n}" >> $NAME.hpp
	echo -e "\n#endif"                        >> $NAME.hpp
fi
