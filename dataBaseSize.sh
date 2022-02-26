#!/bin/bash 
mongo -u shoaib -p shoaib --authenticationDatabase admin --quiet --eval "db.adminCommand('listDatabases')"  | grep name | awk '{print $3}' | cut -d '"' -f2 > dbname.txt 

while read dbname
do	
	mongo $dbname --quiet -u shoaib -p shoaib --authenticationDatabase admin --eval "print('dbname','Size') ; print(db,',',db.stats().dataSize)"
done <  dbname.txt 

