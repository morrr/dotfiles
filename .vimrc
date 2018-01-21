" ------------------------------------------------------------
" General
" ------------------------------------------------------------
syntax on
set nocompatible
set fileformats=unix,dos,mac
set backupdir=~/.vim/back
set directory=~/.vim/swap
set undodir=~/.vim/undo
set number
set ruler
set nolist
set lcs=tab:>-,eol:<,trail:-,extends:>
set nowrap
set showcmd
set showmatch
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2
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
colorscheme default
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_degrade=1
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic = 1
let g:solarized_contrast = "high"
let g:solarized_visibility= "high"

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
" Filetype-Specified
" ------------------------------------------------------------
" Web
au BufNewFile,BufRead *.xml set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.html set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.erb set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.rhtml set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.rb    set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.ru    set expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Markdown
au BufNewFile,BufRead *.md set filetype=markdown

" Coffee Script
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et

" Plugin
filetype plugin indent on


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
" Dein
" https://github.com/Shougo/dein.vim
" ------------------------------------------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/Workspace/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))

  call dein#add('Shougo/neocomplcache.vim')
  call dein#add('Shougo/vimproc.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/unite.vim')

  call dein#end()
  call dein#save_state()
endif

" ------------------------------------------------------------
" Neocomplecache
" https://github.com/Shougo/neocomplcache.vim
" ------------------------------------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

" Dictionary
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
\ }

" Keywords
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Keymap
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


