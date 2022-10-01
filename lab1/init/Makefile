C_SRC       = $(sort $(wildcard *.c))
OBJ		    = $(patsubst %.c,%.o,$(C_SRC))

file = main.o
all:$(OBJ)

%.o:%.c
	${GCC} ${CFLAG} -c -save-temps $<

clean:
	$(shell rm *.o 2>/dev/null)
