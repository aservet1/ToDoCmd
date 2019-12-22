#!/bin/bash

cd ~/Documents/Projects/ToDoCmd/ListStorage ## do ListStorage/xyz when you get subfolders going in there
rm -f MASTER.todo

lists=$(ls *.todo)

touch tempMASTER.todo

for list in $lists
do
	echo "================================"${list%".todo"}"=============================" >> tempMASTER.todo
	cat $list >> tempMASTER.todo ##put it in the list of ToDo lists
	echo "===================================================================" >> tempMASTER.todo
done

touch MASTER.todo
cat tempMASTER.todo > MASTER.todo
rm tempMASTER.todo

#python ../sublists.py
