#!/bin/bash

sudo nala install -y stow

shopt -s dotglob
mv $HOME/.config/* $HOME/git/Peglah/dotfiles/.config/
rmdir $HOME/.config

#if [ -f "$HOME/.bashrc" ]; then
#    rm $HOME/.bashrc
#fi
#
#if [ -f "$HOME/.bash_profile" ]; then
#    rm $HOME/.bash_profile
#fi

cd $HOME/git/Peglah/dotfiles
stow . -t $HOME
#ln -s $HOME/git/Peglah/dotfiles/.local/bin/ $HOME/.local/bin
cd -

mv $HOME/.bash_profile $HOME/.bashrc
source $HOME/.bashrc
