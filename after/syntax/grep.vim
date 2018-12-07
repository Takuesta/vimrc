" Vim syntax file
" Language: my grep
" Maintainer: me

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful C keywords
syn match grepPath "\v^[^:]*" nextgroup=grepSep
syn match grepSep "\v:" nextgroup=grepLineNr contained
syn match grepLineNr "\v[0-9]*" nextgroup=grepSep contained

syn match grepCommand "\v^Command: .*$"

" The default highlighting.
hi def link grepPath Special
hi def link grepSep Constant
hi def link grepLineNr qfLineNr

hi def link grepCommand cleared

let b:current_syntax = "grep"

" vim: ts=8
