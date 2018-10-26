" limit git commit comment width
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

" quit insert mode and curor right
inoremap <C-c> <C-c><Right>
inoremap <C-l> <C-c><Right>a



