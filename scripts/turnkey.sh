#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"

# Pause installation
# Tell user to downloads apps from App Store

echo "Step 1:"
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

read -p "Do you want to use homebrew and cask to install your required software? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  brew bundle Brewfile
fi
unset $REPLY

# Ask for each secondary software

secsoft = ("kext-utility" "kext-wizard" "pokertracker" "a-slower-speed-of-light" "backuploupe" "calibre" "debt-quencher" "duplicate-annihilator" "moneywell" "openemu" "pgadmin3" "picard" "slice-eq" "superduper")

for soft in ${secsoft[@]}; do
  read -p "Do you want to use homebrew and cask to install $soft? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install "$soft"
  fi
  unset $REPLY
done
unset soft
unset secsoft

echo "Activate dotfiles"

source sync.sh

echo "Let's get OS X's defaults set up the way we like."

source osx.sh

# Configure 3 apps
# @todo make into single function

echo "Opening Google Chrome for configuration"
open -a "Google Chrome.app"
read -p "Press [Enter] when everything is configured."

echo "Opening Dropbox for configuration"
open -a "Dropbox.app"
read -p "Press [Enter] when everything is configured."

echo "Opening BTSync for configuration"
open -a "BitTorrent Sync.app"
read -p "Press [Enter] when everything is configured."

read -p "Press [Enter] when everything all three apps are synced."

# Install Z and restore history

echo "Install z from Dropbox via symlink"

ln -s ~/Dropbox/.z ~/.z

# Install gems

source gems.sh

# Add Mackup restore
# Note: we need to ask if we want to keep in sync, or just uninstall
# @todo sync apache in mackup

echo "Time to run Mackup"
mackup restore

read -p "Do you want to uninstall Mackup? This will remove its syncing capabilities. Do this if the username isn't Yossarian. (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  mackup uninstall
fi
unset $REPLY

# Get all ~/Sites

sites = ("git@bitbucket.org:maadhattah/jamesdigioia.git" "git@bitbucket.org:maadhattah/job-hunter.git" "git@github.com:mAAdhaTTah/vagrantpress.git" "git@bitbucket.org:maadhattah/quenchnj.git" "git@github.com:mAAdhaTTah/roots-semantic-codekit.git" "git@github.com:twbs/bootstrap.git")

for url in ${sites[@]}; do
  echo "Getting $url..."
  git clone "$url"
done
unset soft
unset configsoft

# @todo set up databases
# @todo sync databases from remote

# Add licenses/accounts/config

configsoft = ("Alfred Preferences" "Bartender" "Cinch" "CleanMyMac 2" "Coda 2" "CodeKit" "CrashPlan" "Evernote" "Flux" "Insync" "MoneyWell" "MindNode Pro" "PokerTracker 4" "Duplicate Annihilator" "SuperDuper!" "VirtualBox" "mysms" "xScan" "CleanMyDrive" "POP" "Multimon" "Kindle" "Pocket" "Wunderlist" "Google Drive")

for soft in ${configsoft[@]}; do
  read -p "Do you want to configure $soft? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Opening $soft for configuration"
    open -a "$soft.app"
    read -p "Press [Enter] when everything is configured."
  fi
  unset $REPLY
done
unset soft
unset configsoft

# Add OSX accounts
# @todo include account information here (everything but passwords)
# @todo handle mail rules

accounts = ("Google Work" "Google Personal" "Twitter" "Facebook" "LinkedIn" "3 email accounts")

for account in ${accounts[@]}; do
  read -p "Do you want to configure $soft? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p "Press [Enter] when you have configured $account."
  fi
  unset $REPLY
done
unset soft
unset configsoft

# @todo add Terminal to right-click services