#!/bin/sh
mkdir -p vivado/
cp ../board/te0820-2cg/te0820-2cg.tcl vivado/
cp ../board/te0820-2cg/sys.tcl vivado/
cd vivado/
vivado -nolog -nojournal -mode batch -source ./te0820-2cg.tcl
