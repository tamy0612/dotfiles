"==========================================================
" vim/autoload/vimrc/lightline.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 16 May. 2018.
"==========================================================
function! vimrc#lightline#mode() abort
  return tolower(s:mode())
endfunction

function! s:mode() abort
  if s:is_filetype('denite')
    return substitute(denite#get_status_mode(), '-\|\s', '', 'g')
  endif
  return lightline#mode()
endfunction


function! vimrc#lightline#paste() abort
  return &paste ? 'paste' : ''
endfunction


function! vimrc#lightline#file_status() abort
  if s:is_filetype('nerdtree')
    return ''
  endif
  return &ro ? 'RO' : !&modifiable ? 'UM' : &modified ? '+' : ''
endfunction


function! vimrc#lightline#filename() abort
  if s:is_filetype('nerdtree')
    return ''
  endif
  if s:is_filetype('denite')
    return denite#get_status_sources()
  endif
  if s:is_filetype('deol')
    return '[deol]'
  endif
  if s:is_buffer('quickfix')
    return '[quickfix]'
  endif
  if s:is_buffer('terminal')
    return printf('[terminal] %s', expand('%:t'))
  endif

  let l:filename = expand('%')
  if strlen(l:filename) == 0
    return (&modifiable ? '[Unsaved]' : '[No name]')
  endif

  let l:width =  winwidth('.') - strlen(l:filename)
  if l:width < 80
    return pathshorten(l:filename)
  endif
  if l:width < 120
    return fnamemodify(l:filename, ':t')
  endif
  return fnamemodify(l:filename, ':~:.')
endfunction


function! vimrc#lightline#lint_info() abort
  try
    let l:counts = ale#statusline#Count(bufnr(''))
  catch
    return ''
  endtry
  let l:errors = l:counts.error + l:counts.style_error
  let l:warnings = l:counts.warning + l:counts.style_warning
  if l:errors || l:warnings
    return printf('%s%d %s%d', g:ale_sign_error, l:error, g:ale_sign_warning, l:warnings)
  endif
  return ''
endfunction


function! vimrc#lightline#git_branch() abort
  try
    let l:branch = gina#component#repo#branch()
  catch
    return ''
  endtry
  if strlen(l:branch)
    return printf('%s %s', l:branch, gina#component#status#preset('fancy'))
  endif
  return ''
endfunction


function! vimrc#lightline#git_status() abort
  if s:is_filetype('help', 'unite', 'denite', 'nerdtree')
    return ''
  endif
  try
    let l:summary = GitGutterGetHunkSummary()
  catch
    return ''
  endtry
  if l:summary == [0, 0, 0]
    return ''
  endif
  return printf('+%d !%d -%d', l:summary[0], l:summary[1], l:summary[2])
endfunction


function! vimrc#lightline#line() abort
  if s:is_filetype('nerdtree', 'help') || s:is_buffer('quickfix')
    return ''
  endif
  if s:is_filetype('denite')
    return denite#get_status_linenr()
  endif
  let l:pos = getpos('.')
  return printf('%3d:%-3d', l:pos[1], l:pos[2])
endfunction


function! s:is_filetype(...) abort
  return &filetype =~ s:reg_join(a:000)
endfunction

function! s:is_buffer(...) abort
  return &buftype =~ s:reg_join(a:000)
endfunction

function! s:reg_join(strs) abort
  return join(a:strs, '\|')
endfunction
" vim:ft=vim:ts=2:sw=2:fdm=marker
