#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"

# Pause installation
# Tell user to downloads apps from App Store

echo "Download all your apps from the Apple App Store."
echo "Don't worry, I'll wait ;)"
read -p "Press [Enter] when everything is downloaded."
read -p "Now, open Xcode and accept the license. Press [Enter] when you've done that."
read -p "Don't forget to install Command Line Tools!"

echo "Next up: Homebrew!"

# Install Homebrew

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Check Homebrew for problems

brew doctor

read -p "Fix any problems before moving on. Press [Enter] if you're good to go."

# Install all software

read -p "Do you want to use homebrew and cask to install all your software? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
        brew bundle Brewfile
fi
unset $REPLY

# Install gems
# capistrano
# capistrno-composer
# bundler

# Add Mackup restore
# Note: we need to ask if we want to keep in sync, or just uninstall
# We could get our ssh keys this way, but that seems like bad practice

# Add Dropbox start

# Add BTSync start

# Add get ~/Sites
# 1. Add private keys (need BTsync)
# 2. git clone each site

echo "Activate dotfiles"

source sync.sh

echo "Let's get OS X's defaults set up the way we like."

source osx.sh

# Install Z and restore history

read -p "This is going to install Z. Do you want Z installed? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
        ln -s ~/Dropbox/.z ~/.z
fi
unset $REPLY