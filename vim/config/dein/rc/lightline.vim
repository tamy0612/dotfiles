"==========================================================
" vim/config/dein/rc/lightline.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 06 Apr. 2018.
"==========================================================
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste', 'modifiable'], ['modified', 'filename'], ['lint', 'gitstatus']],
      \   'right': [['lineinfo'], ['fileformat', 'fileencoding', 'filetype'], ['gitinfo']]
      \ },
      \ 'inactive': {
      \   'left': [['modified', 'filename', 'gitstatus']],
      \   'right': [['filetype']]
      \ },
      \ 'component_function': {
      \   'mode': 'LightlineMode',
      \   'modifiable': 'LightlineModifiable',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename',
      \   'lint': 'ALEGetStatusLine',
      \   'gitstatus': 'LightlineGitStatus',
      \   'gitinfo': 'LightlineGitinfo',
      \   'fileformat': 'LightlineFileformat',
      \   'fileencoding': 'LightlineFileencoding',
      \   'filetype': 'LightlineFiletype',
      \   'percent': 'LightlinePercent',
      \   'lineinfo': 'LightlineLineinfo'
      \ }
      \}


function! LightlineMode()
  if &ft =~ 'nerdtree'
    return ''
  endif

  let l:mode = lightline#mode()
  if &ft =~ 'denite'
    let l:mode = substitute(denite#get_status_mode(), '-\|\s', '', 'g')
  endif
  return tolower(l:mode)
endfunction


function! LightlineModifiable()
  return &ro ? 'RO' : &modifiable ? '' : '-'
endfunction


function! LightlineModified()
  return &modified ? '+' : ''
endfunction


function! LightlineFilename()
  if &ft =~ 'denite'
    return denite#get_status_sources()
  endif
  if &ft =~ 'deol'
    return '[deol]'
  endif
  if &ft =~ 'nerdtree'
    let l:dirname = fnamemodify(getcwd(), ':~')
    return fnamemodify(l:dirname, (strlen(l:dirname) > 20 ? ':t' : ':~'))
  endif
  if &buftype =~ 'quickfix'
    return '[quickfix]'
  endif
  if &buftype =~ 'terminal'
    if vimrc#is_nvim()
      let l:process = split(expand('%:t'), ':')
      return printf("[%s] %s", l:process[0], l:process[1])
    else
      return printf('[terminal] %s', expand('%:h'))
    end
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


function! LightlineFileformat()
  if &ft =~ 'denite\|unite\|nerdtree'
    return ''
  endif
  return &fileformat
endfunction


function! LightlineFileencoding()
  if &ft =~ 'denite\|unite\|nerdtree'
    return ''
  endif
  return &fileencoding
endfunction


function! LightlineFiletype()
  if &buftype == 'terminal'
    return 'terminal'
  endif
  if &ft =~ 'denite\|unite\|nerdtree'
    return ''
  endif
  return &filetype
endfunction


function! LightlinePercent()
  if &ft =~ 'nerdtree'
    return ''
  endif
  let l:cline = line('.')
  let l:eline = line('$')
  return printf("%3d%%", l:eline > 0 ? l:cline * 100 / l:eline : 0)
endfunction


function! LightlineLineinfo()
  if &ft =~ 'nerdtree' || &buftype =~ 'terminal'
    return ''
  endif
  if &ft =~ 'denite'
    return denite#get_status_linenr()
  endif
  let l:cpos = getpos('.')
  return printf('%3d:%-2d', l:cpos[1], l:cpos[2])
endfunction


function! LightlineGitinfo()
  if &ft =~ 'nerdtree'
    return ''
  endif

  if strlen(gina#component#repo#branch())
    return gina#component#repo#branch() . ' ' . gina#component#status#preset('fancy')
  endif
  return '[untracked]'
endfunction


function! LightlineGitStatus()
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
