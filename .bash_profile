# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
# Source: simonowndesign/dotfiles
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# init z https://github.com/rupa/z
. ~/.z/z.sh

# Move default data file into ~/.z
export Z_DATA=$HOME/.z/.data

# Append to the Bash history file, rather than overwriting it
shopt -s histappend
