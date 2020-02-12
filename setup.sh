#!/bin/bash

#
# Env
#
REPO_BASE_DIR=~/Workspace/github.com
# spaceを含む場合はフルパスでないと正しく展開されない...？
VSCODE_BASE_DIR="/Users/morrr/Library/Application Support/Code/User"

#
# Font
#
brew tap homebrew/cask-fonts && brew cask install font-fira-code
brew cask install font-inconsolata

#
# Dock
#
sudo defaults write com.apple.Dock showhidden -boolean true
killall Dock

#
# Symlink config files
#
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.vim ~/.vim
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.vimrc ~/.vimrc
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.gvimrc ~/.gvimrc
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.bash_profile ~/.bash_profile
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.inputrc ~/.inputrc
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.zprofile ~/.zprofile
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.gitconfig ~/.gitconfig
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf $REPO_BASE_DIR/morrr/dotfiles/.config/nvim ~/.config/nvim
ln -sf $REPO_BASE_DIR/morrr/dotfiles/vscode.settings.json "$VSCODE_BASE_DIR/settings.json"
ln -sf $REPO_BASE_DIR/morrr/dotfiles/vscode.keybindings.json "$VSCODE_BASE_DIR/keybindings.json"

#
# Vim
#
mkdir -p $REPO_BASE_DIR/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git $REPO_BASE_DIR/Shougo/dein.vim


#
# Visual Studio Code
#
# install extensions
# output: $code --list-extensions > vscode.extensions
cat $REPO_BASE_DIR/morrr/dotfiles/vscode.extensions | while read line
do
 code --install-extension $line
done

# enable key repeat on macos
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

