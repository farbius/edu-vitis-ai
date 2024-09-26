
PWD := $(shell pwd)
TARGETS := te0820-4ev linux

.PHONY: all clean $(TARGETS)

all: $(TARGETS)

$(TARGETS):
	@echo "Build Vivado"
	mkdir -p build/
	cp -f $(PWD)/scripts/$@.sh $(PWD)/build
	cd $(PWD)/build; ./$@.sh

clean:
	rm -f *.log *.jou
	rm -Rf build/
