#!/usr/bin/env bash

npms=( "bower" )

for npm in ${npms[@]}; do
	npm install -g "$npm"
done
unset npm
unset npms
