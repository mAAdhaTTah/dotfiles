#!/usr/bin/env bash
cd $HOME

for folder in ~/{Downloads,Documents,Dropbox,Movies,Music,Pictures,Public,Ubuntu\ One}; do
	sudo rm -R "$file" && ln -s /Volumes/yossarian/"$file"
done
unset folder

cd "$(dirname "${BASH_SOURCE}")"