#
# General
#
set -o vi

#
# Alias
#
alias ls='ls -aFhG'
alias lf='ls -alFhG'
alias cls='clear'

#
# Color / Theme
#
export TERM=xterm-256color
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
ZSH_THEME="agnoster"
DEFAULT_USER=$USER

#
# Input
#
autoload -U compinit; compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

#
# rbenv
#
export PATH=$HOME/.rbenv/shims:$PATH

#
# Rails
#
export EDITOR=vim

#
# pyenv
#
export PATH=$HOME/.pyenv/shims:$PATH

#
# golang
#
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin


#
# nvm
#
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

#
# vim
#
export PATH=/Applications/MacVim.app/Contents/bin:$PATH

#
# neovim
#
export XDG_CONFIG_HOME="$HOME/.config"

#
# Docker
#
export SSH_AUTH_SOCK=~/.ssh/id_rsa_github

#
# 環境依存の設定は.zshrcに記述する方針とする
#
if [ -f ~/.zshrc ]; then
  . ~/.zshrc
fi
