function! s:search_path(exe, paths) abort
  for dir in a:paths
    let l:candidate = {'dir': expand(dir), 'exe': expand(dir.'/'.a:exe)}
    if isdirectory(l:candidate.dir) && executable(l:candidate.exe)
      return l:candidate.exe
    endif
  endfor
  return executable(a:exe) ? a:exe : ''
endfunction


if IsNVim()
  let g:python3_host_prog = s:search_path('python3', [
              \  $PYENV_ROOT.'/versions/neovim3/bin', $PYENV_ROOT.'/shims'
              \])
  let g:python_host_prog  = s:search_path('python', [
              \  $PYENV_ROOT.'/versions/neovim2/bin', $PYENV_ROOT.'/shims'
              \])
else
  let g:python3_host_prog = s:search_path('python3', [
              \  $PYENV_ROOT.'/shims'
              \])
  if g:python3_host_prog != ''
    let g:loaded_python_provider = 1
    let g:python_host_skip_check = 1
  else
    let g:python_host_prog = s:search_path('python', [
                \  $PYENV_ROOT.'/shims'
                \])
  endif
endif
