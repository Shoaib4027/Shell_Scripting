#!/bin/bash
mongo -u shoaib -p shoaib --authenticationDatabase admin --quiet --eval "db.adminCommand('listDatabases')"  | grep name | awk '{print $3}' | cut -d '"' -f2 > dbname.txt


while read db
do 
mongo $db -u shoaib -p shoaib --authenticationDatabase admin --quiet --eval 'db.getCollectionNames().forEach(function(collection){ indexes = db[collection].getIndexes(); print("Index for " + collection + ":"); printjson(indexes);})'


done < dbname.txt
