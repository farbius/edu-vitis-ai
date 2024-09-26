#!/bin/sh
cp ../board/te0820-4ev/te0820-4ev.tcl .
cp ../board/te0820-4ev/sys.tcl .
vivado -nolog -nojournal -mode batch -source ./te0820-4ev.tcl
