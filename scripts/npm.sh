#!/usr/bin/env bash

# install these npm packages globally
if which node > /dev/null
  # if node is installed install npm globally  
  then
    echo "Node is installed! Installing npm and required packages globally"
    npm install --global npm jsonlint eslint nodemon node-sass
    # Don't allow devs to "fix" npm vulnerabilities for now
    npm set audit false
  else 
    echo "Node is not installed, visit: https://nodejs.org and install the LTS for your system"
    echo "After installation, rerun this script"
fi
