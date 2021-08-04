#!/bin/bash

#To Check The UID of the User 
echo "the UID of the Current User is :  ${UID}"

#To Display the Curent USERNAME 
USERNAME=`id -un` 
echo "The USERNAME is ${USERNAME}"

RAM=`free -h`
echo "Ram : ${RAM}"
