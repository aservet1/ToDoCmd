#!/bin/bash

cd ~/Documents/BingFiles/Fall2019/
folders='ENVI101 CS101 CS220 CS301 MATH304 Clubs jRAPL JobRelated Financial'


todolists=''
for folder in $folders
do
	todolists=$todolists' '$folder'/ToDo'$folder'.txt'
done

nano $todolists

#	Cool idea to loop through but not smart b/c cant go back. Better to do nano's 'open a bunch at once' utility
#for folder in $folders
#do
#	ToDo='../'$folder'/ToDo'$folder'.txt' ##generic name for a todo list in a given folder
#	if test -f $ToDo; ##see if there is one in the folder yet
#		then nano $ToDo
#	fi
#done

.todo-utils/UpdateMasterToDo.sh
