LIBNAME = capstone

disassemble: disassemble.o
		${CC} $< -O3 -Wall -l$(LIBNAME) -o $@

%.o: %.c
		${CC} -c $< -o $@
