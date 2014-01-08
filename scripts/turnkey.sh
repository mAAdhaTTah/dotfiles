#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"

echo 'We are going to assume this is running from your newly downloaded Ubuntu One folder.'
read -p 'If it is not, stop it now, download and sync Ubuntu One, and start over. Want to stop? (y/n) ' -n 1
if [[ $REPLY =~ ^[Yy]$ ]]; then
		exit
fi

echo ''
echo 'First things first:'
echo 'Activate dotfiles!'

source sync.sh

echo "Next, let's get OS X's defaults set up the way we like."

source osx.sh

# Install Z and restore history

read -p "This is going to install Z. Do you want Z installed? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
        ln -s ~/Sites/dotfiles/mAAdhaTTah/dotfiles/.z ~/.z
fi
unset $REPLY

# Pause installation
# Tell user to downloads apps from App Store

echo 'Download all your apps from the Apple App Store.'
echo 'Don't worry, I'll wait ;)'
read -p "Press [Enter] when everything is downloaded."
read -p "Now, open Xcode and accept the license. Press [Enter] when you've done that."
read -p "Don't forget to install Command Line Tools!"

echo 'Next up: Homebrew!'

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
        echo 'Add "/usr/local/bin/bash" to "/etc/shells"'
        echo 'Check out https://github.com/Homebrew/homebrew/wiki/Gems%2C-Eggs-and-Perl-Modules for Ruby and Python stuff'
fi
unset $REPLY

# Need to figure out how to deal with ruby gems
# Currently, we're using `brew gem [package]`, but maybe move back into `gem [package]`
# We do need to add Capistrano, but it's not necessary for completion

# Symlinks files from home folder to network drive

read -p "This will symlink your home directory to network drive locations. Do you want your home directory symlinked? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
        source symlinks.sh
fi
unset $REPLY

# Add Mackup stuff
# This is also not necessary for completion

# Remind me what I still have to do to get set up

echo 'To do:'
echo '* Add licenses'
echo '* Restore ~/Sites'
