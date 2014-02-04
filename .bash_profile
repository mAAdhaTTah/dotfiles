# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
# Source: simonowndesign/dotfiles
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Move default data file into ~/.z
export _Z_DATA=$HOME/.z/.data

# init z https://github.com/rupa/z
source ~/.z/z.sh

# Append to the Bash history file, rather than overwriting it
shopt -s histappend
