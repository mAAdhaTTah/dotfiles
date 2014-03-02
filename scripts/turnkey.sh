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

# Add Dropbox start

# Add BTSync start

# Install Z and restore history

echo "Install z from Dropbox via symlink"

ln -s ~/Dropbox/.z ~/.z

# Install gems

source gems.sh

# Add Mackup restore
# Note: we need to ask if we want to keep in sync, or just uninstall

# Add get ~/Sites
# 1. Add private keys (need BTsync) - this will actually not be necessary after .ssh/config is finished
# 2. git clone each site

echo "Let's get OS X's defaults set up the way we like."

source osx.sh

# Add licenses/accounts/config to:
# 0. Alfred
# 1. Bartender
# 2. Cinch
# 3. CleanMyMac
# 4. Coda
# 5. Codekit
# 6. Crash plan - Note: this one need a file edited to access the server's CrashPlan
# 7. Evernote
# 8. F-lux
# 9. Google Chrome
# 10. Insync
# 11. Moneywell
# 12. MindNode Pro
# 13. PokerTracker
# 14. Dupelicate Annihilator
# 15. SuperDuper!
# 16. Thunderbird
# 17. VirtualBox - Note: add synced VirtualBox VMs folder