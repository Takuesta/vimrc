" Vim color file

" This is the default my color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "my_default"

"
hi LineNr ctermfg=8 ctermbg=233

"
hi CursorLine cterm=NONE ctermbg=232
hi CursorLineNR cterm=NONE
" hi CursorLineNR cterm=NONE ctermfg=208
" Change a color when entering to Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=0
" Revert a color to default when leaving from Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=232

" selected text color in visual mode
hi Visual cterm=NONE ctermbg=236

" search
hi Search cterm=NONE ctermfg=15 ctermbg=197
hi IncSearch cterm=NONE ctermfg=0 ctermbg=255

" paired bracket
hi MatchParen cterm=none ctermbg=235

" none visible text
hi NonText cterm=NONE ctermfg=233
hi SpecialKey cterm=NONE ctermfg=233

"
" for the file types
"
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

" diff
highlight DiffAdd ctermfg=221 ctermbg=167                                                                                                         
highlight DiffDelete ctermfg=221 ctermbg=239
highlight DiffChange ctermfg=221 ctermbg=23
highlight DiffText cterm=none ctermfg=221 ctermbg=167

" grep
hi qfFileName ctermfg=127
hi qfLineNr ctermfg=2

