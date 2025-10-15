#!/bin/bash

#This gets the full working directory and returns back to directory where the file is.
cd "."

#Look for all the files in the directory and it's subdirectories that has .sh extension and make them executable
find . -type f -name "*.sh" -exec chmod +x {} \;

echo " "
echo "Starting the reminder app...."

#Executing the reminder.sh script from the startup.sh script
./app/reminder.sh
