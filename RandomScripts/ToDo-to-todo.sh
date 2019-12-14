#!/bin/bash

lists=$(ls *ToDo*)

for l in $lists
do
	replacement=${l#'ToDo'} #delete first match of ToDo
	replacement=${replacement/'.txt'/'.todo'} #replace .txt with .todo
	mv $l $replacement #rename
done

## This code renames all the files in a folder of format ToDoName.txt to Name.todo
## I only used it once and probablly never will again, but it's cool to have for reference I suppose
