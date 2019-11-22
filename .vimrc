" ------------------------------------------------------------
" Env specific
" ------------------------------------------------------------
if has('nvim')
  let s:dein_dir = '~/.cache/dein'
  set backupdir=~/.cache/nvim/back
  set directory=~/.cache/nvim/swap
  set undodir=~/.cache/nvim/undo
else
  let s:dein_dir = '~/.vim/dein'
  set backupdir=~/.vim/back
  set directory=~/.vim/swap
  set undodir=~/.vim/undo
endif

" ------------------------------------------------------------
" Dein
" https://github.com/Shougo/dein.vim
" install: 
"   :call dein#install()
" remove plugin:
"   :call map(dein#check_clean(), "delete(v:val, 'rf')")  " これをvimrcに追記して起動
"   :call dein#recache_runtimepath()                      " 起動後に実行
" ------------------------------------------------------------
set nocompatible
set runtimepath+=~/Workspace/github.com/Shougo/dein.vim
if dein#load_state(expand(s:dein_dir))
  call dein#begin(expand(s:dein_dir))
  call dein#add('tyru/open-browser.vim')
  call dein#add('tyru/open-browser-github.vim')

  " colorscheme
  call dein#add('tomasr/molokai')
  call dein#add('endel/vim-github-colorscheme')
  call dein#add('altercation/vim-colors-solarized')

  call dein#end()
  call dein#save_state()
endif


" ------------------------------------------------------------
" General
" ------------------------------------------------------------
syntax on
set fileformats=unix,dos,mac
set number
set ruler
set nolist
set lcs=tab:>-,eol:<,trail:-,extends:>
set nowrap
set showcmd
set showmatch
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2
set autochdir
"set list
"set cursorline

" ------------------------------------------------------------
" Encoding
" ------------------------------------------------------------
set enc=utf-8
set fenc=utf-8
set ff=unix
set fencs=utf-8,iso-2022-jp,sjis,euc-jp

" ------------------------------------------------------------
" Color
" ------------------------------------------------------------
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_degrade=1
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic = 1
let g:solarized_contrast = "high"
let g:solarized_visibility= "high"
set background=dark
colorscheme solarized

" ------------------------------------------------------------
" Tab
" ------------------------------------------------------------
set showtabline=2
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" ------------------------------------------------------------
" Filetype specific
" ------------------------------------------------------------
" vue
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html

" Coffee Script
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et

au BufNewFile,BufRead *.md set filetype=markdown expandtab tabstop=4 shiftwidth=4 softtabstop=4
au BufNewFile,BufRead *.jbuilder set filetype=ruby expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.xml set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.html set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.erb set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.rhtml set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.rb    set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.ru    set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.vue    set expandtab tabstop=2 shiftwidth=2 softtabstop=2

" ------------------------------------------------------------
" Search
" ------------------------------------------------------------
set ic
set hlsearch
" 全角スペースをハイライトする
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
" ビジュアルモードでの選択時に * で選択単語を検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" ------------------------------------------------------------
" IME off
" ------------------------------------------------------------
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>
inoremap <silent><CTRL-[> <CTRL-[>:set iminsert=0<CR>
set imdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap :set iminsert=0

