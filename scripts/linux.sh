#!/bin/sh

cp -r ../petalinux/ .
cd petalinux/
petalinux-config --get-hw-description=../
