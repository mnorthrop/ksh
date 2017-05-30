#!/bin/ksh
# Written by: Mike Northrop
# Script: /home/scripts/LogCleanup
# Purpose: To purge old data files.
#     This script will remove files older than 1 year from the /home/logs/stats/ directory.

# Define variables
wkDay=`date +%a`
DATE=`date +%Y%m%d %T`
LOG=/home/logs/LogCleanup.${wkDay}.log

# Begin Code
lines=`find /home/logs/stats/ -name "*.log" -mtime +360`
echo $DATE" - Beginning log purge..." > ${LOG}

if [ $? != 0 ]; then
	# Command failed, exit.
	echo "Find command failed." > ${LOG}
	exit
elif [ "${lines}" = "" ]; then
	# No files found, exit.
	echo $DATE" - No files found." > ${LOG}
	exit
else
	# Files found, remove them.
	echo $DATE" - Removing files..." > ${LOG}
	find /home/logs/stats/ -name "*.log" -mtime +360 -exec rm -fr {} \; > ${LOG}
	echo $DATE" - COMPLETED." > ${LOG}
	exit
fi

### END
