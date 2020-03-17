" command! -nargs=+ Rgrep call ReadGrep(<f-args>)
command! -nargs=+ Rgrep call ReadGrep(<q-args>)

function! ReadGrep(...)
    call clearmatches() 

    " evaluate arguments
    " let l:args = copy(a:000)
    " " let l:arg1 = a:1
    " " let l:arg2 = a:2
    "
    " if a:1 =~ '^\-'
    "
    "     let l:arg2 = shellescape(a:2)
    "     " let l:arg2 = shellescape(fnameescape(l:arg2))
    "     " let l:arg2 = fnameescape(l:arg2)
    "
    "     let l:args[1] = l:arg2
    "     " let l:pattern = l:arg2
    "     let l:pattern = a:2
    " else
    "     let l:arg1 = shellescape(a:1)
    "     " let l:arg1 = shellescape(fnameescape(l:arg1))
    "     " let l:arg1 = fnameescape(l:arg1)
    "
    "     let l:args[0] = l:arg1
    "     " let l:pattern = l:arg1
    "     let l:pattern = a:1
    " endif

    
    let l:cmd = '!grep -rnI --exclude-dir={.svn,.git,.cache,.sass-cache,cache,log,} --exclude={*.swp*,*.swap*,*.svn*,*.git*,*.tmp*,} '
    " let l:cmd = l:cmd . join(l:args, ' ')
    let l:cmd = l:cmd . ' ' . a:1
    " let l:cmd = l:cmd . ' ' . shellescape(a:1)

    " run commands
    if bufname("%") !~ "\.readgrep$"
        execute 'tabnew'
    endif
    execute '%d'

    execute 'read ' . l:cmd

    call append(line(1), 'Command: ' . l:cmd)
    
    execute 'w! ~/.vim/tmp/tmp.readgrep'
    execute '1'
    
    set filetype=goto

    
    " highlight keywords
    let l:pattern = substitute(a:1, '^\-.* ', '', '')
    let l:pattern = substitute(l:pattern, "['\"\\\\]", '', 'g')
    call matchadd('RgrepMatch', l:pattern)
    
endfunction

hi RgrepMatch cterm=bold ctermfg=1
" autocmd BufNewFile,BufRead *.{readgrep} set filetype=grep
autocmd BufNewFile,BufRead *.{readgrep} set filetype=goto

