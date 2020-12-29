#!/bin/bash

symbol=$1
shift

source scripts/Menu.sh $@
lists=$listnames

for list in $lists
do
	echo "============================${list//'.todo'/}========================"
	grep -E ".*"$symbol".*" $list | sed "s/$symbol//g"
	#echo "==================================================================="
done
