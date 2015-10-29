#!/usr/bin/env bash

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
# Source: simonowndesign/dotfiles
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Load NVM, if we're using it
export NVM_DIR="/Users/USNY-JDiGioia/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Automatically check for identity updates before running a git command
if which karn > /dev/null; then eval "$(karn init)"; fi
