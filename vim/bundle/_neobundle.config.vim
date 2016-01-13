function! s:hook_path(path)
  return fnameescape(expand($VIMDIR.'/bundle/_config/'.a:path))
endfunction


" unite "{{{
if neobundle#tap('unite.vim')
  nnoremap [unite] <Nop>
  nmap <Space>u [unite]
  nmap <silent> [unite]f :<C-u>Unite -vertical -winwidth=30 file<CR>
  nmap <silent> [unite]b :<C-u>Unite -winheight=10 buffer<CR>
  nmap <silent> [unite]r :<C-u>Unite -winheight=10 -buffer-name=register register<CR>
  nmap <silent> [unite]o :<C-u>Unite -vertical -winwidth=30 -no-quit outline<CR>
  nmap <silent> [unite]t :<C-u>Unite -winheight=10 tab<CR>
  nmap <silent> [unite]w :<C-u>Unite -winheight=10 window<CR>
  nmap <silent> [unite]m :<C-u>Unite -winheight=15 mapping<CR>
  nmap <silent> [unite]s :<C-u>Unite -winheight=10 menu:shortcut<CR>
  nmap <silent> [unite]c :<C-u>Unite -vertical -winwidth=30 bookmark<CR>
  nmap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
  function! s:deine_unite_keymappings()
    nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
    inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
    nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
    inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
    nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
    inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  endfunction
  autocmd AutoCmd FileType unite call s:deine_unite_keymappings()
  let neobundle#hooks.on_source = s:hook_path('on_source/unite.vim')
  call neobundle#untap()
endif
"}}}


" unite-outline "{{{
if neobundle#tap('unite-outline')
  let neobundle#hooks.on_source = s:hook_path('on_source/unite-outline.vim')
  call neobundle#untap()
endif
"}}}


" completion "{{{
if has('nvim') && has('python3')
  let g:compl_plug = 'neocomplete.vim'
else
  let g:compl_plug = 'deoplete.nvim'
endif
if neobundle#tap(g:compl_plug)
  let neobundle#hooks.on_source = s:hook_path('on_source/'.g:compl_plug)
endif
unlet g:compl_plug
"}}}


" neosnippet "{{{
if neobundle#tap('neosnippet.vim')
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
  let neobundle#hooks.on_source = s:hook_path('on_source/neosnippet.vim')
  call neobundle#untap()
endif
"}}}


" ctags "{{{
if neobundle#tap('ctags.vim')
  let neobundle#hooks.on_source = s:hook_path('on_source/ctags.vim')
  call neobundle#untap()
endif
"}}}


" SrcExpl "{{{
if neobundle#tap('SrcExpl')
  let neobundle#hooks.on_source = s:hook_path('on_source/srcexpl.vim')
  call neobundle#untap()
endif
"}}}


" VimFiler "{{{
if neobundle#tap('vimfiler')
  nmap <Space>vf :VimFilerExplorer<CR>
  let neobundle#hooks.on_source = s:hook_path('on_source/vimfiler.vim')
  call neobundle#untap()
endif
"}}}


" CtrlP "{{{
if neobundle#tap('ctrlp.vim')
  nnoremap <C-p> :<C-u>CtrlP<CR>
  let neobundle#hooks.on_source = s:hook_path('on_source/ctrlp.vim')
  call neobundle#untap()
endif
"}}}


" quickrun "{{{
if neobundle#tap('vim-quickrun')
  nmap <silent> <Leader>r <Plug>(quickrun)
  let neobundle#hooks.on_source = s:hook_path('on_source/vim-quickrun.vim')
  call neobundle#untap()
endif
"}}}


" VimShell "{{{
if neobundle#tap('vimshell')
  noremap <Plug>(vimshell_toggle) :VimShell -toggle<CR>
  nnoremap <C-s> :<C-u>VimShellPop -toggle<CR>
  inoremap <C-s> <C-[>:<C-u>VimShellPop -toggle<CR>
  let neobundle#hooks.on_source = s:hook_path('on_source/vimshell.vim')
  call neobundle#untap()
endif
"}}}


" Calendar.vim "{{{
if neobundle#tap('calendar.vim')
  call neobundle#untap()
endif
"}}}


" indentLine "{{{
if neobundle#tap('indentLine')
  nnoremap <Leader>i :<C-u>:IndentLinesToggle<CR>
  let neobundle#hooks.on_source = s:hook_path('on_source/indentline.vim')
  call neobundle#untap()
endif
"}}}


" syntastic "{{{
if neobundle#tap('syntastic')
  let neobundle#hooks.on_source = s:hook_path('on_source/syntastic.vim')
  call neobundle#untap()
endif
"}}}


" operator-replace "{{{
if neobundle#tap('vim-operator-replace')
  xmap p <Plug>(operator-replace)
  call neobundle#untap()
endif
"}}}


" operator-surround "{{{
if neobundle#tap('vim-operator-surround')
  nmap <silent>sa <Plug>(operator-surround-append)a
  nmap <silent>sd <Plug>(operator-surround-delete)a
  nmap <silent>sr <Plug>(operator-surround-replace)a
  call neobundle#untap()
endif
"}}}


" lightline "{{{
if neobundle#tap('lightline.vim')
  let g:lightline = {
        \ 'colorscheme' : 'default',
        \ 'component' : {
        \   'readonly' : '%{&readonly?" x":""}'
        \ }}
  call neobundle#untap()
endif
"}}}


" vim-clang-format "{{{
if neobundle#tap('vim-clang-format')
  let neobundle#hooks.on_source = s:hook_path('on_source/vim-clang-format.vim')
  call neobundle#untap()
endif
"}}}


" python.vim "{{{
if neobundle#tap('python.vim')
  let python_highlight_all = 1
  call neobundle#untap()
endif
"}}}


" vim-marching {{{
if neobundle#tap('vim-marching')
  let neobundle#hooks.on_source = s:hook_path('on_source/vim-marching.vim')
  imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
  imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)
endif
" }}}
