" Vim syntax file
" Language: My Oldfiles
" Maintainer: me

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful C keywords
syn match oldfilesLineNr "\v^[0-9]*: " nextgroup=oldfilesSep contains=oldfilesSep
syn match oldfilesSep "\v: " nextgroup=oldfilesPath contained
syn match oldfilesPath "\v[^:]*/" nextgroup=oldfilesFile contains=oldfilesFile
syn match oldfilesFile "\v[^/]*$" contained

syn match oldfilesCommand "\v^Command: .*$"

" The default highlighting.
hi def link oldfilesLineNr qfLineNr
hi def link oldfilesSep Constant
hi def link oldfilesPath Special
hi def link oldfilesFile Identifier
hi def link oldfilesCommand cleared

let b:current_syntax = "oldfiles"

" vim: ts=8
