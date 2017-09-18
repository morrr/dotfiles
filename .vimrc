" ************************************************************
" vimrc for mac
" @author morrr
" @version 2017/03/20
" ************************************************************

" ------------------------------------------------------------
" general
" ------------------------------------------------------------
set nocompatible
set fileformats=unix,dos,mac
set backupdir=~/.vim/back
set directory=~/.vim/swap
set undodir=~/.vim/undo

" ------------------------------------------------------------
" encoding
" ------------------------------------------------------------
set enc=utf-8
set fenc=utf-8
set ff=unix
set fencs=utf-8,iso-2022-jp,sjis,euc-jp

" ------------------------------------------------------------
" disp
" ------------------------------------------------------------
"colorscheme solarized
"set background=dark
colorscheme default
let g:solarized_termcolors=256

set number
set ruler
"set list
set nolist
"set cursorline
set lcs=tab:>-,eol:<,trail:-,extends:>
set nowrap
set showcmd
set showmatch
syntax on
set hlsearch
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2

" ------------------------------------------------------------
" tab
" ------------------------------------------------------------
set showtabline=2
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
au BufNewFile,BufRead *.xml set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.html set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.erb set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.rhtml set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.rb    set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.ru    set expandtab tabstop=2 shiftwidth=2 softtabstop=2

" ------------------------------------------------------------
" search
" ------------------------------------------------------------
set ic
" ビジュアルモードでの選択時に * で選択単語を検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" ------------------------------------------------------------
" IME off
" ------------------------------------------------------------
"set noimdisable
"inoremap <silent><ESC> <ESC>:set iminsert=0<CR>
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap :set iminsert=0

" ------------------------------------------------------------
" BufferList.vim
" ------------------------------------------------------------
map <silent> <C-q> :call BufferList()<CR>

" ------------------------------------------------------------
" tags
" ------------------------------------------------------------
set tags=tags
autocmd FileType java set tags+=~/tags/java6
autocmd FileType java set tags+=~/tags/android

" ------------------------------------------------------------
" markdown
" ------------------------------------------------------------
au BufNewFile,BufRead *.md set filetype=markdown

" ------------------------------------------------------------
"  Coffee Script
" ------------------------------------------------------------
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et

