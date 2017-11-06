#!/bin/ksh
# Script to clean up a directory by removing any files that have not been modified in the last 90 days AND not accessed
# in the last 30 days.
#
# Usage: /nfs/epiccommon/scripts/file_cleanup.ksh <filesystem>
# Authors:  Mike Northrop

filesystem="$1"

# If no argument, exit
if [[ $# -eq 0 ]];then
        print "\nPlease provide a directory.\n"
        print "Example: ./file_cleanup.ksh /epic/extract/\n"
        exit
fi

# find $filesystem -type f -mtime +90 -atime +30 -exec ls -l {} \;
# Return total size of files found in MB
totalsize=$(find $1 -type f -mtime +90 -atime +30 -ls | awk '{total+=$7} END{printf("%d MB\n", total/1048576)}')
print "Total size to be saved: "$totalsize"\n"
print "Proceed? <y/N>"
read answer
case $answer in
        yes|Yes|y|Y)
                find $filesystem -type f -mtime +90 -atime +30 -exec rm -f {} \;
                print "File clean-up complete."
                exit
                ;;
        no|n|N|"")
                exit
                ;;
esac
