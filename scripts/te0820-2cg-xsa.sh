#!/bin/sh
mkdir -p te0820-2cg-xsa/
cp ../board/te0820-2cg/te0820-2cg.tcl te0820-2cg-xsa/
cp ../board/te0820-2cg/sys.tcl te0820-2cg-xsa/
cd te0820-2cg-xsa/
vivado -nolog -nojournal -mode batch -source ./te0820-2cg.tcl
