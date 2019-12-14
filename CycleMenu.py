def parse(s):
	entries = s.split()
	if '0' in entries:
		return 0
	processed=[]
	for entry in entries:
		if (not entry.isnumeric()):
			continue
		if (int(entry) > 0 and int(entry) < len(folders)):
			if(not entry in processed):
				processed.append(entry)
	return processed

folders=['ENVI101', 'CS101', 'CS220',
	'CS301', 'MATH304', 'Clubs', 'jRAPL',
	'JobRelated', 'Financial']

print(" 0 - All of them")
for i in range(len(folders)):
	print(" "+str(i+1)+' - '+folders[i])

choices = parse(input("Choose\n"))

if (choices == 0):
	for folder in folders:
		print(folder,end=' ')
else:
	for choice in choices:
		i = int(choice)-1
		print(folders[i],end=' ')
