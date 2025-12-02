#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title e0-git-up
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Dev utils

# Documentation:
# @raycast.author Chaim Platonov

cd ~/dev/env0
git fetch --all -p
git fetch origin master:master
