#!/bin/bash


#Display the UID
echo "UID: ${UID}"
echo '==================================================================================='

#Display the USERNAME of the Server
USERNAME=`whoami`
echo "USERNAME: ${USERNAME}"
echo '==================================================================================='

#Display the Hostname of the server
echo "HOSTNAME: ${HOSTNAME}"
echo '==================================================================================='

#Display the OS running on the Server
OS=` hostnamectl | sed -n '6p'`
echo "${OS}"
echo '==================================================================================='

#Displaying the users
USERS=`cat /etc/passwd | tail -n10 | awk -F ":" '{print $1}'`
echo "Users: "
echo "${USERS}"
echo '==================================================================================='


#Displaying the No. of CPU cores
CPU=`nproc`
echo 
echo "NO. of CPU Cores are: ${CPU}"

echo '==================================================================================='


#Providing the User to choose 
echo 'Enter 1 to Check the Ram ' 
echo 'Enter 2 to Check the Disk Space Usage '
echo 'Enter 3 to Check the CPU '
echo 'Enter 4 to Check out  the Processes running on your System '

read -p 'Enter the Choice as per your need: ' OPTION

#Storing  the OUTPUT of free -h in RAM
RAM=`free -h`

#Storing  the OUTPUT of df -h in DISK
DISK=`df -h`

#To Check the Process 
PROCESS=`ps -ef`
case "${OPTION}" in 
	"1")    echo
		echo "Ram: "
		echo "${RAM}"
  	;;
        "2")    echo
                echo "Disk: "
                echo "${DISK}"
        ;;

        "3")    echo 
                echo "CPU: "
		top
        ;;
        "4")    echo 
                echo "CPU: "
                echo "${PROCESS}"

        ;;
esac
