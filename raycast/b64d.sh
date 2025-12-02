#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title base64 decode
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Dev utils

# Documentation:
# @raycast.author Chaim Platonov

pbpaste | base64 -d
