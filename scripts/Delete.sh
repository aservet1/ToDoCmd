#!/bin/bash

source scripts/Menu.sh #sets the variable $listnames

prompt=">> "

for name in $listnames
do
	echo "Deleting list: $name"
	echo "Would you like to see the contents of the list before you delete it? (y/n)"
	echo -n $prompt; read response
	
	while [ $response != "y" ] && [ $response != "n" ]
	do
		echo "invalid response: $response. try again"
		echo -n $prompt; read response
	done
	
	if [ $response == "y" ]; then
		echo ====================================
		cat $name
		echo ====================================
	fi

	echo "Confirm deleting: (y/n)"
	echo -n $prompt; read response
	
	while [ $response != "y" ] && [ $response != "n" ]
	do
		echo "invalid response: $response. try again"
		echo -n $prompt; read response
	done
	
	[ $response == "y" ] && rm $name
done

echo;echo "deletions done. remaining lists:"
ls | sed 's/.todo//g' | sed 's/^/\ \ /'
