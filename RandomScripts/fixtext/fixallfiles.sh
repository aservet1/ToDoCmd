#!/bin/bash

files='Clubs CS101 CS220 CS301 ENVI101 Financial JobRelated jRAPL MATH304'
homebase='/home/alejandro/Documents/BingFiles/Fall2019/.todo-utils'


for file in $files
do
	cd ../$file
	python $homebase/fixtext.py ToDo$file.txt
	cat temp.txt > ToDo$file.txt
	rm temp.txt
	cd $homebase
done

