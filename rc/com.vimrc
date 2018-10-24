set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileformats=unix,mac,dos

set ignorecase
set smartcase
set incsearch

" share clipboard
set clipboard=unnamed

" ecs
" to prevent removing indent on empty line & escape paste mode
inoremap <silent> <Esc> <Left><Esc><Right>
nnoremap <silent> <Esc><Esc> <Esc>:noh <bar>:set nopaste<CR>

noremap U <C-r>

noremap <C-p> "0p

noremap <Space> <C-d>
noremap <M-Space> <C-u>

map <C-j> <C-e>
map <C-k> <C-y>

" noremap z zz

set timeoutlen=400
set ttimeoutlen=0

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

" to search
"set hlsearch
"nnoremap / /\v    "enable regex

