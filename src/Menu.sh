#!/bin/bash

function abort()
{
	rc=$1
	message=$2
	echo $message
	exit $rc
}

cd Lists
todolists=($(ls [!_]*.todo))

if [ -z $1 ]
then	echo '| Options:'
	for i in ${!todolists[@]}
	do	let n=$i+1
		echo '|  '$n')' ${todolists[i]//.todo/}
	done
	echo '|  @  all'
	echo '| Enter the ones you want by name or number: '
	echo -n '| > '
	read lists_requested
else	lists_requested="$@"
fi

if [ "$lists_requested" == '@' ]; then lists_requested=${!todolists[@]}; fi

for entry in $lists_requested
do	if [[ $entry =~ ^[0-9]+$ ]]
	then	n=$entry
		let i=$n-1
		listnames="$listnames ${todolists[i]}"
	elif [[ $entry =~ [0-9]-[0-9] ]]
	then	nums=($(echo $entry | sed 's/-/ /'))
		nums=$(seq ${nums[0]} ${nums[1]})
		for n in $nums
		do	let i=$n-1
			listnames="$listnames ${todolists[i]}"
		done
	else	listnames="$listnames ${entry}.todo"
	fi
done

for listname in $listnames
do
	[ -f $listname ] || abort 1 "'${listname//.todo/}' is not an existing list"
done

#####returns $listnames as lists you can now access
