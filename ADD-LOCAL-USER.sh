#!/bin/bash

#This Script creates a new user on the local system


#Make sure the script is being executed with superuser privileges

if [[ "$UID" -ne 0 ]]
then 
	echo'Please run with sudo or as root.'
	exit 1
fi


#Get the Username (Login)
read -p 'Enter the Username to create: ' USERNAME

#Get the realname (Content for the Description)
read -p 'Enter the name of the person or application that will be using this account: ' COMMENT

#Get the Password 
read -p 'Enter the Password to use for the account:  ' PASSWORD

#Which bash;user want to work in
echo '1. /bin/bash'
echo '2. /bin/sh'
read -p 'Enter the name of Bash  from above: ' BASH


#Create the USER 
useradd -c "${COMMENT}" -m "${USERNAME}" -s "${BASH}"

#check to See if the useradd command  succeeded
if [[ echo"${?}" -ne 0 ]]
then 
	echo 'The account could not be Created.'
	exit 1
fi

#Set the password 
echo ${USERNAME}:${PASSWORD} | chpasswd

#check to See if the chpasswd command  succeeded
if [[ echo"${?}" -ne 0 ]]
then
        echo 'The Passowrd could not be Created.'
        exit 1
fi

#Force passwd Change on first login
passwd -e ${USERNAME}

#To Create a specific User with a particular permission
# cd /home/
 #echo 'Enter 1 for Execute Permission :'
# echo 'Enter 2 for Write Permission :'
#echo 'Enter 3 to get Execute and write Permission'
# echo 'Enter 4 for only  Read Permission'
# echo 'Enter 5 to get Read and Execute Permission'
 #echo 'Enter 6 to get Read and write Permission'
# echo 'Enter 7 to get Read,Execute and write Permission'







#Display the username , password and the Host where the user was created.


echo 
echo 'username: '
echo "${USERNAME}"
echo
echo 
echo 'passwprd: '
echo "${PASSWORD}"
echo
echo 
echo 'host: '
echo "${HOSTNAME}"
echo
exit 0
