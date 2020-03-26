" Vim syntax file
" Language: goto
" Maintainer: me

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful C keywords
syn match gotoSeq      "\v^[0-9]+"              nextgroup=gotoSep

syn match gotoPath     "\v[^ ]*/*/"             nextgroup=gotoFile
syn match gotoFile     "\v[^/][^:+]*"           nextgroup=gotoSep contained
syn match gotoSep      "\v[:\+] *"              nextgroup=gotoLineNr
syn match gotoLineNr   "\v[0-9\-]+ *"           nextgroup=gotoSep contained

syn match phpPublic    "public"                 nextgroup=phpFunction,phpStatic
syn match phpProtected "protected"              nextgroup=phpFunction,phpStatic
syn match phpPrivate   "private"                nextgroup=phpFunction,phpStatic
syn match phpStatic    "\v *static *"           nextgroup=phpFunction
syn match phpFunction  "\v function " nextgroup=phpMethod
syn match phpMethod    "\v[a-zA-Z0-9_\-]+[^\(]" contained

" " The default highlighting.
hi def link gotoSeq qfLineNr

hi def link gotoPath Special 
hi def link gotoFile Identifier 
hi def link gotoSep Constant
hi def link gotoLineNr qfLineNr

hi def link phpPublic Type
hi phpProtected ctermfg=21
" hi phpPrivate ctermfg=18
hi phpPrivate ctermfg=21
hi def link phpFunction cleared
hi def link phpStatic Type
" hi phpStatic ctermfg=8
hi def link phpMethod Constant

let b:current_syntax = "goto"

