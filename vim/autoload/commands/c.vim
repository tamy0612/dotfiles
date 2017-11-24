"==========================================================
" vim/autoload/commands/c.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 24 Nov. 2017.
"==========================================================
function! commands#c#update_include_guard(...) abort
    let l:cursor = getcurpos()
    let l:guard = get(a:, 1, toupper(expand("%:gs?\\.?_?:s?^src\/??:gs?\/?_?:p:.")))
    call setpos('.', [bufnr('.'), 0, 0, 0])
    let l:target = matchlist(getline(search('^#ifndef', 'n')), '^#ifndef \(.\+_H\(PP\)*\)')
    if !empty(l:target)
        execute '%s/' . l:target[1] . '/' . l:guard . '/g'
    else
        echomsg 'include guard not found.'
    endif
    call setpos('.', l:cursor)
endfunction
