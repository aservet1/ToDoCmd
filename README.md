# cmdtodo
A command line ToDo list application.

Initially, I had a bunch of ToDos in text files throughout my computer. Then I decided to write a Bash script that goes through
all of them and prints their cotents to one main file. I kept adding features to the script to make the process more user friendly
and it evantually became a command line to do list application.

This project was not only made as a way to organize my ToDos, but also a way to learn Bash scripting and how to work in the Unix environment,
as I had started as a Linux newbie from Windows only two months before.

## Features
Coming soon

## Installation
All you need to do is set an environment variable, `$CMDTODO_ROOT` to the root directory of this project and add it to `$PATH`

I did it in `$HOME/.profile` but I know there are other places where you can configure this. As long as the environment variable
is set and it's added to `$PATH` then you can type the `cmdtodo` command anywhere and it'll run the application.

From my `$HOME/.profile`:
```
 # setup for cmdtodo
 export CMDTODO_ROOT="$HOME/cmdtodo"
 export PATH=$PATH:$CMDTODO_ROOT
```
I have this in my `$HOME` directory, but you can have it wherever you want in your system as long as `$CMDTODO_ROOT` points to it. Then the rest should work fine.

## Dependencies
Unix system that can run Bash scripts.

You might notice that Github says that this project includes ~11% Python, but those are currently deprecated files in
my archive folder. The currently functioning part of this application is written in Bash.
