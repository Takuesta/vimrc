"
" basic setup
"
syntax on
colorscheme default

" To suppress 'no newline at end of file' message for git.
" It is necessary to locate before 'set expandtab'.
set noeol
set binary

set number
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2
set whichwrap=b,s,h,l,<,>,[,]
set nowrap

set directory^=$HOME/.vim/tmp

set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileformats=unix,mac,dos

set ignorecase
set smartcase
set incsearch


set timeoutlen=400
set ttimeoutlen=0

" share clipboard
set clipboard=unnamed


"
" basic operation
"
" ecs
" to prevent removing indent on empty line
inoremap <silent> <Esc> <Left><Esc><Right>

" In the case of pressing <Esc> at once, map is not fine working when a file is opened.
nnoremap <silent> <Esc><Esc> <Esc>:noh <bar>:set nopaste<CR>

nnoremap <silent> <F2> :set invpaste<CR>

" change a paste mode on insert mode
imap <silent> <Leader><Leader> <Esc>:set paste<CR><Esc>a
nmap <silent> I :set paste<CR>i



noremap U <C-r>

noremap <C-p> "0p

noremap <Space> <C-d>
noremap <M-Space> <C-u>

map <C-j> <C-e>
map <C-k> <C-y>

" noremap z zz

" jump one char
inoremap <C-l> <C-c><Right>a


"
" statusline
"
set laststatus=2 

set statusline=
set statusline+=%{CheckPasteMode()}
set statusline+=%F
set statusline+=\ [%l/%L]
set statusline+=\ %p%%
set statusline+=\ %=[%{getcwd()}]

function! CheckPasteMode()
    let paste_status = &paste
    if paste_status == 1
        return " [PASTE MODE] "
    else
        return ""
    endif
endfunction


" yank a current file path
nmap <silent> fp :let @" = expand("%:p") . ' +' . line(".")<CR>:call PassToRpbcopy()<CR>


" pass a yank to the rpbcopy
function! PassToRpbcopy()
    let l:cmd = 'command -v rpbcopy && cat | rpbcopy'
    call system(l:cmd, @0)
    if v:shell_error > 0
        echo 'error: maybe rpbcopy command not found.'
    else
        echo 'rpbcopy has done.'
    endif
endfunction
nmap <silent> <Leader>r :call PassToRpbcopy()<CR>
nmap <silent> Y :call PassToRpbcopy()<CR>
nmap <silent> y y:call PassToRpbcopy()<CR>
vmap <silent> y y:call PassToRpbcopy()<CR>
nmap <silent> yw yw:call PassToRpbcopy()<CR>
nmap <silent> ye ye:call PassToRpbcopy()<CR>
nmap <silent> yy yy:call PassToRpbcopy()<CR>


" close html tag
"iabbrev < </<C-X><C-O>
inoremap <C-k> </<C-X><C-O>


"
" highlight
"
hi LineNr ctermfg=8 ctermbg=233
hi MatchParen cterm=none ctermbg=235
" current line
set cursorline
hi CursorLine cterm=NONE ctermbg=232
" hi CursorLine cterm=NONE ctermbg=53
"autocmd InsertEnter,InsertLeave * set nocursorline!
" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=0
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=232
" autocmd InsertLeave * highlight  CursorLine ctermbg=53
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" select color to visual mode
hi Visual cterm=NONE ctermbg=236


" for search
set hlsearch
"hi Search cterm=NONE ctermfg=15 ctermbg=197
hi Search cterm=NONE ctermfg=15 ctermbg=197
hi IncSearch cterm=NONE ctermfg=0 ctermbg=255

" keep a curor position when search a string
nmap * *N
vmap * y/<C-R>"<CR>N



" to visible a none visible text
set list
"set listchars=tab:>-,eol:¶
set listchars=tab:>-
hi NonText cterm=NONE ctermfg=233
hi SpecialKey cterm=NONE ctermfg=233

" php
hi Comment ctermfg=22
hi Constant ctermfg=161
hi Type ctermfg=33
hi phpTodo cterm=bold ctermfg=24 ctermbg=NONE
hi phpConstant ctermfg=33
hi phpBoolean ctermfg=33
" hi phpFunctions ctermfg=166
hi phpFunctions ctermfg=172

" html
hi htmlLink cterm=NONE

" sass
hi sassTodo cterm=bold ctermfg=24 ctermbg=NONE

" tpl
au BufReadPost *.tpl set syntax=html

" if you want to override markdown configuration, edit .vim/after/syntax/markdown.vim 
autocmd BufNewFile,BufRead *.{md,txt} set filetype=markdown

" Hin: Show highlight item name under a cursor                                                                
" command! Hin echo synIDattr(synID(line("."), col("."), 1), "name")
function! DisplayHighlightInfo()
    " let l:name = synIDattr(synID(line("."), col("."), 1), "name")
    execute 'hi' synIDattr(synID(line("."), col("."), 1), "name")
endfunction
command! Hi call DisplayHighlightInfo()


"
" autocomplete
"
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType tpl set omnifunc=htmlcomplete#CompleteTags
autocmd FileType smarty set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS


"
" auto brackts
"
inoremap { {}<Left>
inoremap {{ {
inoremap {} {}
inoremap [ []<Left>
inoremap [[ [
inoremap [] []
inoremap ( ()<Left>
inoremap (( (
inoremap () ()
inoremap ' ''<Left>
inoremap '' '
inoremap " ""<Left>
inoremap "" "
inoremap ` ``<Left>
inoremap `` `


"
" netrw
"
let g:netrw_liststyle = 3
let g:netrw_list_hide='.*\.swp$,^\..*$'
" suppress 'Press Enter or type command to continue' message
"set shortmess=a
"set cmdheight=2
"let g:bufferline_echo=0
":silent Exp
let g:netrw_silent = 1


"
" search keyword
"
" incsearch.vim is necessary.
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" search selected word
vnoremap * "zy:let @/ = @z<CR>n
" enable vi-regex always
"nnoremap / /\v


"
" split window
"
nnoremap sw <C-w>
noremap s<Bslash> <C-w><Bar>
noremap s= <C-w>=
" adjust width and height
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
  map <C-Left> <C-W><
  map <C-Right> <C-W>>
endif


"
" tab
"
" nmap [tab] <nop>
map s <nop>
noremap sr :TabRecent<CR>
noremap sn gt
noremap ss gt
noremap sp gT
noremap st :tabrewind<CR>
noremap sf :tabn2<CR>
noremap sl :tablast<CR>
" noremap so :tabonly<CR>

" netrw (necessary for mac only?)
autocmd filetype netrw noremap <buffer> ss gt

nmap sd <C-w>T
" nmap sm :Tabmerge {tabindex} right<Space>
nmap sm : right <HOME>Tabmerge {i}

nmap tn :tabnew<CR>
nmap th :tab help<Space>


" diff
set diffopt=vertical,iwhite 

highlight DiffAdd ctermfg=221 ctermbg=167                                                                                                         
highlight DiffDelete ctermfg=221 ctermbg=239
highlight DiffChange ctermfg=221 ctermbg=23
highlight DiffText cterm=none ctermfg=221 ctermbg=167


"
" grep 
"
set grepprg=grep\ -rnI\ --color
            \\ --exclude-dir={.svn,.git,.cache,.sass-cache,cache,log,}
            \\ --exclude={*.swp*,*.swap*,*.svn*,*.git*,*.tmp*,}
autocmd QuickFixCmdPost *grep* cwindow 
" set switchbuf+=usetab,newtab
autocmd FileType qf nnoremap <buffer> <CR> <CR>zz<C-W>p
autocmd FileType qf nnoremap <buffer> t <CR>zz<C-w>T
autocmd FileType qf nnoremap <silent> ]c :cnext<CR><C-W>p
autocmd FileType qf nnoremap <silent> [c :cprevious<CR><C-W>p
hi qfFileName ctermfg=127
hi qfLineNr ctermfg=2