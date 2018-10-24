" setup plugins manager
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
" set runtimepath^=/Users/Takuya/.vim/dein/repos/github.com/Shougo/dein.vim
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
" call dein#begin(expand('/Users/Takuya/.vim/dein'))
call dein#begin(expand('~/.vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('tyru/caw.vim.git')
call dein#add('haya14busa/incsearch.vim')
call dein#add('thinca/vim-tabrecent')
"call dein#add('mattn/emmet-vim')
"call dein#add('sukima/xmledit')
call dein#add('tomtom/tcomment_vim')
call dein#add('guns/xterm-color-table.vim')


" You can specify revision/branch/tag.
"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

