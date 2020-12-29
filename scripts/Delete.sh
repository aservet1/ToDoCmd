#!/bin/bash

source ./Menu.sh #sets the variable $listnames

for name in $listnames
do
	echo "Deleting list: $name"
	echo "Would you like to see the contents of the list before you delete it? (y/n)"
	read response
	
	while [ $response != "y" ] && [ $response != "n" ]
	do
		echo "invalid response: $response. try again"
		read response
	done
	
	[ $response == "y" ] && cat $name
	
	echo "Confirm deleting: (y/n)"
	read response
	
	while [ $response != "y" ] && [ $response != "n" ]
	do
		echo "invalid response: $response. try again"
		read response
	done
	
	[ $response == "y" ] && rm $name
done

echo "deletions done. remaining lists:"
ls | sed 's/.todo//g'
