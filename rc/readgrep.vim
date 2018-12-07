command! -nargs=+ Rgrep call ReadGrep(<f-args>)

function! ReadGrep(...)
    call clearmatches() 

    " evaluate arguments
    let l:args = copy(a:000)
    let l:arg1 = a:1
    let l:arg2 = a:2

    if a:1 =~ '^\-'
        let l:arg2 = fnameescape(l:arg2)
        let l:args[1] = l:arg2
        " let l:pattern = l:arg2
        let l:pattern = a:2
    else
        let l:arg1 = fnameescape(l:arg1)
        let l:args[0] = l:arg1
        " let l:pattern = l:arg1
        let l:pattern = a:1
    endif
    
    let l:cmd = '!grep -rn '
    let l:cmd = l:cmd . join(l:args, ' ')

    " run commands
    if bufname("%") !~ "\.readgrep$"
        execute 'tabnew'
    endif
    execute '%d'

    execute 'read ' . l:cmd

    call append(line(1), 'Command: ' . l:cmd)
    
    execute 'w! ~/.vim/tmp/tmp.readgrep'
    execute '1'
    set filetype=grep

    call matchadd('RgrepMatch', l:pattern)
    
endfunction

hi RgrepMatch cterm=bold ctermfg=1
autocmd BufNewFile,BufRead *.{readgrep} set filetype=grep

