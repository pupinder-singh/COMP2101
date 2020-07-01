#!/bin/bash
# This script demonstrates how the shift command works

# create an empty array to put the command line arguments into
myargs=()
#For spotout the stat of the input, generating variables 
verbosevar1=0
debugvar2=0
echo "Myarg array contents: $@"
# loop through the command line arguments
while [ $# -gt 0 ]; do
  # tell the user how many things are left on the command line
  echo "There are $# things left to process on the command line."
  # add whatever is in $1 to the myargs array
  myargs+=("$1")
  # tell the user what we did
  echo "Added \'$1\' to the arguments array"

  # TASK 1: instead of just adding arguments to an array, use a case statement to recognize some options
  echo "Processing the value '$1'."
  # Options to recognize: -h for help, -v for verbose mode, -d N for debug mode with N being a single digit number
  case $1 in
  -h )
	# If the help option is recognized, print out help for the command and exit
    echo 'You added "-h" for help.'
    #echo 'Processing the "-h".'
    echo "Choose -v for Varbose, -d for Debug and debug level within 1 to 5."
	exit
    ;;
  -v )
	# If the verbose option is recognized, set a variable to indicate verbose mode is on
    echo 'You added "-v" for varbose.'
    verbosevar1=1
    ;;
  -d )
	# If the debug optionis recognized, set a variable with the debug level from the number given after the -d on the command line
    echo 'You added "-d" for debug.'
    case $2 in
    [1-5] )
		echo "You added the -d for debug level $2."
		debugvar2=$2
		#For operating the next element, move the command line argument
		shift
		;;
    *)
		# display an error if the user gave the -d option without a single digit number after it
		echo "Error: The debug mode should be between [1-5]. "
		#For operating the next element, move the command line argument
		#shift
		esac
		;;
  *)
  errors=$1
  echo "Error: unkown value found: $errors"
  # Anything that wasn't recognized on the command line should still go into the myargs array
  #For operating the next element, move the command line argument
  #shift
  ;;
  esac
  # each time through the loop, shift the arguments left
  # this decrements the argument count for us
  #For operating the next element, move the command line argument
  shift
  # tell the user we shifted things
  echo "Shifted command line, leaving $# things left to process."
  echo "--------------------------"
  # go back to the top of the loop to see if anything is left to work on
done
echo "Done"
# TASK2: display the settings and myargs contents
# Tell the user if vebose mode is on
# Print out the myargs array with a label
#For checking the stat of the variable, use if condition 
if [ $verbosevar1 = 1 ]; then
  echo "Varbose mode is On."
else
  echo "Varbose mode is Off."
fi
# TASK2: display the settings and myargs contents
# Tell the user if debug mode is on and if it is, what number it is set to
# Print out the myargs array with a label
#For checking the stat of the variable, use if condition 
if [ $debugvar2 -gt 0 ]; then
  echo "Debug Mode is On with debug level $debugvar2."
else
  echo "Debug Mode is Off."
fi

