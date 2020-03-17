"
" trial
"

" cmkt special
set sw=2

cnoremap <C-a> <C-b>
cmap <C-b> <Left>
" cmap <C-S-f> <C-f>
cmap <C-f> <Right>
cmap <C-j> <S-Left>
cmap <C-o> <S-Right>

function! FocusLeftAfterClosingTab()
    if winnr("$") == 1 && tabpagenr("$") > 1 && tabpagenr() > 1 && tabpagenr() < tabpagenr("$")
        q | tabprev
    else
        q
    endif
endfunction
cmap q<Leader> :call FocusLeftAfterClosingTab()<CR>

set nosplitright
" set virtualedit=all

cmap f<Leader> function\ 
cmap c<Leader> class\ 
cmap w<Leader> '**'<Left><Left>

vmap <silent> sql :!sql-formatter<CR>:call ChangeSqlCase()<CR>

xnoremap p "_dP
map B "_

autocmd FileType php inoremap <buffer> .. <Space>.<Space>


" open a file path
" nmap t <C-W>gF
nmap tt <C-W>gF
nmap to gF

autocmd BufNewFile,BufRead *.{goto} set filetype=goto


" pass oldfiles to a current buffer
command! Oldfiles 
            \ tabnew ~/.vim/tmp/tmp.oldfiles
            \ | %d
            \ | redir @o
            \ | silent oldfiles
            \ | redir END
            \ | silent put! o
            \ | 1d
            \ | w

" autocmd BufNewFile,BufRead *.{oldfiles} set filetype=oldfiles
autocmd BufNewFile,BufRead *.{oldfiles} set filetype=goto


" limit git comment width
autocmd Filetype gitcommit setlocal spell textwidth=72


" autocomplete
"imap <Leader><Tab> <C-x><C-f>
inoremap <Leader><Tab> <C-x><C-f>
inoremap <Tab><Tab> <C-x><C-o>


" disable auto comment line
" set formatoptions-=ro
au FileType * set fo-=c fo-=r fo-=o
" set fo-=c fo-=r fo-=o

autocmd FileType html set indentexpr=
autocmd FileType tpl set indentexpr=


" set keywordprg=:help " Open Vim internal help by K command


"
" unnecessary maybe
"

" suppress returning shell
command! -nargs=+ S execute 'silent <args>' | redraw!

