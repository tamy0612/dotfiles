"==========================================================
" vim/config/dein/rc/lightline.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 08 May. 2018.
"==========================================================
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], ['filestatus', 'filename']],
      \   'right': [['lineinfo'], ['gitinfo', 'gitstatus'], ['lint']]
      \ },
      \ 'inactive': {
      \   'left': [['filestatus', 'filename']],
      \   'right': [['gitinfo', 'gitstatus']]
      \ },
      \ 'component_function': {
      \   'mode': 'LightlineMode',
      \   'paste': 'LightlinePaste',
      \   'filestatus': 'LightlineFileStatus',
      \   'filename': 'LightlineFilename',
      \   'lint': 'ALEGetStatusLine',
      \   'gitstatus': 'LightlineGitStatus',
      \   'gitinfo': 'LightlineGitinfo',
      \   'lineinfo': 'LightlineLineinfo'
      \ }
      \}


function! LightlineMode() abort
  let l:mode = lightline#mode()
  if &ft =~ 'denite'
    let l:mode = substitute(denite#get_status_mode(), '-\|\s', '', 'g')
  endif
  return tolower(l:mode)
endfunction


function! LightlinePaste() abort
  return &paste ? 'paste' : ''
endfunction


function! LightlineFileStatus() abort
  if &ft =~ 'nerdtree'
    return ''
  endif
  return &ro ? 'RO' : !&modifiable ? 'UM' : &modified ? '+' : ''
endfunction


function! LightlineFilename() abort
  if &ft =~ 'nerdtree'
    return ''
  endif
  if &ft =~ 'denite'
    return denite#get_status_sources()
  endif
  if &ft =~ 'deol'
    return '[deol]'
  endif
  if &buftype =~ 'quickfix'
    return '[quickfix]'
  endif
  if &buftype =~ 'terminal'
    return printf('[terminal] %s', expand('%:t'))
  endif

  let l:filename = expand('%')
  if strlen(l:filename) == 0
    return (&modified ? '[Unsaved]' : '[No Name]')
  endif

  if winwidth('.') - strlen(l:filename) > 120
    return fnamemodify(l:filename, ':~:.')
  elseif winwidth('.') - strlen(l:filename) > 80
    return fnamemodify(l:filename, ':t')
  else
    return pathshorten(l:filename)
  endif
endfunction


function! LightlineLineinfo() abort
  if &ft =~ 'nerdtree' || &buftype =~ 'terminal'
    return ''
  endif
  if &ft =~ 'denite'
    return denite#get_status_linenr()
  endif
  let l:cpos = getpos('.')
  return printf('%3d:%-2d', l:cpos[1], l:cpos[2])
endfunction


function! LightlineGitinfo() abort
  if &ft =~ 'nerdtree'
    return ''
  endif

  if strlen(gina#component#repo#branch())
    return gina#component#repo#branch() . ' ' . gina#component#status#preset('fancy')
  endif
  return '[untracked]'
endfunction


function! LightlineGitStatus() abort
  if &ft =~ 'help\|unite\|denite\|nerdtree'
    return ''
  endif

  let l:gitinfo = []
  try
    let l:summary = GitGutterGetHunkSummary()
  catch
    return ''
  endtry
  let l:symbols = [
        \   g:gitgutter_sign_added,
        \   g:gitgutter_sign_modified,
        \   g:gitgutter_sign_removed
        \ ]
  for i in [0,1,2]
    call add(l:gitinfo, l:summary[i] . l:symbols[i])
  endfor

  return len(l:gitinfo) ? join(l:gitinfo, ' ') : ''
endfunction
" vim:ft=vim:ts=2:sw=2:fdm=marker
