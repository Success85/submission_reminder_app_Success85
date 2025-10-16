#!/bin/bash

# Creating assignment reminder app. This script creates the directory structure.

#Prompt user(student) to enter their name
read -p "What is your name: " yourname

echo "Starting reminder app environment...."

submission_dir="submission_reminder_$yourname"

mkdir -p ./$submission_dir

mkdir -p ./$submission_dir/app
mkdir -p ./$submission_dir/modules
mkdir -p ./$submission_dir/assets
mkdir -p ./$submission_dir/config

#Creating required files for each of the directories both the main directory and the subdir
#The cat << END syntax is used to easily write multiline documents within another script
#reminder.sh file
cat << 'END' > ./$submission_dir/app/reminder.sh
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

cat << 'END' > ./$submission_dir/modules/functions.sh
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


#Creating assets/submission.txt file
cat << 'END' > ./$submission_dir/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Paul, Git, not submitted
Lizzy, Python, submitted
Grace, vi, not submitted
Irene, emacs, submitted
Ambrose, Shell Basics, not submitted
END


#Creating config.env file in the config folder
cat << 'END' > ./$submission_dir/config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
END


#Creating startup.sh file
cat << 'END' > ./$submission_dir/startup.sh
#!/bin/bash
#The condition created below checks if all the necessary files in the environment exists.

if [ -f ./app/reminder.sh ] && [ -f ./modules/functions.sh ] && [ -f ./config/config.env ] && [ -f ./assets/submissions.txt ]; then
        ./app/reminder.sh

else
        echo "Your Environment is incomplete."
        echo "Please delete your current environment and create a new one"
fi

END

#Look for all the files in the directory and it's subdirectories that has .sh extension and make them executable
find ./$submission_dir -type f -name "*.sh" -exec chmod +x {} \;
#The above command recursively grants execute permissions to all shell scripts in the environment and its sub directories.

echo "Your environment has been created successfully!"


