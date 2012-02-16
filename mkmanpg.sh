#!/bin/bash
cp $1 $1.bak
gzip -9 $1
sudo cp $1.gz cubanker/usr/share/man/man1/.
cp $1.bak $1
rm $1.bak

