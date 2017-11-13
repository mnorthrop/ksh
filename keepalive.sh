#!/bin/ksh
###################################################
# Written by: Mike Northrop
# Purpose: To login to all instances so that the running users username never expires from non-use.
# - This should run monthly on the first day of each month.
# April 28, 2016
#-----------------------------------------------------------
#  Modified: 7/31/2017 - MNW
#    Removed commented out code and writes to log file as now will be run from Autosys.
###################################################
up_instances=$(ccontrol all | grep "up" | awk '{print $2;}')
for i in ${up_instances}
	do
		echo ${i}
		csession ${i} -U %SYS "^%DIR"
	done
# END