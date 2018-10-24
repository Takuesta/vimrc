" basic setup
"hi Normal ctermbg=0 ctermfg=255
"hi Normal guibg=Black guifg=White
syntax on
set number
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2
set whichwrap=b,s,h,l,<,>,[,]
set nowrap

nnoremap <silent> <F2> :set invpaste<CR>

"
" statusline
"
set statusline=
set statusline+=%{PasteForStatusline()}
set statusline+=%F
set statusline+=\ [%l/%L]
set statusline+=\ %p%%
set laststatus=2 

function! PasteForStatusline()
    let paste_status = &paste
    if paste_status == 1
        return " [PASTE MODE] "
    else
        return ""
    endif
endfunction

" search
"nnoremap / /\v

hi LineNr ctermfg=8 ctermbg=233
hi MatchParen cterm=none ctermbg=235

" highlight current line
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

" select color on visual mode
hi Visual cterm=NONE ctermbg=236

" to search
set hlsearch
"hi Search cterm=NONE ctermfg=15 ctermbg=197
hi Search cterm=NONE ctermfg=15 ctermbg=197
hi IncSearch cterm=NONE ctermfg=0 ctermbg=255

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

" html
hi htmlLink cterm=NONE

" sass
hi sassTodo cterm=bold ctermfg=24 ctermbg=NONE

" tpl
au BufReadPost *.tpl set syntax=html

" Edit .vim/after/syntax/markdown.vim if override markdown configuration.
autocmd BufNewFile,BufRead *.{md,txt} set filetype=markdown

" Hin: Show highlight item name under a cursor
command! Hin echo synIDattr(synID(line("."), col("."), 1), "name")

" on split view, adjust width and height
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
  map <C-Left> <C-W><
  map <C-Right> <C-W>>
endif

" for incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" search selected word
vnoremap * "zy:let @/ = @z<CR>n

" show by tree
let g:netrw_liststyle = 3
let g:netrw_list_hide='.*\.swp$,^\..*$'
" suppress 'Press Enter or type command to continue' message
"set shortmess=a
"set cmdheight=2
"let g:bufferline_echo=0
":silent Exp
let g:netrw_silent = 1


" autocomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType tpl set omnifunc=htmlcomplete#CompleteTags
autocmd FileType smarty set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS

