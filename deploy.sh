#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# get the current commit sha
GIT_COMMIT_SHA=`git rev-parse --verify HEAD` 
GIT_COMMIT_SHA_SHORT=`git rev-parse --short HEAD`

# Build the project.
hugo -t beautifulhugo

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..