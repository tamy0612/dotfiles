"==========================================================
" vim/autoload/vimrc/template/scala.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" License: MIT License
"==========================================================

let g:template_scala_package_ignore_dirs = get(g:, 'template_scala_package_ignore_dirs', [])
call extend(g:template_scala_package_ignore_dirs, ['.', 'src', 'scala', 'main', 'test'])
call uniq(g:template_scala_package_ignore_dirs)

function! vimrc#template#scala#package(path) abort
  let l:paths = split(a:path, '/')
  for l:ignore_dir in g:template_scala_package_ignore_dirs
    let l:index = index(l:paths, l:ignore_dir)
    if l:index >= 0
      call remove(l:paths, l:ignore_dir)
    endif
  endfor
  if len(l:paths) == 0
    return '__root__'
  endif
  return tolower(join(l:paths, '.'))
endfunction

" vim:ft=vim:ts=2:sw=2:fdm=marker
