#!/bin/bash

# Define color codes
COLOR_PINK='\033[1;35m'    # Pink
COLOR_YELLOW='\033[1;33m'  # Yellow
COLOR_GREEN='\033[1;32m'   # Green
COLOR_ORANGE='\033[38;5;214m' # Orange (using 256-color mode)
COLOR_RESET='\033[0m'      # Reset color

echo -e "${COLOR_GREEN}Welcome to git operations automation toolkit. Let's git init, status, add, commit, and push together!${COLOR_RESET}"
sleep 5

echo -e "${COLOR_YELLOW}++++++++    +++    +++++++++++++${COLOR_RESET}"
echo -e "${COLOR_YELLOW}++++++++    +++    +++++++++++++${COLOR_RESET}"
echo -e "${COLOR_PINK}++           +           ++${COLOR_RESET}"
echo -e "${COLOR_PINK}++           +           ++${COLOR_RESET}"
echo -e "${COLOR_PINK}++           +           ++${COLOR_RESET}"
echo -e "${COLOR_PINK}++           +           ++${COLOR_RESET}"
echo -e "${COLOR_PINK}++  +++      +           ++${COLOR_RESET}"
echo -e "${COLOR_PINK}++   ++      +           ++${COLOR_RESET}"
echo -e "${COLOR_PINK}++   ++      +           ++${COLOR_RESET}"
echo -e "${COLOR_ORANGE}+ + +++     +++          ++${COLOR_RESET}"
echo -e "${COLOR_ORANGE}+ + +++     +++          ++${COLOR_RESET}"

echo -e "${COLOR_GREEN}Follow the instructions to complete your task ::${COLOR_RESET}"

echo -e "${COLOR_YELLOW}Enter the current directory name to continue:${COLOR_RESET} \c"
read Directory_Name

if [ "$Directory_Name" ]; then
    cd "$Directory_Name" || { echo -e "${COLOR_PINK}Directory not found! Exiting.${COLOR_RESET}"; exit 1; }
else
    cd "$PWD"
fi

echo -e "${COLOR_GREEN}Initializing git repository...${COLOR_RESET}"
git init

echo -e "${COLOR_YELLOW}Enter the URL of your remote repository where the code will be pushed:${COLOR_RESET}"
echo -e "${COLOR_YELLOW}Remote_URL:${COLOR_RESET}"
read Remote_URL

if [ -z "$Remote_URL" ]; then
    echo -e "${COLOR_PINK}Please provide a valid remote URL.${COLOR_RESET}"
    exit 1
else
    git remote add origin "$Remote_URL"
fi

# Initial add, commit, and push
while true; do
    echo -e "${COLOR_GREEN}Adding all files to staging area...${COLOR_RESET}"
    git add .

    echo -e "${COLOR_YELLOW}Please enter your commit message (or type 'exit' to finish):${COLOR_RESET}"
    echo -e "${COLOR_YELLOW}Commit_Message:${COLOR_RESET}"
    read Commit_Message

    if [ "$Commit_Message" = "exit" ]; then
        echo -e "${COLOR_GREEN}Exiting the script.${COLOR_RESET}"
        break
    elif [ -z "$Commit_Message" ]; then
        echo -e "${COLOR_PINK}Please provide a valid commit message.${COLOR_RESET}"
        continue
    else
        git commit -m "$Commit_Message"
        
        echo -e "${COLOR_GREEN}Pushing the changes to remote repository...${COLOR_RESET}"
        if git push origin master; then
            echo -e "${COLOR_GREEN}Push successful!${COLOR_RESET}"
        else
            echo -e "${COLOR_PINK}Push failed. Attempting to pull changes...${COLOR_RESET}"
            if git pull origin master; then
                echo -e "${COLOR_GREEN}Pull successful! Now pushing again...${COLOR_RESET}"
                git push origin master
            else
                echo -e "${COLOR_PINK}Pull failed. Please resolve conflicts manually.${COLOR_RESET}"
            fi
        fi
    fi
done