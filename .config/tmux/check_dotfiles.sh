#!/bin/bash

REPO_DIR="$HOME/git/Peglah/dotfiles"

cd "$REPO_DIR" || exit

# Update the local repository
git fetch origin
LOCAL_HASH=$(git rev-parse HEAD)
REMOTE_HASH=$(git rev-parse origin/main)

if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
  tmux popup -w27 -h4 "echo 'Dotfiles update available'"
#else
#  tmux popup -w27 -h4 "echo 'Dotfiles are up to date'"
fi

