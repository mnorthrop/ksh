#!/bin/ksh
# Written By: Mike Northrop
# Purpose: List Cache users (via Epic cusers script) on many instances without having to specify which instance.
# Date: 5/29/2017
# Parameters: 
#    $1 = username to search for

# If no username provided, prompt for it and exit.
if [[ $# -eq 0 ]];then
    print "Please provide a username."
	exit
fi

user=$1

for i in $(ccontrol qall | awk -F' ' '{print $2}' | tail +3)
    do
	    i=$(echo $i|tr -s '[:upper:]' '[:lower:]')
		/epic/$i/bin/cusers --list --users $user
done

### END