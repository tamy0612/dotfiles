"==========================================================
" vim/rc/fzf.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 03 Mar. 2019.
"==========================================================
let g:fzf_layout = {'down': '~30%'}
let g:fzf_action = {
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \}

function! s:wrap(opt) abort
  return extend(a:opt, get(g:, 'fzf_layout', {}))
endfunction

function! s:grep() abort
  let s:rg_executable = get(s:, 'rg_executable', executable('rg'))
  let l:input = input("Pattern: ")
  if s:rg_executable
    execute 'Rg ' . l:input
  else
    execute 'Ag ' . l:input
  endif
endfunction

function! s:file_mru() abort
  call fzf#run(<sid>wrap(fzf#vim#with_preview({
        \ 'source':  filter(map(v:oldfiles, "fnamemodify(v:val, ':.')"), "filereadable(v:val)"),
        \ 'sink':    'e',
        \ 'options': '-m -x +s'
        \})))
endfunction

function! s:registers(bang) abort
  call fzf#run(<sid>wrap({
        \ 'source': <sid>reglist(),
        \ 'sink': function('<sid>handle_register', [a:bang])
        \}))
endfunction

let s:tags = [
      \ '"',
      \ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
      \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
      \ 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
      \ 'u', 'v', 'w', 'x', 'y', 'z',
      \ '-', '.', ':', '#', '%', '/', '='
      \]
if has('clipboard')
  let s:tags = extend(['+', '*'], s:tags)
endif

function! s:reglist() abort
  let l:reglist = []
  for tag in s:tags
    let l:word = getreg(tag)
    if !empty(l:word)
      let l:reglist += [tag . ': ' . substitute(l:word, '\n', '  ', 'g')]
    endif
  endfor
  return l:reglist
endfunction

function! s:handle_register(bang, e) abort
  let l:oldreg = {'content': getreg('"'), 'type': getregtype('"')}
  let l:target = split(a:e, ':')[0]
  let l:word   = getreg(l:target)
  let l:type   = getregtype(l:target)
  call setreg('"', l:word, l:type)
  try
    if a:bang
      normal! @"
    else
      normal! ""p
    endif
  finally
    call setreg('"', l:oldreg.content, l:oldreg.type)
  endtry
endfunction

command! -bang -nargs=? -complete=dir Files     call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command!                              MFiles    call <sid>file_mru()
command! -bang                        Registers call <sid>registers(<bang>0)
command!                              Grep      call <sid>grep()
command!                              Buffers   call fzf#vim#buffers(fzf#vim#with_preview())

nmap <silent> <Leader>f :Files<CR>
nmap <silent> <Leader>l :BLines<CR>
nmap <silent> <Leader>L :Lines<CR>
nmap <silent> <Leader>b :Buffers<CR>
nmap <silent> <Leader>g :Grep<CR>
nmap <silent> q: :History:<CR>
" vim:ft=vim:ts=2:sw=2:fdm=marker
