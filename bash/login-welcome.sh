#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
usr="$USER" # To get username dynamically, we choose the environment variable.
hostname="$(hostname)" # Also for getting hostname dynamically, we use the environment variable.
day=$(date +%A) # From date command, we get the day of the week.
currenttime=$(date +%I:%M\ %p) # Also we have date by using date command.

###############
# Main        #
###############
if [ "$day" = Monday ]; # Testing day name and print message according to this by using if else command.
then
csay="Welcome to planet $hostname, sales associate $usr!"
elif [ "$day" = Tuesday ];
then
csay="Welcome to planet $hostname, scripter $usr!"
elif [ "$day" = Wednesday ];
then
csay="Welcome to planet $hostname, instructor $usr!"
elif [ "$day" = Thursday ];
then
csay="Welcome to planet $hostname, human resource developement $usr!"
elif [ "$day" = Friday ];
then
csay="Welcome to planet $hostname, relience $usr!"
elif [ "$day" = Saturday ];
then
csay="Welcome to planet $hostname, black hat hacker $usr!"
else
csay="Welcome to planet $hostname, youtuber $usr!"
fi
cowsay "$csay It is $currenttime on $day ."
