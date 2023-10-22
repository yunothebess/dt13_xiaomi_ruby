#!/bin/bash

# GitHub credentials
USERNAME="yunothebess"
TOKEN="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"  # Replace with your actual personal access token

# GitHub repository information
BRANCH="a13"

# Commits to cherry-pick
COMMITS=("b0fe4a5013e5090d1a1bde9de05bdcb8758c5f31" "7113f0be8b933137a82053c96cc014ee8bf71f5f" "258135ff408b53aa5bb8ef372a66c93bd4ac4f59" "4a56d259ea8bb0e33517675149b3c27e1d146d66" "e97b6a0a51d79acb4c50b9af51dceb73a7a80349")

# Set Git credentials
git config --global credential.helper store
git config --global user.name $USERNAME
git config --global user.email "$USERNAME@users.noreply.github.com"

# Cherry-pick the commits
for commit in "${COMMITS[@]}"; do
  git cherry-pick $commit
done

# Push the changes to GitHub
git push origin $BRANCH

echo "Cherry-picking and pushing completed."
