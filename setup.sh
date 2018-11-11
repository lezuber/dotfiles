#!/bin/bash


# Symlink the Brewfile hook into this git hooks folder
chmod +x .hooks/pre-commit-brew-bundle-global
ln -s -f ../../.hooks/pre-commit-brew-bundle-global .git/hooks/pre-commit


#key repeat
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
