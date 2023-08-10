#!/bin/bash

REPO_DIR="~/git/dotfiles"

cd "$REPO_DIR" || exit

# Update the local repository
git fetch origin
LOCAL_HASH=$(git rev-parse HEAD)
REMOTE_HASH=$(git rev-parse origin/main)

if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
  tmux popup "echo 'Dotfiles update available'"
fi

