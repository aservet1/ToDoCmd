#!/bin/bash

#editor=$(sed -e 's/#.*$//' -e 's/^\s*//' -e 's/\s*$//' -e '/^$/d' texteditor) # remove comments, whitespace, and empty lines from 'texteditor' file

editor=$( cat texteditor | sed 's/#.*$//' | grep -e 'EDITOR\s*=' | sed 's/EDITOR\s*=\s*//' )

[ -z $1 ] && (echo; echo "<-- Selecting to Edit -->"; echo)

source scripts/Menu.sh

$editor $listnames
