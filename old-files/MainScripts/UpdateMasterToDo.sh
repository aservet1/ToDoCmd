#!/bin/bash

source Parameters.sh

if [ -z $1 ]
then 	echo 'no arg to UpdateMasterToDo.sh'
	exit
fi

#category="/home/alejandro/Documents/Projects/ToDoCmd/ListStorage/$1"
category=$(echo $1 | sed 's|^.*/||')

if [ ! -d $category ]
	then echo "invalid path $category"
	exit; fi

cd $category

masterList=MASTER_$category.todo
rm -f $masterList

lists=$(ls *.todo)

touch temp_master_list

for list in $lists
do
	echo "================================"${list%".todo"}"=============================" >> temp_master_list
	cat $list >> temp_master_list ##put it in the list of ToDo lists
	echo "===================================================================" >> temp_master_list
done

touch $masterList
cat temp_master_list > $masterList
rm temp_master_list

#python ../sublists.py
