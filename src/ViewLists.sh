#!/bin/bash

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
