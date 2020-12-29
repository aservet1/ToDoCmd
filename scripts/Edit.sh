#!/bin/bash

editor=$(sed -e '/^#/d' -e 's/^\s*//' -e 's/\s*$//' texteditor) # parse the 'texteditor' file which specifies which text editor to use

[ -z $1 ] && (echo; echo "<-- Selecting to Edit -->"; echo)

source scripts/Menu.sh

$editor $listnames
