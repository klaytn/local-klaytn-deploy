#!/usr/bin/env python

import sys

def printUsage(prog_name):
	print ("%s <docker-compose.yml> <private key> <address>" % prog_name)


if len(sys.argv) != 4:
	printUsage(sys.argv[0])
	sys.exit(0);

filename=sys.argv[1]
pk=sys.argv[2]
address=sys.argv[3]

contents=""
with open(filename, "r") as f:
	for l in f:
		if l.strip() == 'tail -F klaytn/log/kcnd.out':
			contents += '        sleep 1\n'
			contents += '        ken attach --exec "personal.importRawKey(\''+pk+'\',\'\')" http://localhost:8551\n'
			contents += '        ken attach --exec "personal.unlockAccount(\''+address+'\',\'\')" http://localhost:8551\n'
		contents += l

f = open(filename, 'w')
f.write(contents)
f.close()
