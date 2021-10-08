#!/bin/bash
set -x 

echo Taking the dump of oplog.rs collections

read -p "Enter the port of the Primary: " PORT
read -p 'Enter the host name: ' host
read -p "Enter the name of directory to take a dump: " path

mongodump --host ${host} --port ${PORT} -d local -c oplog.rs --out  "${path}"

echo 'Performing A point in time restore'

read -p 'Enter the TimeStap of the operation to restore Eg:1633070519:1  ' timestamp

PWD=`pwd`

cd $PWD/$path/local
mv oplog.rs.bson oplog.bson
cd ..

mongorestore --host ${host} --port ${PORT} --oplogReplay --oplogLimit ${timestamp}  local/
~                                                                                             
