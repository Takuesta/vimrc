
" add Strikethrough as NOT standard
syn region markdownStrikethrough start="\S\@<=\~\|\~\S\@=" end="\S\@<=\~\|\~\S\@=\|$" keepend contains=markdownLineStart
syn region markdownStrikethrough start="\S\@<=\~\~\|\~\~\S\@=" end="\S\@<=\~\~\|\~\~\S\@=" keepend contains=markdownLineStart
hi def link markdownStrikethrough         Error

syn match specialComment /^\s*x .*/
hi specialComment cterm=NONE ctermfg=22
" the following is deprecated
syn match specialComment /.*\- x .*/
hi specialComment cterm=NONE ctermfg=22

hi Title cterm=NONE ctermfg=33
hi markdownHeadingDelimiter cterm=NONE ctermfg=33
hi markdownItalic cterm=NONE ctermfg=NONE
hi markdownBoldItalic cterm=NONE ctermfg=161
hi markdownError cterm=NONE ctermfg=NONE
hi markdownStrikethrough cterm=NONE ctermfg=22
hi! link markdownBold Normal
hi markdownListMarker cterm=NONE ctermfg=161

