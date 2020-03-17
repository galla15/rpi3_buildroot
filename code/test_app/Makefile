BUILDROOT_HOME=/home/mattia/rpi3/buildroot
CC=$(BUILDROOT_HOME)/output/host/usr/bin/arm-linux-gcc
CFLAGS=--sysroot=$(BUILDROOT_HOME)/output/staging
INCLUDES=
LFLAGS=
LIBS=-lcurl -lc

SRC=main.c
OBJ=$(SRC:.c=.o)
MAIN=app

RM=rm -rf

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $CODElt -o $@

$(MAIN): $(OBJ)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) $(OBJ) $(LFLAGS) $(LIBS)

all: $(MAIN)

clean: 
	$(RM) $(MAIN) *.o *~