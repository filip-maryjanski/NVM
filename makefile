# makefile for GNU make (automatically generated by makemake 01-Lis-12, 00:02:11)
# NOTE: indent with TAB in GNU makefiles!

# MESSAGES #

COMPILE_FILE=printf "\033[K\033[0;33mCompiling \033[1;33m$<\033[0;33m...\033[0m\n"
TARGET_DONE=printf "\033[K\033[0;32mTarget \"$@\" successfully done.\033[0m\n"
LINKING=printf "\033[K\033[1;34mLinking project \"$@\"... \033[0m\n"

# VERSION DEFINES #

VERSION = -D__AMIGADATE__=\"\ \($(shell date "+%d.%m.%Y")\)\ \" -D__COPYRIGHT__=\"�\ $(shell date "+%Y")\ Filip\ \'\widelec\'\ Maryja�ski\"

# PROJECT #
# paths are relative to the project directory (current directory during make)

OUTFILE = NVM

OUTDIR  = bin/
OBJDIR  = o/

PROJECT = $(OUTDIR)$(OUTFILE)

# COMPILER #
CC = gcc
CWARNS = -Wall -Wno-pointer-sign -Wpointer-arith
CDEFS  = $(VERSION) -DUSE_INLINE_STDARG -D__NOLIBBASE__
# -D__DEBUG__
CFLAGS = -O2 -noixemul
CLIBS  = -Ilibvstring

COMPILE = $(CC) $(TARGET) $(CWARNS) $(CDEFS) $(CFLAGS) $(CLIBS)

# LINKER #
LD = gcc

LWARNS =
LDEFS  =
LFLAGS = -noixemul -nostdlib -nostartfiles -Llibvstring
LIBS   = -labox -lvstring
# -ldebug

LINK   = $(LD) $(TARGET) $(LWARNS) $(LDEFS) $(LFLAGS)

.PHONY: all clean libvstring

# target 'all' (default target)
all: libvstring $(PROJECT)
	@$(TARGET_DONE)

# target 'compiler' (compile target)
$(OBJDIR)application.c.o: application.c globaldefines.h mainwindow.h application.h locale.h
	@$(COMPILE_FILE)
	@$(COMPILE) -c -o $(OBJDIR)application.c.o application.c

$(OBJDIR)mainwindow.c.o: mainwindow.c globaldefines.h mainwindow.h support.h application.h
	@$(COMPILE_FILE)
	@$(COMPILE) -c -o $(OBJDIR)mainwindow.c.o mainwindow.c

$(OBJDIR)main.c.o: main.c globaldefines.h application.h mainwindow.h locale.h list.h
	@$(COMPILE_FILE)
	@$(COMPILE) -c -o $(OBJDIR)main.c.o main.c

$(OBJDIR)locale.c.o: locale.c locale.h
	@$(COMPILE_FILE)
	@$(COMPILE) -c -o $(OBJDIR)locale.c.o locale.c

$(OBJDIR)support.c.o: support.c support.h globaldefines.h
	@$(COMPILE_FILE)
	@$(COMPILE) -c -o $(OBJDIR)support.c.o support.c

$(OBJDIR)list.c.o: list.c list.h globaldefines.h
	@$(COMPILE_FILE)
	@$(COMPILE) -c -o $(OBJDIR)list.c.o list.c

$(OBJDIR)charsetcycle.c.o: charsetcycle.c charsetcycle.h globaldefines.h
	@$(COMPILE_FILE)
	@$(COMPILE) -c -o $(OBJDIR)charsetcycle.c.o charsetcycle.c

$(OBJDIR)start.c.o: start.c
	@$(COMPILE_FILE)
	@$(COMPILE) -c -o $(OBJDIR)start.c.o start.c

OBJS = $(OBJDIR)start.c.o $(OBJDIR)application.c.o $(OBJDIR)list.c.o $(OBJDIR)mainwindow.c.o $(OBJDIR)main.c.o $(OBJDIR)locale.c.o\
 $(OBJDIR)support.c.o $(OBJDIR)charsetcycle.c.o

# link all file(s)
$(PROJECT): $(OBJS)
	@$(LINKING)
	@$(LINK) $(OBJS) -o $(PROJECT) $(LIBS)

# any other targets

strip:
	strip --remove-section=.comment $(PROJECT)
	@$(TARGET_DONE)

clean:
	-rm $(PROJECT)
	-rm $(OBJDIR)*.o
	make -C libvstring/ clean
	@$(TARGET_DONE)

dump:
	@objdump -dC $(OUTDIR)/$(OUTFILE) >RAM:$(OUTFILE).log
	@$(TARGET_DONE)

dist:
	@mkdir RAM:$(OUTFILE) >NIL:
	@copy $(OUTDIR) RAM:$(OUTFILE) ALL >NIL:
	@strip --strip-unneeded --remove-section .comment RAM:$(OUTFILE)/$(OUTFILE) >NIL:
	@copy doc/$(OUTFILE).readme RAM:$(OUTFILE)/
	-@cp Dev:rilejsy/def_drawer.info RAM:$(OUTFILE).info
	@find RAM:$(OUTFILE) -name .svn -printf "\"%p\"\n" | xargs rm -rf
	@MOSSYS:C/LHa a -r -a RAM:$(OUTFILE).lha RAM:$(OUTFILE) RAM:$(OUTFILE).info >NIL:
	@$(TARGET_DONE)

libvstring:
	make -C libvstring/
