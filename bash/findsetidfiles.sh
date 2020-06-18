#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turned on
# it is for the lab1 exercise
# it uses the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files are sorted by their owner

# Task 1 for the exercise is to modify it to also find and display the setgid files in a second listing
# The second listing should display after the setuid file list, and be formatted similar to the
# setuid file list including having a title
# use the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files should be sorted by their group

# Task 2 for the exercise is to modify it to also display the 10 largest regular files in the system, sorted by their sizes
# The listing should only have the file name, owner, and size in MBytes and be displayed after the listings of
# setuid and setgid files and should have its own title
# use the find command to generate the list of files with their sizes, with an error redirect to /dev/null
# use cut or awk to display only the output desired

echo "Setuid files:"
echo "============="
find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 3
echo ""
echo "Setgid files:"
echo "============="
find / -type f -executable -perm -2000 -ls 2>/dev/null | sort -k 6
# For sorting by their group we use sort -k 6
# It helps the setgid files finds and display in a second listing and with /dev/null we can easily access inaccessible
# directories and files without having any error.
echo ""
echo "Largest 10 files in system are:"
echo "==============================="
find / -type f -exec ls -alh 2>/dev/null --block-size=M {} \; | sort -hr -k5 | head -n 10 | awk '{print $5, $3, $9}'
# To display the 10 largest regular files first make our own to title after setuid and setgid files and then use find command to
# generate the list, ignore the errors by redirecting them to /dev/null
# For converting size in MB we need block size and ls command will implement by {} \; 
# sorting for 5th column by using sort command, after displays 10 files use awk command to display the desired outputs i.e file name,
# owner and size in MB.
echo ""
