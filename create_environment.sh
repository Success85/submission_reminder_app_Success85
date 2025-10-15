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

#modules/functions.sh
cat <<END > $submission_dir/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

END

#assets/submission.txt
cat <<END > $submission_dir/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Keza, Python Basics, submitted
Tobi, Python Loops, not submitted
Chidera, Python functions, not submitted
Charity, SQL Basics, submitted
Ayobami, Java, not submitted
END

#config/config.env
cat <<END > $submission_dir/config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
END

#startup.sh
cat <<END > $submission_dir/startup.sh
#!/bin/bash

#This gets the full working directory and returns back to directory where the file is.
cd "$(dirname "$0")"

#Look for all the files in the directory and it's subdirectories that has .sh extension and make them executable
find . -type f -name "*.sh" -exec chmod +x {} \;

echo " "
echo "Starting the reminder app...."

#Executing the reminder.sh script from the startup.sh script
./app/reminder.sh
END

#Makes the startup.sh file executable
chmod +x "$submission_dir/startup.sh"

#Make this "submission_reminder_nameentered" and all of its content automatic created for every user who enters their name.

#Make the startup.sh file executable

#And startup makes all other files with .sh extension executable

#Add at least 5 users for better functionality testing.

#Over to the copilot_shell_script.sh to continue...
#.
