"==========================================================
" vim/autoload/util/find.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 12 Jan. 2018.
"==========================================================

function! util#find#executable(exe, candidates) abort
    for dir in a:candidates
        if isdirectory(dir)
            let l:path = expand(dir . "/" . a:exe)
            if executable(l:path)
                return l:path
            endif
        endif
    endfor
    if executable(a:exe)
        return a:exe
    endif
    return ""
endfunction
