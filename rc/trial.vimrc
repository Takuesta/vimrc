"
" trial
"

" paste mode for insert mode
imap <silent> <Leader>f <Esc>:set paste<CR><Esc>i
nmap <silent> I :set paste<CR>i


" keep curor position when search string
nmap * *N
vmap * y/<C-R>"<CR>N


" yank current file path
nmap <silent> fp :let @" = expand("%:p") . ' +' . line(".")<CR>:call PassToRpbcopy()<CR>

" pass yank to rpbcopy
function! PassToRpbcopy()
    let l:cmd = 'command -v rpbcopy && cat | rpbcopy'
    call system(l:cmd, @0)
    if v:shell_error > 0
        echo 'error: maybe rpbcopy command not found.'
    else
        echo 'rpbcopy has done.'
    endif
endfunction
imap <silent> <Leader>r :call PassToRpbcopy()<CR>
nmap <silent> Y :call PassToRpbcopy()<CR>
nmap <silent> y y:call PassToRpbcopy()<CR>
vmap <silent> y y:call PassToRpbcopy()<CR>
nmap <silent> yw yw:call PassToRpbcopy()<CR>
nmap <silent> ye ye:call PassToRpbcopy()<CR>
nmap <silent> yy yy:call PassToRpbcopy()<CR>


" limit git commrt comment width
autocmd Filetype gitcommit setlocal spell textwidth=72


" suppress returning shell
command! -nargs=+ S execute 'silent <args>' | redraw!


" autocomplete
"imap <Leader><Tab> <C-x><C-f>
inoremap <Leader><Tab> <C-x><C-f>
inoremap <Tab><Tab> <C-x><C-o>


" close html tag
"iabbrev < </<C-X><C-O>
inoremap <C-k> </<C-X><C-O>


" disable auto comment line
" set formatoptions-=ro
au FileType * set fo-=c fo-=r fo-=o
" set fo-=c fo-=r fo-=o

autocmd FileType html set indentexpr=
autocmd FileType tpl set indentexpr=


cmap <C-j> <Left>
cmap <C-k> <Right>
cmap <S-j> <S-Left>
cmap <S-k> <S-Right>


set keywordprg=:help " Open Vim internal help by K command


"
" unnecessary maybe
"

