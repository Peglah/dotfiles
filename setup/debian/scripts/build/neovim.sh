#!/bin/bash

sudo nala install -y cmake curl gcc gettext ninja-build npm ripgrep unzip

git clone --depth 1 https://github.com/neovim/neovim /tmp/neovim
cd /tmp/neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd -
nvim --headless "+Lazy! sync" +qa
