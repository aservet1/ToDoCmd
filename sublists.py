original = open("MasterToDo.txt","r")
priorities = open("MasterToDoPriorities.txt", "w+")
priorities.write("\t\t\t <~~~ Priorities ~~~>\n")
smalltasks = open("MasterToDoSmallTasks.txt", "w+")
smalltasks.write("\t\t\t <~~~ Small Tasks ~~~>\n")

original_lines = original.readlines()

for line in original_lines:
	if ("<***>" in line):
		priorities.write(line.replace('<***>',''))
	if ('<sm>' in line):
		smalltasks.write(line.replace('<sm>',''))
	if ("===" in line):
		priorities.write(line)
		smalltasks.write(line)
priorities.write("\n(~~ Remember to re-check master often b/c new priorities come up ~~)\n\n====================================================================\n")


original.close()
priorities.close()
smalltasks.close()
