#!/bin/bash
cp $1 $1.bak
gzip -9 $1
sudo cp $1.gz cubanker/usr/share/doc/cubanker/.
cp $1.bak $1
rm $1.bak
rm $1.gz


