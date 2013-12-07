#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"

# Stop installation
# Tell user to downloads apps from App Store
# Reminder about XCode
# Tips n shit to start

read -p "Press [Enter] when everything is downloads."

# Install homebrew

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

# Check homebrew for problems

brew doctor

# Install all software
cd scripts
brew bundle Brewfile

