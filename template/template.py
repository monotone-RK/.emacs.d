#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import os
import time
import commands

#******************** Error case
#********************************************************************************
argvs = sys.argv
argc = len(argvs)
if argc <= 1:
    print "## Version:xx Date:xxxx.xx.xx\n## Usage: It is templete"
    sys.exit()


fn = argvs[1]
if not os.path.isfile(fn):
    print "## Error! No such file: " + fn
    print "## Usage: scrun filename.bin"
    sys.exit()


fsize = os.path.getsize(fn)
if fsize != 512*1024:
    print "## Error! Filesize does not match 512k"
    sys.exit()
