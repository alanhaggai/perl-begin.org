
TARGET = dest

WML_FLAGS += -DLATEMP_THEME=perl-begin-1 -DLATEMP_SERVER=berlios

LATEMP_WML_INCLUDE_PATH =$(shell latemp-config --wml-include-path)

WML_FLAGS += --passoption=2,-X3074 --passoption=3,-I../lib/ \
	--passoption=3,-w -I$(LATEMP_WML_INCLUDE_PATH) -I../ -DROOT~. \
	-I../lib/ --passoption=7,"-S imgsize"

RSYNC = rsync --progress --verbose --rsh=ssh 

ARC_NAME := $(shell cd temp && ./get-arc-name.sh)

DEST_ARC_PAGE = $(TARGET)/source/index.html

LIBRARY_FILES = template.wml lib/books.wml

all: latemp_targets

include include.mak
include rules.mak

upload: upload_berlios

upload_berlios: all
	(cd dest && $(RSYNC) -r * shlomif@shell.berlios.de:/home/groups/perl-begin/htdocs/)

upload_iglu: all
	(cd dest && $(RSYNC) -r * shlomif@iglu.org.il:/iglu/html/shlomif/Perl-Begin/)

DEST_ARC_NAME = $(TARGET)/source/arcs/$(ARC_NAME)

# .PHONY: 
# 
# $(DEST_ARC_PAGE) :: $(TARGET)/% : src/%.wml $(LIBRARY_FILES) .PHONY
# 	(cd src && wml $(WML_FLAGS) -DARCNAME=$(ARC_NAME) -DFILENAME=$(patsubst src/%.wml,%,$<) $(patsubst src/%,%,$<)) > $@
# 
# arc: $(DEST_ARC_NAME) $(DEST_ARC_PAGE)
# 
# $(DEST_ARC_NAME):
# 	(cd temp && ./make-archive.sh)
# 	mv temp/$(ARC_NAME) $@
# 
# upload_arc: arc
# 	$(RSYNC) $(ARC_NAME) shlomif@shell.berlios.de:
# 
