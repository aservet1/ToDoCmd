#!/bin/bash

function ask_view_all
{
	echo 'would you like to see the existing files?'
	read response
	if [ $response == 'y' ]
	then	echo ''
		view_all
		echo ''
	fi
}

function view_all()
{
	array=($(ls))
	for i in ${!array[@]}
	do	n=$(( i+1 ))
		echo "($n) ${array[i]%'.todo'}"
	done
}

function make_new()
{
	ask_view_all
	echo 'enter file name to create'
	read filename
	if [ -f $filename.todo ]
	then	echo $filename' already exists. try again?'
		read response
		if [ $response == 'y' ]
		then make_new ### recursion is dumb
		fi
	else	touch $filename.todo
		nano $filename.todo
	fi
}

function rename()
{
	ask_view_all
	echo 'enter the name of the file you would like to fix'
	read oldname
	if [ -f $oldname.todo ]
	then	echo 'enter the name you want to change it to'
		read newname
		mv $oldname.todo $newname.todo
	else	echo 'no file found named '$oldname' . try again?'
		read response
		if [ $response == 'y' ]
		then	rename ### recursion is dumb
		fi
	fi
}

function edit_lists()
{
	ask_view_all
	lists=($(ls *.todo)) ### find a way to exclude meta-lists

	echo 'enter the ones to edit by name or number. * for all'
	read editrequests
	if [ "$editrequests" == '*' ]; then editrequests=${!lists[@]}; fi

	for entry in $editrequests
	do	if [[ $entry =~ ^[0-9]+$ ]]
		then	n=$entry
			i=$(( $n-1 ))
			toedit="$toedit ${lists[i]}"
		else	toedit="$toedit ${entry}.todo"
		fi
	done
	nano $toedit

	$script_storage/UpdateMasterToDo.sh $(pwd | sed 's|^.*/||')
}

function delete()
{
	ask_view_all
	lists=($(ls *.todo))
	echo 'enter the name of the file you would like to delete'
	read todelete
	if [[ $todelete =~ ^[0-9]+$ ]]
	then	n=$todelete
		i=$(( n-1 ))
		todelete=${lists[i]%'.todo'}
	fi

	if [ -f $todelete.todo ]
	then	echo 'are you sure? this cannot be undone! at all!'
		read response
		if [ $response == 'y' ]
			then rm $todelete.todo
		fi
	else	echo $todelete' does not exist. try again?'
		read response
		if [ $response == 'y' ]
		then delete ### recursion is dumb
		fi
	fi
}

function in_category()
{
	category=$1
	cd $category
	echo 'in category '$category'. your options: '
	echo '(1) see existing lists'
	echo '(2) make new list'
	echo '(3) rename a list'
	echo '(4) edit list(s)'
	echo '(5) delete a list'
	read input

#	while [[ $input !=~ "^[1-5]$" ]]
#	do	echo 'invalid entry: '$input
#		printf 'try again: '
#		read input
#	done

	echo ''
	if   [ $input == 1 ]; then view_all
	elif [ $input == 2 ]; then make_new
	elif [ $input == 3 ]; then rename
	elif [ $input == 4 ]; then edit_lists
	elif [ $input == 5 ]; then delete
	fi
}

function main()
{
	source /home/alejandro/Documents/Projects/ToDoCmd/MainScripts/Parameters.sh

	cd $list_storage
	view_all
	echo 'pick a category by name or number'
	categories=($(ls))
#	for i in ${!categories[@]}
#	do	n=$(( $i+1 ))
#		echo $n ${categories[i]}
#	done

	read category ### gotta validate entries

	if [[ $category =~ ^[0-9]+$ ]]
	then	n=$category
		i=$(( $n-1 ))
		category=${categories[i]}
	fi

#	while [ ! -d $category ]
#	do	echo 'invalid category: '$category
#		printf 'try again: '
#		read category
#	done

	in_category "$category"
}

main
