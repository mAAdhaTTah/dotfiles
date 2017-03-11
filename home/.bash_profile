#!/usr/bin/env bash

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
# Source: simonowndesign/dotfiles
for file in ~/.{path,exports,aliases,functions,apps,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
