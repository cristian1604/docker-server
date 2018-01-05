#!/bin/sh

export NVM_DIR="$HOME/.nvm" && cd "$NVM_DIR"

git fetch origin
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`

. "$NVM_DIR/nvm.sh"
