#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same
# it also demonstrates using conditional execution

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data (i.e. TestString)
# TASK 2: Improve it by rewriting it to use the if command
#         The if command should test if they got it right, in which case it should tell them they got it right
#         The if command should tell them they got it wrong
# TASK 3: Improve it by giving them 5 tries to get it right before failing
#           *** Do not use the exit command, and do not use a loop (e.g. while or for)

successful="You found the secret."
failure="It's not what we're looking for. Try again."
referenceString="123456789" # For assigning password, generate a variale. 
read -s -p "Guess The Password:" myString # For password, acuqire userinput and store it in $myString
echo
# To examine the authentication of input or not equating it with $referenceString, use if-else command five times
if [ $myString = $referenceString ]; then 
  echo "$successful"
  echo
else
  echo "$failure"
  read -s -p "Guess the password:" myString
if [ $myString = $referenceString ]; then
  echo "$successful"
  echo
else
  echo
  echo "$failure"
  read -s -p "Guess the password:" myString
if [ $myString = $referenceString ]; then
  echo "$successful"
  echo
else
  echo
  echo "$failure"
  read -s -p "Guess the password:" myString
if [ $myString = $referenceString ]; then
  echo "$successful"
  echo
else
  echo
  echo "$failure"
  read -s -p "Guess the password:" myString
if [ $myString = $referenceString ]; then
  echo "$successful"
  echo
else
  echo
  echo "Failed attempt.."
fi
fi
fi
fi
fi
