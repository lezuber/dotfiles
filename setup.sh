#!/bin/bash

params="-sf"

# Store where the script was called from so we can reference it later
script_home="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlink all of our dotfiles to the home directory
for i in .antigenrc .gitconfig .gitignore_global .zshrc;
do
  ln $params $script_home/$i $HOME/$i
done

# Symlink nvim config
ln $params $script_home/init.vim $HOME/.config/nvim/init.vim

# Symlink the Brewfile hook into this git hooks folder
chmod +x $script_home/.hooks/pre-commit-brew-bundle-global
ln -s -f $script_home/.hooks/pre-commit-brew-bundle-global $script_home/.git/hooks/pre-commit

#key repeat
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
