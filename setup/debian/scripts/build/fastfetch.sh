#!/bin/bash

set -euo pipefail

sudo nala install -y cmake g++ pkg-config

git clone --depth 1 https://github.com/fastfetch-cli/fastfetch /tmp/fastfetch
mkdir -p /tmp/fastfetch/build
cd /tmp/fastfetch/build
cmake ..
cmake --build . --target fastfetch
sudo cp fastfetch /usr/local/bin/
rm -rf /tmp/fastfetch/
cd -
