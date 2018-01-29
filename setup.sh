#!/bin/bash

#
# dock
#
sudo defaults write com.apple.Dock showhidden -boolean true
killall Dock

#
# vim
#
mkdir -p ~/Workspace/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git \
    ~/Workspace/github.com/Shougo/dein.vim

#
# rc
#
ln -sf ~/Workspace/github.com/morrr/dotfiles/.vim ~/.vim
ln -sf ~/Workspace/github.com/morrr/dotfiles/.vimrc ~/.vimrc
ln -sf ~/Workspace/github.com/morrr/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/Workspace/github.com/morrr/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/Workspace/github.com/morrr/dotfiles/.inputrc ~/.inputrc
ln -sf ~/Workspace/github.com/morrr/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/Workspace/github.com/morrr/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/Workspace/github.com/morrr/dotfiles/.tmux.conf ~/.tmux.conf

