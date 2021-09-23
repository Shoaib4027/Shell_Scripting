#!/bin/bash

#This Script send a mail if the disk space of "/" is higher than threshold
var=`df / | grep / | awk '{ print $5}' | sed 's/%//g'`

free_space=`expr 100 - $var`

#Comparing the Threshold
if [[ "${var}" -gt  85  ]] 
then
	echo -e "This is the System Generated Mail \n Disk Space: ${var}% \n Remaining Disk Space:  ${free_space}% \n   $(date +%A,%d/%m/%Y)" | mail -s "Disk Space Alert" shoaibreign54@gmail.com 
fi
