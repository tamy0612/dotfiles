function! s:hook_path(name)
  return fnameescape(expand($VIMDIR.'/config/plugins/'.a:name))
endfunction

function! s:load_config(dein_name, plugin_name)
  execute 'autocmd MyCmdGroup User' 'dein#source#'.a:dein_name 'source '.s:hook_path(a:plugin_name)
endfunction


" context_filetype "{{{
if dein#tap('context_filetype.vim')

  if !exists('g:context_filetype#filetypes')
    let g:context_filetype#filetypes = {}
  endif

  let g:context_filetype#filetypes['toml'] = [
        \   { 'filetype': 'vim',
        \     'start': '^\s*hook_\(add\|source\|post_source\)\s*=\s*'."'"."''",
        \     'end': "'"."''"
        \   },
        \   { 'filetype': 'vim',
        \     'start': '^\s*hook_\(add\|source\|post_source\)\s*=\s*'.'"""',
        \     'end': '"""'
        \   }
        \ ]

endif
"}}}


" unite "{{{
if dein#tap('unite.vim')
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
  autocmd MyCmdGroup FileType unite call s:deine_unite_keymappings()
  call s:load_config(g:dein#name, 'unite.vim')
endif
"}}}


" unite-outline "{{{
if dein#tap('unite-outline')
  call s:load_config(g:dein#name, 'unite-outline.vim')
endif
"}}}


" completion "{{{
if dein#tap('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
  call s:load_config(g:dein#name, 'deoplete.nvim')
endif

if dein#tap('neocomplete')
  call s:load_config(g:dein#name, 'neocomplete.vim')
endif
"}}}


" neosnippet "{{{
if dein#tap('neosnippet.vim')
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
  call s:load_config(g:dein#name, 'neosnippet.vim')
endif
"}}}


" vim-external "{{{
if dein#tap('vim-external')
  nnoremap [external] <Nop>
  nmap <Space>e [external]
  nmap <silent> [external]e <Plug>(external-explorer)
  nmap <silent> [external]b <Plug>(external-browser)
endif
"}}}


" ctags "{{{
if dein#tap('ctags.vim')
  call s:load_config(g:dein#name, 'ctags.vim')
endif
"}}}


" SrcExpl "{{{
if dein#tap('SrcExpl')
  call s:load_config(g:dein#name, 'srcexpl.vim')
endif
"}}}


" VimFiler "{{{
if dein#tap('vimfiler')
  nmap <Space>vf :VimFilerExplorer<CR>
  call s:load_config(g:dein#name, 'vimfiler.vim')
endif
"}}}


" CtrlP "{{{
if dein#tap('ctrlp.vim')
  nnoremap <C-p> :<C-u>CtrlP<CR>
  call s:load_config(g:dein#name, 'ctrlp.vim')
endif
"}}}


" quickrun "{{{
if dein#tap('vim-quickrun')
  nmap <silent> <Leader>r <Plug>(quickrun)
  call s:load_config(g:dein#name, 'vim-quickrun.vim')
endif
"}}}


" VimShell "{{{
if dein#tap('vimshell')
  noremap <Plug>(vimshell_toggle) :VimShell -toggle<CR>
  nnoremap <C-s> :<C-u>VimShellPop -toggle<CR>
  inoremap <C-s> <C-[>:<C-u>VimShellPop -toggle<CR>
  call s:load_config(g:dein#name, 'vimshell.vim')
endif
"}}}


" lightline "{{{
if dein#tap('lightline.vim')
  let g:lightline = {
        \ 'colorscheme': 'default',
        \ 'component': {
        \   'readonly': '%{&readonly?" x":""}'
        \ }
        \}
endif
"}}}


" indentLine "{{{
if dein#tap('indentLine')
  nnoremap <Leader>i :<C-u>:IndentLinesToggle<CR>
  call s:load_config(g:dein#name, 'indentline.vim')
endif
"}}}


" syntastic "{{{
if dein#tap('syntastic')
  call s:load_config(g:dein#name, 'syntastic.vim')
endif
"}}}


" easymotion "{{{
if dein#tap('vim-easymotion')
  call s:load_config(g:dein#name, 'easymotion.vim')
endif
"}}}


" operator-replace "{{{
if dein#tap('vim-operator-replace')
  xmap p <Plug>(operator-replace)
endif
"}}}


" operator-surround "{{{
if dein#tap('vim-operator-surround')
  nmap <silent>sa <Plug>(operator-surround-append)a
  nmap <silent>sd <Plug>(operator-surround-delete)a
  nmap <silent>sr <Plug>(operator-surround-replace)a
endif
"}}}


" vim-clang "{{{
if dein#tap('vim-clang')
  call s:load_config(g:dein#name, 'vim-clang.vim')
endif
"}}}


" vim-clang-format "{{{
if dein#tap('vim-clang-format')
  call s:load_config(g:dein#name, 'vim-clang-format.vim')
endif
"}}}


" vim-marching {{{
if dein#tap('vim-marching')
  imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
  imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)
  call s:load_config(g:dein#name, 'vim-marching.vim')
endif
" }}}


" python.vim "{{{
if dein#tap('python.vim')
  let python_highlight_all = 1
endif
"}}}


" Private auto commands  "{{{
augroup MyCmdGroup
  " mkdir when the target directory does not exist
  autocmd BufWritePre * call hook#write#auto_mkdir( expand('<afile>:p:h'), v:cmdbang )
  " remove extra spaces
  autocmd BufWritePre * call hook#write#space_clean()
  " reload ~/.vimrc when it was updated
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  " reload ~/.vimrc.mine when it was updated  => only when .vimrc.mine exists
  if exists('g:private_vimrc')
    autocmd BufWritePost $SECRETVIMRC source $SECRETVIMRC
  endif
  " reload ~/.gvimrc when it was updated  => only used in gVim
  if IsGUI()
    autocmd BufWritePost $MYGVIMRC source $MYGVIMRC
  endif
  " autocmd for each filetype
  autocmd FileType gitcommit execute "normal! gg"
  " omnifunc
  "autocmd FileType ada setlocal omnifunc=adacomplete#Complete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete
  autocmd FileType c setlocal omnifunc=ccomplete#Complete
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  if has('python3')
    autocmd FileType python setlocal omnifunc=python3complete#Complete
  else
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  endif
augroup END
"}}}
