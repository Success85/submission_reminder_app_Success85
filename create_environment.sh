#!/bin/bash

# Creating assignment reminder app. This script creates the directory structure.

#The pseudocode/steps:

#Prompt user(student) to enter their name 
read -p "Enter you name:" yourname
echo $yourname
#Create directory named (submission_reminder_nameentered) for every user that enters his/her name
mkdir -p "submission_reminder_$yourname"
submission_dir="./submission_reminder_$yourname"

#Creating the required subdirectories if they doesn't exist
mkdir -p "$submission_dir/app"
mkdir -p "$submission_dir/modules"
mkdir -p "$submission_dir/assets"
mkdir -p "$submission_dir/config"

#Creating required files for each of the directories both the main directory and the subdirectories
touch "$submission_dir/app/reminder.sh"
touch "$submission_dir/modules/functions.sh"
touch "$submission_dir/assets/submissions.txt"
touch "$submission_dir/config/config.env"
touch "$submission_dir/startup.sh"

#Copy the code from the attached files and paste in the files created.

#reminder.sh file
cat <<END > $submission_dir/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
END


#Make this "submission_reminder_nameentered" and all of its content automatic created for every user who enters their name.

#Make the startup.sh file executable

#And startup makes all other files with .sh extension executable

#Add at least 5 users for better functionality testing.

#Over to the copilot_shell_script.sh to continue...
#.
