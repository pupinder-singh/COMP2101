#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

read -p "Input 1 ? " firstnum
read -p "Input 2 ? " secondnum # Get any three numbers from the user by using read command.
read -p "Input 3 ? " thirdnum
sum=$((firstnum + secondnum + thirdnum))  # Assign the three number's sum into "sum" variable.
product=$((firstnum * secondnum * thirdnum)) # Assign the three number's product into "product" variable.

# summary of variables
cat <<EOF
The sum of $firstnum , $secondnum and $thirdnum numbers is $sum
The product of $firstnum , $secondnum and $thirdnum numbers is $product
EOF
