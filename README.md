This is a shell scripting and automation project. 

The project idea: Asignment submission reminder app that reminds students who have not submitted their assignment the number of days left before the deadline by checking the status.

The execution process: This app prompts a student to enter his/her name when the ./create_environment.sh is executed and when the name is entered it creates a directory called submission_reminder_"nameentered" and create subdirectories and files in it and append their contents such
app/reminder.sh, assets/submission.txt, config/config.env, modules/functions and startup.sh.

When the ./startup.sh is executed, it will show the students who haven't submitted the assignment that is currently registered in config/config.env and tell them the number of days left which is also registered in the config/config.env file.

Updating assignment: To update the current assignment name to a different name, you will run the ./copilot_shell_script.sh file and it will prompt you to enter an assignment name, when the assignment name is entered, it will undate the assignment name that currently exist in config/config.env and when the ./startup.sh file is executed, it will display assignment status based on the data in  the config/config.env.

 


