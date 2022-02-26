#!/bin/bash 


read -p "Type YES if you want to include CONFIG,LOCAL,ADMIN or NO to Exclude" CHECK

if [[ $CHECK == "YES" ]] ; then 
mongo -u shoaib -p shoaib --authenticationDatabase admin --quiet --eval "db.adminCommand('listDatabases')"  | grep name | awk '{print $3}' | cut -d '"' -f2 > dbname.txt

else

mongo -u shoaib -p shoaib --authenticationDatabase admin --quiet --eval "db.adminCommand('listDatabases')"  | grep name | awk '{print $3}' | cut -d '"' -f2 | grep -v 'config\|admin\|local' > dbname.txt

fi  

while read db
do
	mongo $db -u shoaib -p shoaib --authenticationDatabase admin --quiet --eval " var CollName = db.getCollectionNames() ;for(var i=0;i<CollName.length;i++){var name = CollName[i] ; print(db[name] + ' - ') ;printjson(db[name].stats().storageSize)}"
done < dbname.txt 

