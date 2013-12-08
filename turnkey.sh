#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"

# Insert commands to install Command Line Tools

# Pause installation
# Tell user to downloads apps from App Store

echo "Download all your apps from the Apple App Store."
echo "Don't worry, I'll wait ;)"
read -p "Press [Enter] when everything is downloaded."

# Install Homebrew

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

# Update Homebrew

brew update

# Check homebrew for problems

brew doctor

# Install all software
brew bundle scripts/Brewfile