#!/bin/bash

#cd /home/alejandro/Documents/BingFiles/Fall2020/todo_fall2020

symbol=$1
#symbol=$(echo $symbol | sed 's|\*|\\*|g')
shift

source Menu.sh $@
lists=$listnames

for list in $lists
do
	echo "============================${list//'.todo'/}========================"
	grep -E ".*"$symbol".*" $list | sed "s/$symbol//g"
	#echo "==================================================================="
done
