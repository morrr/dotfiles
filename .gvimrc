" ------------------------------------------------------------
" General
" ------------------------------------------------------------
scriptencoding utf-8
let g:solarized_degrade=0
let g:solarized_contrast = "normal"
let g:solarized_visibility= "normal"


" ------------------------------------------------------------
"  Platform options
" ------------------------------------------------------------
if has ('gui_macvim')
    " ------------------------------------------------------------
    "  OSX
    " ------------------------------------------------------------
    " Set window size
    set columns=140
    set lines=40

    " Set color
    colorscheme solarized
    set background=dark

    " Set font
    set guifont=Menlo:h12
    set linespace=2
    
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


