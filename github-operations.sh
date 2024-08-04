#!/bin/bash

echo "Welcome to git operations automation toolkit. Let's git init, status, add, commit, and push together!"
sleep 5

echo "++++++++    +++    +++++++++++++"
echo "++++++++    +++    +++++++++++++"
echo "++           +           ++"
echo "++           +           ++"
echo "++           +           ++"
echo "++           +           ++"
echo "++  +++      +           ++"
echo "++   ++      +           ++"
echo "++   ++      +           ++"
echo "+ + +++     +++          ++"
echo "+ + +++     +++          ++"

echo "Follow the instructions to complete your task ::"

echo -e "Enter the current directory name to continue: \c"
read Directory_Name

if [ -n "$Directory_Name" ]; then
    cd "$Directory_Name" || { echo "Directory not found! Exiting..."; exit 1; }
else
    cd "$PWD" || { echo "Current directory cannot be accessed! Exiting..."; exit 1; }
fi

echo "Initializing git repository..."
git init

echo "Enter the URL of your remote repository where the code will be pushed:"
echo -e "Remote_URL: \c"
read Remote_URL

if [ -z "$Remote_URL" ]; then
    echo "Please provide a valid remote URL."
else
    git remote add origin "$Remote_URL" || { echo "Failed to add remote repository! Exiting..."; exit 1; }
fi

echo "Adding all files to the staging area..."
git add .

echo "Please enter your commit message:"
echo -e "Commit_Message: \c"
read Commit_Message

if [ -z "$Commit_Message" ]; then
    echo "Please provide a valid commit message."
else
    git commit -m "$Commit_Message" || { echo "Commit failed! Exiting..."; exit 1; }
fi

echo "Pushing the changes to the remote repository..."
git push -u origin main || { echo "Push failed! Exiting..."; exit 1; }

echo "Git operations completed successfully."
