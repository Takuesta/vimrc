command! -nargs=+ Rfind call ReadFind(<f-args>)

function! ReadFind(...)
    " evaluate arguments
    let l:cmd = '!find '
    let l:cmd = l:cmd . join(a:000, ' ')

    " run commands
    if bufname("%") !~ "\.readfind$"
        execute 'tabnew'
    endif
    execute '%d'

    execute 'read ' . l:cmd
    
    call append(line(1), 'Command: ' . l:cmd)
    
    execute 'w! ~/.vim/tmp/tmp.readfind'
    execute '1'
    
    " set filetype=oldfiles
    set filetype=goto
    
endfunction

" autocmd BufNewFile,BufRead *.{readfind} set filetype=oldfiles
autocmd BufNewFile,BufRead *.{readfind} set filetype=goto

