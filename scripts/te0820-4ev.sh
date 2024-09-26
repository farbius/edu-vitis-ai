#!/bin/sh
mkdir -p vivado/
cp ../board/te0820-4ev/te0820-4ev.tcl vivado/
cp ../board/te0820-4ev/sys.tcl vivado/
cd vivado/
vivado -nolog -nojournal -mode batch -source ./te0820-4ev.tcl
