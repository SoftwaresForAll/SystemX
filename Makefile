# SystemX Init Makefile

# Tools
AS      ?= nasm
LD      ?= ld
STRIP   ?= strip

# Flags
ASFLAGS ?= -f elf64
LDFLAGS ?= -m elf_x86_64 -nostdlib -static

# Optional debug info (some NASM builds don't support '-F dwarf')
ifeq ($(DEBUG),1)
  ASFLAGS += -g
  # Enable DWARF debug format only if NASM supports it in your environment
  ASFLAGS += -F dwarf
endif

# Project
TARGET  ?= init
SRC      := init.s
OBJ      := $(SRC:.s=.o)

# Install paths
PREFIX   ?= /
SBIN_DIR ?= $(PREFIX)sbin
ETC_DIR  ?= $(PREFIX)etc
DESTDIR  ?=

all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $^
	$(STRIP) -s $@ || true

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(OBJ) $(TARGET)

install: $(TARGET)
	@echo "Installing $(TARGET) to $(DESTDIR)$(SBIN_DIR)/init"
	install -d "$(DESTDIR)$(SBIN_DIR)"
	install -m 0755 "$(TARGET)" "$(DESTDIR)$(SBIN_DIR)/init"
	@echo "Optionally place your config at $(DESTDIR)$(ETC_DIR)/systemx.conf"

uninstall:
	@echo "Removing $(DESTDIR)$(SBIN_DIR)/init if it is ours (be careful)"
	-rm -f "$(DESTDIR)$(SBIN_DIR)/init"

rebuild: clean all

.PHONY: all clean install uninstall rebuild
