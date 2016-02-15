#!/bin/bash

echo -n Enter cPanel Host:
read cpanelHost


echo -n Enter cPanel Username:
read cpanelUser

echo -n Enter Server Password: 
read -s password

todaysDate=$(date +%Y-%m-%d)
mkdir -p /Users/$USER/Desktop/backups/$todaysDate;

/Applications/XAMPP/xamppfiles/bin/mysql --user=$cpanelUser --host=$cpanelHost -p$password -e 'show databases' | while read dbname; do /Applications/XAMPP/xamppfiles/bin/mysqldump --user=$cpanelUser --host=$cpanelHost -p$password --complete-insert "$dbname" | gzip -c > "/Users/$USER/Desktop/backups/$todaysDate/$dbname-$todaysDate$(date +%H.%M.%S).sql.gz"; done
