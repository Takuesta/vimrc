" Vim syntax file
" Language: goto for php
" Maintainer: me

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful C keywords
syn match phpSeq       "\v^\s+\[[0-9]+\]\s\=\> " nextgroup=phpPath
syn match phpPath      "\v[^:]*"                 nextgroup=phpSep contained
syn match phpSep       ":"                       nextgroup=grepLineNr contained
syn match grepLineNr   "\v[0-9\-]+ "             nextgroup=phpPublic,phpProtected,phpPrivate contained
syn match phpPublic    "public"                  nextgroup=phpFunction contained
syn match phpProtected "protected"               nextgroup=phpFunction contained
syn match phpPrivate   "private"                 nextgroup=phpFunction contained
syn match phpFunction  "\v [static ]*function "  nextgroup=phpMethod contained
syn match phpMethod    "\v[a-zA-Z0-9_\-]+[^\(]" contained

" The default highlighting.
hi def link phpSeq cleared
hi def link phpPath Special
hi def link phpSep Constant
hi def link grepLineNr qfLineNr
hi def link phpPublic Identifier
hi def link phpProtected Type
hi def link phpPrivate Directory
hi def link phpFunction Directory
" hi def link phpFunction WarningMsg
" hi def link phpFunction Keyword
" hi def link phpFunction cleared
" hi def link phpFunction LineNr 
hi def link phpMethod Constant
" hi def link phpMethod WarningMsg

let b:current_syntax = "phpgoto"

