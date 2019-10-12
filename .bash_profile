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
# Color
#
export TERM=xterm-256color
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

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
# 環境依存の設定は.bashrcに記述する方針とする
#
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
