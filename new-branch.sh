#!/bin/bash

# Use the BRANCH_NAME environment variable to specify the branch name
BRANCH_NAME="$1"
SOURCE_BRANCH="${2:-master}"

if [ -z "$BRANCH_NAME" ]; then
  echo "Error: No branch name specified. Please specify a branch name using the BRANCH_NAME environment variable or as the first argument to the script."
  exit 1
fi

# Switch to the "master" branch
git checkout $SOURCE_BRANCH

# Pull the latest changes from the "master" branch
git pull origin $SOURCE_BRANCH

# Create the new branch
git branch $BRANCH_NAME

# Switch to the new branch
git checkout $BRANCH_NAME
