#!/bin/bash

#texteditor=vim 
texteditor=nano


#cd /home/alejandro/Documents/BingFiles/Fall2020/todo_fall2020

[ -z $1 ] && (echo; echo "<-- Selecting to Edit -->"; echo)

source Menu.sh

$texteditor $listnames

