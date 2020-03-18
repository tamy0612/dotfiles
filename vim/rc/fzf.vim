"==========================================================
" vim/rc/fzf.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 18 Mar. 2020.
"==========================================================
let g:fzf_layout = {'down': '~40%'}
let g:fzf_action = {
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \}

function! s:wrap(opt) abort
  return extend(a:opt, get(g:, 'fzf_layout', {}))
endfunction

function! s:grep(arg, bang) abort
  let l:input = empty(a:arg) ? input("Pattern: ") : a:arg
  if vimrc#is_executable('rg')
    call fzf#vim#grep(
        \ 'rg --column --line-number --no-heading --color=always ' . shellescape(l:input),
        \ 1, fzf#vim#with_preview(), a:bang)
  elseif vimrc#is_executable('ag')
    call fzf#vim#grep(
        \ 'ag --no-group --column --noheading --color ' . shellescape(l:input),
        \ 1, fzf#vim#with_preview(), a:bang)
  else
    echomsg "[ERROR] install 'rg' or 'ag' command"
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
        \ 'sink': function('s:handle_register', [a:bang])
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

function! s:tabs() abort
  return fzf#run(<sid>wrap({
        \ 'source': <sid>tablist(),
        \ 'sink': function('s:handle_tab')
        \}))
endfunction

function! s:tablist() abort
  let l:tablist = []
  for l:tab in split(execute('tabs'), '\n')
    let l:page = matchstr(l:tab, '^Tab page')
    if !empty(l:page)
      let l:page_num = matchstr(l:tab, '[0-9]*$')
    else
      let l:tablist = add(l:tablist, printf('%d %s', l:page_num, l:tab))
    endif
  endfor
  return l:tablist
endfunction

function! s:handle_tab(tab) abort
  let l:tab_num = split(a:tab, '\s')[0]
  execute 'normal! ' . l:tab_num . 'gt'
endfunction

command! -bang -nargs=? -complete=dir Files     call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command!                              MFiles    call <sid>file_mru()
command! -bang                        Registers call <sid>registers(<bang>0)
command! -bang -nargs=*               Grep      call <sid>grep(<q-args>, <bang>0)
command!                              Buffers   call fzf#vim#buffers(fzf#vim#with_preview())
command!       -nargs=0               Tabs      call <sid>tabs()

nmap <silent> <Leader>f :Files<CR>
nmap <silent> <Leader>l :BLines<CR>
nmap <silent> <Leader>L :Lines<CR>
nmap <silent> <Leader>b :Buffers<CR>
nmap <silent> <Leader>g :Grep<CR>
nmap <silent> q: :History:<CR>
" vim:ft=vim:ts=2:sw=2:fdm=marker
