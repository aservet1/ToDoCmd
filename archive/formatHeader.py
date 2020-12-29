'''deprecated; too slow to include in the overall bash script'''

from sys import argv

length = 70
char = '='

if (len(argv) == 1):
	header = char*length
	print(header)

else:
	length = ( length - len(argv[1]) ) / 2
	if (length % 1 != 0):
		length = int(length)
		addExtra = True
	else:
		length = int(length)
		addExtra = False

	header = char*length + argv[1] + char*length

	if (addExtra):
		header += char

	print(header)
