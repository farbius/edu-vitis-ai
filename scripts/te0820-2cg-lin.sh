#!/bin/sh
cp -r ../petalinux/te0820-2cg-lin .
cd te0820-2cg-lin
petalinux-config --get-hw-description=../
