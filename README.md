# cmdtodo
A command line ToDo list application for Unix based systems.

Initially, I had a bunch of ToDos in text files throughout my computer. Then I decided to write a Bash script that goes through
all of them and prints their cotents to one main file. I kept adding features to the script to make the process more user friendly
and it evantually became a command line to do list application.

This project was not only made as a way to organize my ToDos, but also a way to learn Bash scripting and how to work in the Unix environment,
as I had started as a Linux newbie coming over from Windows only two months before.

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
I have all of my source files in my `$HOME/cmdtodo` directory, but you can have it wherever you want in your system as long as `$CMDTODO_ROOT` points to it. Then the rest should work fine.

## How to Use
Run the `cmdtodo` command with no arguments to get a usage description:
```
usage: cmdtodo <action> <list items>

  action options:
    -new -- make a new list
    -del -- delete a list
    -e  -- edit lists
    -v  -- view lists
    -f [tag] -- filter lists by tag. (lines per list with <> around the 'tag' string)
    -dd -- filter lines with a ## due date #. all lists are shown here 

  list items is optional. if empty, it prompts a menu of lists to perform action on.
  if not empty, use a space separated list of names or numbers that come up on the menu
```
#### The Menu Prompt
In use cases where you interact with one or more lists, and you do not provide them as command line arguments, you will get a menu prompt:
```
| Options:
|  1) ClimateChange
|  2) cs240
|  3) cs350
|  4) cs375
|  5) cs476
|  6) cs499
|  7) GeneralJobs
|  8) jrapl
|  9) Misc
|  10) PersonalProjects
|  @  all
| Enter the ones you want by name or number: 
| >> 
```
You can make selections with a space-separated list of list names, numbers that correspond to the list names, or a range of numbers, ie 2-7. You
can even use any combination of these formats, such as `cs240 cs375 10 5-7` which will translate to interacting with lists `cs240 cs375 PersonalProjects
cs476 cs499 GeneralJobs`. You can use names, numbers, ranges, or any combination of the formats as a command line argument as well, and then the menu
prompt will be skipped. The `@` option selects all lists, and can also be used as a command line argument.

The Menu Prompt applies to editing, viewing, filtering, and deleting operations decribed below.

Unix wildcard symbols are not supported, so you can't use `cs*` as a placeholder for `cs240 cs350 cs375 cs476 cs499`. You'll get whatever error the
Bash interpreter gets from trying to process that and not having it work with how my script is set up.

#### Creating a New List
`cmdtodo -new`: You can follow this command with the name of the new list. If you do not provide the name, you will be asked for one. If there already
exists a list with that name, you will be asked to provide another name.

#### Deleting Lists
`cmdtodo -del`: If you do not provide command line arguments, the Menu Prompt above will be invoked.

Before deleting each list, you are given the option to print its contents to the console (just to make sure you know what you're deleting)
and then confirm whether or not you'd like to delete. All deletions are final!

#### Editing Lists
`cmdtodo -e`: If you do not provide command line arguments, the Menu Prompt will be invoked.

Opens one or more lists for editing. By default, the text editor is `nano` but you can also use `vim` or `gedit` or really any text editor that can be
invoked from the command line, as long as it can open multiple files passed as command line arguments. You can specify which one to use in the `texteditor` file
in the root directory of this project

#### Viewing List Contents
`cmdtodo -v`: If you do not provide command line arguments, the Menu Prompt above will be invoked.

Prints the list contents to the console. Each list is separated by `==========listname===========`. While you can also view list contents
with the edit command, this one allows you to see them all at once on screen.

#### Filtering List Contents
`cmdtodo -f tag`: If you do not provide further command line arguments (after the tag), the Menu Prompt above will be invoked.

Different items in your list might belong to different 'categories', such as *priorities*, *upcoming exams*, *tasks that will take like 5 minutes*,
*big projects that are due in a while but you should start working on them soon*, etc. The way I solved this was to write a \<tag\> on each line of a certain
category. So for my priority items, each line had \<pr\> somewhere on it. Then to filter out only those lines, I invoked `cmdtodo -f pr`. You assign whatever
meaning you want to the \<tag\>s, the `cmdtodo -f` option just allows you to filter out only those entries.
 
The results are printed to the console in the same format as **Viewing List Contents**.

#### Printing Due Dates
`cmdtodo -dd`: This one does not take any other command line arguments. I haven't made it so you specify which lists, so I just do it for all of them.
If anyone would like me to make it so you can actually change that, post an Issue and then I'll be happy to change it. I just haven't felt
the need to for my uses so far.

Due dates are denoted in my text files by `## ... #`. What's in the `## ... #` doesn't matter, it can be `## monday #` or `## tomorrow #` or 
`## sat 12/14 23:59 #`. This command prints out all of the lists in the same manner as **Viewing List Contents** but only the lines with 
`## ... #` somewhere in them.

## Dependencies
Unix system that can run Bash scripts.

You might notice that Github says that this project includes ~11% Python, but those are currently deprecated files in
my archive folder. The currently functioning part of this application is written in Bash.
