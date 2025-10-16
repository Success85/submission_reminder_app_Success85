#!/bin/bash

#Checks for all the directories that matches the value of user_dir variable
user_dir=(./submission_reminder_*)

if [ ${user_dir[0]} == "./submission_reminder_*" ]; then
        echo "Submission environments can't be found."
        echo "Creating a new environment"
        ./create_environment.sh
        echo "   "
        echo "Processing copilot_shell_script.sh..."
        ./copilot_shell_script.sh


else
        #Updating the environs

        for dir_name in "${user_dir[@]}"; do

                echo -e "The $dir_name environment exists."
                read -p "Enter assignment name: " assign_name
                assignments=("Shell Navigation" "Git" "Shell Basics" "vi" "Emacs" "Python")
                is_assignment="false"

                #Checking if assignment entered exists
                for assignment in "${assignments[@]}"; do
                        if [[ "$assign_name" == "$assignment" ]]; then
                                is_assignment="true"
                                break
                        else
                                :

                        fi
                done
		  if [ $is_assignment == "false" ]; then
                        echo "Invalid assignment name!"
                        echo "Check assignment names are case-sensitive. Try again!"
                        echo "  "
                        echo "__________________________________________"

		 elif [ ! -f ./$dir/config/config.env ]; then
                        echo "No config.env file found..."
                        echo "Kindly run create_environment.sh file to continue..."
                        echo "__________________________________________"

                else
                        sed -i "2cASSIGNMENT=\"$assign_name\"" "$dir/config/config.env"
                        echo "Updated config file!"
                        echo "Navigate to $dir and run startup.sh file...."
                        echo "___________________________________________"
fi

        done

fi

#Test and push
