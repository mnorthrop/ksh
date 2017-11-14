#!/bin/ksh
###################################################
# Written by: Mike Northrop
# November 14, 2017
###################################################
up_instances=$(/epic/bin/epiccontrol all | grep "RL-UA" | awk '{print $2;}')

for i in ${up_instances}
do
  echo "csession ${i} -U ${i} ^%ZdUSTRT"
  csession ${i} -U ${i} ^%ZdUSTRT
done
