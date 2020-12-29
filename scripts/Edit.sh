#!/bin/bash

#texteditor=vim 
texteditor=nano

[ -z $1 ] && (echo; echo "<-- Selecting to Edit -->"; echo)

source scripts/Menu.sh

$texteditor $listnames
