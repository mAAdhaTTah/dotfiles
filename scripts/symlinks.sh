#!/usr/bin/env bash

for folder in {Downloads,Documents,Dropbox,Movies,Music,Pictures,Public}; do
	if [ -d "$folder" ]; then
		sudo rm -R ~/"$folder"
	fi
	ln -s /Volumes/yossarian/"$folder" ~/"$folder"
done
unset folder
