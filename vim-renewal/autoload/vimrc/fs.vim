function! vimrc#fs#mkdir_unless_exist(dirname) abort
  if !isdirectory(a:dirname)
    call vimrc#log#normal('Create directory: ' . a:dirname)
    call mkdir(a:dirname, 'p')
  endif
endfunction

function! vimrc#fs#mklink(src, dst) abort
  call system(join(['ln', '-s', a:src, a:dst], ' '))
endfunction

function! vimrc#fs#auto_mkdir_on_write(dir, cmdbang) abort
  if !isdirectory(a:dir)
        \ && (
        \   a:cmdbang
        \   || input(printf('"%s" does not exist. Create? [y/N] : ', a:dir)) =~? '^y\%[es]$'
        \ )
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

function! vimrc#fs#relative_filepath() abort
  return expand('%:s:p:.')
endfunction

function! vimrc#fs#find_nearest_parent_dir(from, target) abort
  let l:path = finddir(a:target, a:from . ';')
  if empty(l:path)
    return ''
  endif
  return fnamemodify(l:path, ':p')
endfunction

function! vimrc#fs#find_executable(cmd, ...) abort
  if vimrc#executable(a:cmd)
    return a:cmd
  endif
  let l:candidate_dirs = get(a:000, 0, [])
  for candidate_dir in l:candidate_dirs
    let l:path = expand(join([candidate_dir, a:cmd], '/'))
    if vimrc#executable(l:path)
      return l:path
    endif
  endfor
  call vimrc#log#error('Command not found: ' . a:cmd)
  return ''
endfunction
