INCLUDE_PATH =  -I"$(ISE_LIBRARY)/library/encoding/implementation/include" -I"$(ISE_LIBRARY)/library/time/spec/include" -I"$(ISE_LIBRARY)/library/vision2/spec/include" -I"$(ISE_LIBRARY)/library/vision2/implementation/gtk/Clib"  -pthread -I/usr/include/gtk-2.0 -I/usr/lib64/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/harfbuzz -I/usr/include/freetype2 -I/usr/include/libpng15 -I/usr/include/uuid -I/usr/include/pixman-1 -I/usr/include/libdrm
SHELL = /bin/sh
CC = gcc
CPP = g++
CFLAGS = -O0 -pipe -fPIC -D_GNU_SOURCE -m64 -DEIF_THREADS -DEIF_LINUXTHREADS  -DWORKBENCH -I"/cs/local/packages/Eiffel19.05/studio/spec/linux-x86-64/include" -I. $(INCLUDE_PATH)
CPPFLAGS = -O0 -pipe -fPIC -D_GNU_SOURCE -m64 -DEIF_THREADS -DEIF_LINUXTHREADS  -DWORKBENCH -I"/cs/local/packages/Eiffel19.05/studio/spec/linux-x86-64/include" -I. $(INCLUDE_PATH)
LDFLAGS = -m elf_x86_64
CCLDFLAGS = -m64  
LDSHAREDFLAGS =  -m elf_x86_64 -shared -o
EIFLIB = "/cs/local/packages/Eiffel19.05/studio/spec/linux-x86-64/lib/libmtwkbench.a"
EIFTEMPLATES = /cs/local/packages/Eiffel19.05/studio/config/linux-x86-64/templates
LIBS = -lm -lpthread
MAKE = make
AR = ar
LD = ld
MKDEP = \$(EIFFEL_SRC)/C/mkdep $(DPFLAGS) --
MV = /bin/mv
CP = /bin/cp
RANLIB = :
RM = /bin/rm -f
FILE_EXIST = 
RMDIR = 
X2C = "/cs/local/packages/Eiffel19.05/studio/spec/linux-x86-64/bin/x2c"
SHAREDLINK = ld
SHAREDLIBS = -lm
SHARED_SUFFIX = .so
COMMAND_MAKEFILE = 
START_TEST = if [ ! -f finished ] ; then 
END_TEST = ; fi 
CREATE_TEST = touch finished 
SYSTEM_IN_DYNAMIC_LIB = simodyssey2.so 

.SUFFIXES:.cpp .o

.c.o:
	$(CC) $(CFLAGS) -c $<

.cpp.o:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = big_file_C20_c.o 

OLDOBJECTS =  ty1586.o ty1586d.o ty1591.o ty1591d.o ac1589.o ac1589d.o kl1595.o \
	kl1595d.o kl1599.o kl1599d.o kl1603.o kl1603d.o kl1616.o kl1616d.o \
	in1587.o in1587d.o kl1597.o kl1597d.o kl1601.o kl1601d.o kl1605.o \
	kl1605d.o kl1596.o kl1596d.o kl1600.o kl1600d.o kl1604.o kl1604d.o \
	ev1590.o ev1590d.o ki1594.o ki1594d.o ki1607.o ki1607d.o kl1598.o \
	kl1598d.o kl1602.o kl1602d.o kl1606.o kl1606d.o ev1588.o ev1588d.o \
	ev1617.o ev1617d.o ki1593.o ki1593d.o ki1608.o ki1608d.o ev1612.o \
	ev1612d.o ev1615.o ev1615d.o ev1611.o ev1611d.o ev1614.o ev1614d.o \
	ev1609.o ev1609d.o ev1613.o ev1613d.o ev1610.o ev1610d.o ki1592.o \
	ki1592d.o kl1618.o kl1618d.o 

all: Cobj20.o

Cobj20.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj20.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

