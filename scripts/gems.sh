#!/usr/bin/env bash

gems=( "bundler" "capistrano" "capistrano-composer" )

for gem in ${gems[@]}; do
	gem install "$gem"
done
unset gem
unset gems
