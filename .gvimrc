" ************************************************************
" gvimrc
" @author morrr
" @version 2017/03/20
" ************************************************************
scriptencoding utf-8

" ------------------------------------------------------------
"  Platform options
" ------------------------------------------------------------
if has ('gui_macvim')
    " ------------------------------------------------------------
    "  OSX
    " ------------------------------------------------------------
    " Set imdisable
    "set transparency=5

    " Set window size
    set columns=140
    set lines=40

    " Set color
    colorscheme solarized
    set background=dark

    " Set IME
    "inoremap <silent><ESC> <ESC>:set iminsert=0<CR>

    " Set font
    set guifont=Menlo:h12
    set linespace=2
    "set guifont=Menlo-Regular:h18
    "set guifont=Menlo-Bold:h13
    "set guifont=Menlo-Bold:h14
    "set guifont=Osaka-Mono:h20
    "set guifontwide=Osaka-Mono:h13
    "set guifont=MigMix\ 1M:h17
    "set guifontwide=MigMix\ 1M:h12
    
    set guioptions-=r
    set guioptions-=L
else
    " ------------------------------------------------------------
    "  Win
    " ------------------------------------------------------------
    " Set color
    colorscheme wombat "wombat vitamins ir_black wombat
    " Set font
    set guifont=M+\ 2VM+\ IPAG\ circle\ 10
    set linespace=0
endif

" ------------------------------------------------------------
"  Beep off
" ------------------------------------------------------------
set visualbell t_vb=

" ------------------------------------------------------------
"  Toolbar options
" ------------------------------------------------------------
" hide toolbar
set guioptions-=T
" hide menubar
"set guioptions-=m

" ------------------------------------------------------------
"  Tab options
" ------------------------------------------------------------
function! GuiTabLabel()
    let l:label = ''
    let l:bufnrlist = tabpagebuflist(v:lnum)
    let l:bufname = fnamemodify(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')
    let l:label .= l:bufname == '' ? 'No title' : l:bufname
    let l:wincount = tabpagewinnr(v:lnum, '$')
    if l:wincount > 1
        let l:label .= '[' . l:wincount . ']'
    endif
    for bufnr in l:bufnrlist
        if getbufvar(bufnr, "&modified")
            let l:label .= '[+]'
            break
        endif
    endfor
    return l:label
endfunction
set guitablabel=%N:\ %{GuiTabLabel()}

" ------------------------------------------------------------
"  Windowsize options
" ------------------------------------------------------------
let g:save_window_file = expand('~/.vim/winpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END
if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif


