#!/bin/sh
DIR=te0820-4ev
mkdir -p $(DIR)/
cp ../board/te0820-4ev/te0820-4ev.tcl $(DIR)/
cp ../board/te0820-4ev/sys.tcl $(DIR)/
cd $(DIR)/
vivado -nolog -nojournal -mode batch -source ./te0820-4ev.tcl
