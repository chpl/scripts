#!/bin/bash
set -x


# Use the BRANCH_NAME enagent-proxyvironment variable to specify the branch name
BRANCH_NAME=${BRANCH_NAME:-$1}

if [ -z "$BRANCH_NAME" ]; then
  echo "Error: No branch name specified. Please specify a branch name using the BRANCH_NAME environment variable or as the first argument to the script."
  exit 1
fi

git fetch -p
git pull origin master
git branch $BRANCH_NAME master
git checkout $BRANCH_NAME

pnpm i --frozen-lockfile

git commit --allow-empty -m "Empty commit"
git push -u origin $BRANCH_NAME
gh pr create -w