#!/bin/bash

REPO_BASE_DIR=~/Workspace/github.com

#
# dock
#
sudo defaults write com.apple.Dock showhidden -boolean true
killall Dock

#
# vim
#
mkdir -p $REPO_BASE_DIR/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git $REPO_BASE_DIR/Shougo/dein.vim

#
# symlink config files
#
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.vim ~/.vim
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.vimrc ~/.vimrc
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.gvimrc ~/.gvimrc
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.bash_profile ~/.bash_profile
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.inputrc ~/.inputrc
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.gitconfig ~/.gitconfig
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.config/nvim ~/.config/nvim

