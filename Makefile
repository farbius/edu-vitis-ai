PWD := $(shell pwd)
TARGETS := te0820-4ev te0820-2cg custom-brd
XSA_TARGETS := $(addsuffix -xsa, $(TARGETS))
LIN_TARGETS := $(addsuffix -lin, $(TARGETS))
#XSA_TARGET := te0820-2cg-xsa te0820-4ev-xsa
#LIN_TARGET := te0820-2cg-lin te0820-4ev-xsa

.PHONY: all clean $(XSA_TARGETS) $(LIN_TARGETS)

all: $(XSA_TARGETS) $(LIN_TARGETS)

$(XSA_TARGETS):
	@echo "Building Vivado .xsa for target $(@:-xsa=)"
	mkdir -p build/
	#BOARD=$(@:-xsa=)
	cp $(PWD)/scripts/$@.sh $(PWD)/build
	cd $(PWD)/build; ./$@.sh

$(LIN_TARGETS):
	@echo "Building Petalinux for target $(@:-lin=)"
	mkdir -p build/
	#BOARD=$(@:-lin=)
	cp -f $(PWD)/scripts/$@.sh $(PWD)/build
	cd $(PWD)/build; ./$@.sh

clean:
	rm -f *.log *.str *.jou
	rm -Rf build/

