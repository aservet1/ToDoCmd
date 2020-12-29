#!/bin/bash

#cd /home/alejandro/Documents/BingFiles/Fall2020/todo_fall2020

[ -z $1 ] && (echo; echo "<-- Viewing Master -->"; echo)

source Menu.sh # get var $listnames from the selections

echo;echo #;echo

for list in $listnames
do
	echo "================================"${list%'.todo'}"============================="
	cat $list
done

echo "==================================================================="

echo #;echo
