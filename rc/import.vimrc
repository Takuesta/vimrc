source ~/.vim/rc/dein.vimrc
source ~/.vim/rc/com.vimrc
source ~/.vim/rc/std.vimrc
source ~/.vim/rc/tabline.vimrc


"
" trial settings
" 
set directory^=$HOME/.vim/tmp//

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

" for split
nnoremap sw <C-w>
noremap s<Bslash> <C-w><Bar>
noremap s= <C-w>=

" for tab & netrw
map s <nop>
noremap sr :TabRecent<CR>
noremap sn gt
noremap ss gt
autocmd filetype netrw noremap <buffer> ss gt
noremap sp gT
noremap st :tabrewind<CR>
noremap sf :tabn2<CR>
noremap sl :tablast<CR>
noremap so :tabonly<CR>


" autocmd filetype netrw nmap <buffer> ss gt
" nmap [tab] <nop>
" nmap s [tab]
" nmap [tab]r :TabRecent<CR>
" nmap [tab]n gt
" nmap [tab]s gt
" " autocmd filetype netrw nmap <buffer> [tab]s gt
" nmap [tab]p gT
" nmap [tab]t :tabrewind<CR>
" nmap [tab]f :tabn2<CR>
" nmap [tab]l :tablast<CR>
" nmap [tab]o :tabonly<CR>

nmap sd <C-w>T
nmap sm :Tabmerge {tabindex} right<Space>

nmap tn :tabnew<Space>
nmap th :tab help<Space>


cmap <C-j> <Left>
cmap <C-k> <Right>
cmap <S-j> <S-Left>
cmap <S-k> <S-Right>


" diff
set diffopt=vertical,iwhite 

highlight DiffAdd ctermfg=221 ctermbg=167                                                                                                         
highlight DiffDelete ctermfg=221 ctermbg=239
highlight DiffChange ctermfg=221 ctermbg=23
highlight DiffText cterm=none ctermfg=221 ctermbg=167

" grep 
set grepprg=grep\ -rnI\ --color
            \\ --exclude-dir={.svn,.git,.cache,.sass-cache}
            \\ --exclude={*.swp*,*.swap*,*.svn*,*.git*,*.tmp*}
autocmd QuickFixCmdPost *grep* cwindow
" set switchbuf+=usetab,newtab
autocmd FileType qf nnoremap <buffer> <CR> <CR>zz<C-W>p
autocmd FileType qf nnoremap <buffer> t <CR>zz<C-w>T
autocmd FileType qf nnoremap <silent> ]c :cnext<CR><C-W>p
autocmd FileType qf nnoremap <silent> [c :cprevious<CR><C-W>p
hi qfFileName ctermfg=127
hi qfLineNr ctermfg=2

autocmd Filetype gitcommit setlocal spell textwidth=72 " for git

"
" unnecessary maybe
"
set keywordprg=:help " Open Vim internal help by K command
" cnoremap <S-q> q!

" quit insert mode and curor right
inoremap <C-c> <C-c><Right>
inoremap <C-l> <C-c><Right>a


