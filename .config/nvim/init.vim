" .vimrcの設定をそのまま使う
if filereadable(expand('~/.vimrc'))
  source ~/.vimrc
endif
