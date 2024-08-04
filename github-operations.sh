#!/bin/bash

echo "Welcome to git operations automation toolkit. Let's git init, status, add, commit, and push together!"
Sleep  3

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

echo -e "Enter the current directory name to continue : \c"
read Directory_Name

if [ -f "$Directory_Name" ]; then

cd $Directory_Name
else
cd $PWD
fi

echo "Initializing git repository..."
git init


echo "Enter the Url of your remote repository where the codes will be pushed :.."
echo "Remote_URL :"
read Remote_URL

if [ "Remote_URL" = "$NULL" ]; then
    echo "Please provide a valid remote URL."
elif [ -u "$Remote_URL" ]; then
git remote add origin $Remote_URL
fi


echo "Adding all files to staging area..."
git add .


echo "Please enter your commit message"
echo "Commit_Message:"
read Commit_Message

if [ "Commit_Message" = "$NULL" ]; then
    echo "Please provide a valid commit message."
elif [ "Commit_Message" = "$commit_message" ]; then
git commit -m "$Commit_Message"
echo "$commit_Message"
fi	


echo "Pushing the changes to remote repository..."
git push -u origin 