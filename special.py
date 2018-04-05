#!/usr/bin/python

import sys

print sys.argv[0]

for i in range(1, len(sys.argv)):
    print "param", i, sys.argv[i]