#!/bin/bash

function ask_view_all
{
	echo 'would you like to see the existing files?'
	read response
	if [ $response == 'y' ]
	then
		echo ''
		view_all
		echo ''
	fi
}

function view_all()
{
	array=($(ls *.todo))
	for item in ${array[@]}
	do
		printf ${item%'.todo'}"\t"
	done
	printf '\n'
}

function make_new()
{
	ask_view_all
	echo 'enter file name to create'
	read filename
	if [ -f $filename.todo ]
	then
		echo $filename' already exists. try again?'
		read response
		if [ $response == 'y' ]
			then make_new # the recursion causes lag in nano-ing the file once you make a valid one
		fi

	else
		touch $filename.todo
		nano $filename.todo
	fi
}

function rename()
{
	ask_view_all
	echo 'enter the name of the file you would like to fix'
	read oldname
	if [ -f $oldname.todo ]
	then
		echo 'enter the name you want to change it to'
		read newname
		mv $oldname.todo $newname.todo
	else
		echo 'no file found named '$oldname' . try again?'
		read response
		if [ $response == 'y' ]
			then rename
		fi
	fi
}

function delete()
{
	ask_view_all
	echo 'enter the name of the file you would like to delete'
	read todelete
	if [ -f $todelete.todo ]
	then
		echo 'are you sure? this cannot be undone! at all!'
		read response
		if [ $response == 'y' ]
			then rm $todelete.todo
		fi
	else
		echo $todelete' does not exist. try again?'
		read response
		if [ $response == 'y' ]
			then delete
		fi
	fi
}

function main()
{
	echo 'hello. your options: '
	echo '(1) - see existing list'
	echo '(2) - make new list'
	echo '(3) - rename a list'
	echo '(4) - delete a list'
	read input
	echo ''
	if   [ $input == 1 ]; then view_all
	elif [ $input == 2 ]; then make_new
	elif [ $input == 3 ]; then rename
	elif [ $input == 4 ]; then delete
	else echo 'no valid entry'; fi
}

main
