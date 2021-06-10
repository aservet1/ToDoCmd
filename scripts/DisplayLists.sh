#!/bin/bash

cd lists

todolists=($(ls [!_]*.todo))

echo
echo 'Currently Existing Lists:'
echo

for i in ${!todolists[@]}
do	let n=$i+1
	echo ' |  '$n')' ${todolists[i]//.todo/}
done

echo
