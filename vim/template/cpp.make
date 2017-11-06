CC      = clang++
CFLAGS  = -Isrc -o $@
LDFLAGS =

SRCDIR = ./src
OBJDIR = ./obj
OUTDIR = ./bin
TARGET =

C_SOURCES = $(shell find $(SRCDIR) -type f -name '*.c')
C_OBJECTS = $(C_SOURCES:.c=.o)

CPP_SOURCES = $(shell find $(SRCDIR) -type f -name '*.cpp')
CPP_OBJECTS = $(CPP_SOURCES:.cpp=.o)

SOURCES = $(C_SOURCES) $(CPP_SOURCES)
OBJECTS = $(subst $(SRCDIR),$(OBJDIR),$(SOURCES))


all: $(TARGET)

$(TARGET): $(OBJECTS)
	@[ -d $(@D) ] || mkdir -p $(@D)
	$(CC) $(CFLAGS) $(LDFLAGS) $^

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	@[ -d $(@D) ] || mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $<

.PHONY: clean force
clean:
	@rm -rf $(OBJDIR) $(OUTDIR)

force:
	@$(MAKE) clean
	@$(MAKE) $(TARGET)
