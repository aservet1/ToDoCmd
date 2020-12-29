#!/bin/bash

cd lists

echo "Making New List. Here are the existing ones:"
for list in $(ls *.todo)
do
	echo " ((( ${list//.todo/}"
done

promptSymbol='>>'

[ -z $1 ] && echo -n "${promptSymbol}Your new list name: " && read newlistname || newlistname=$1 && echo ''

while [ -f ${newlistname}.todo ]
do
	echo -n "${promptSymbol}List '${newlistname}' already exists. Pick something else: " && read newlistname
done

echo
echo "${promptSymbol}Confirm creating list: $newlistname"
echo -n "$promptSymbol(y/n): " && read response

[ $response = 'y' ] && touch ${newlistname}.todo
