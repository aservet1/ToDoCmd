import sys

src=open(sys.argv[1],"r")
dest=open('temp.txt',"w")

lines=src.readlines()

for line in lines:
	line = line.replace('(***)','<***>')
	line = line.replace('<smalltask>','<sm>')
	dest.write(line)

src.close()
dest.close()
