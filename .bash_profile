#!/usr/bin/env bash

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
# Source: simonowndesign/dotfiles
for file in ~/.{path,exports,aliases,functions,apps,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Append to the Bash history file, rather than overwriting it
shopt -s histappend
