" config
let g:acp_enableAtStartup                      = 0
let g:neocomplete#enable_at_startup            = 1
let g:neocomplete#enable_smart_case            = 1
let g:neocomplete#enable_fuzzy_completion      = 1
let g:neocomplete#max_list                     = 10
let g:neocomplete#use_vimproc                  = 1
let g:neocomplete#min_keyword_length           = 3
let g:neocomplete#lock_buffer_name_pattern     = '\*ku\*'
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#enable_auto_select           = 0

" dict
let g:neocomplete#dictionary_filetype_lists = {
      \ 'php' : $VIMDIR.'/dict/php.dict',
      \ 'scala' : $VIMDIR.'/dict/scala.dict',
      \ 'vimshell' : $HOME.'/.vimshell/command-history' }

" input pattern
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.php  = '[^.\t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c    = '[^.[:digit:]*\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp  = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" complete func
let g:neocomplete#sources#vim#complete_functions = {
      \ 'Unite':               'unite#complete_source',
      \ 'VimShellExecute':     'vimshell#vimshell_execute_complete',
      \ 'VimShellInteractive': 'vimshell#vimshell_execute_complete',
      \ 'VimShellTerminal':    'vimshell#vimshell_execute_complete',
      \ 'VimShell':            'vimshell#complete',
      \ 'VimFiler':            'vimfiler#complete' }

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default':    '',
      \ 'vimshell':   $HOME.'/.vimshell_hist',
      \ 'scala':      $VIMDIR.'/bundle/vim-scala/dict/scala.dict',
      \ 'c':          $VIMDIR.'/dict/c.dict',
      \ 'cpp':        $VIMDIR.'/dict/cpp.dict',
      \ 'd':          $VIMDIR.'/dict/d.dict',
      \ 'java':       $VIMDIR.'/dict/java.dict',
      \ 'javascript': $VIMDIR.'/dict/javascript.dict',
      \ 'lua':        $VIMDIR.'/dict/lua.dict',
      \ 'ocaml':      $VIMDIR.'/dict/ocaml.dict',
      \ 'perl':       $VIMDIR.'/dict/perl.dict',
      \ 'php':        $VIMDIR.'/dict/php.dict',
      \ 'scheme':     $VIMDIR.'/dict/scheme.dict',
      \ 'vim':        $VIMDIR.'/dict/vim.dict' }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

set completeopt+=longest
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<Tab>"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" include path
if IsMac()
  let g:neocomplete#sources#include#paths = {
        \ 'cpp':  '.,/usr/include,/usr/include/c++/4.2.1,/usr/local/include',
        \ 'c':    '.,/usr/include,/usr/local/include'}
elseif IsLinux()
  let g:neocomplete#sources#include#paths = {
        \ 'cpp':  '.,/usr/include,/usr/include/c++/4.8,/usr/local/include',
        \ 'c':    '.,/usr/include,/usr/local/include'}
endif
let g:neocomplete#sources#include#paths.d = '.,./src,./source,$D_IMPORT_DIR'

" include pattern
let g:neocomplete#sources#include#patterns={
      \ 'cpp':  '^\s*#\s*include',
      \ 'c':    '^\s*#\s*include',
      \ 'd':    '^\s*import',
      \ 'ruby': '^\s*require' }

let g:neocomplete#sources#include#exprs={
      \'ruby': substitute(v:fname,'::','/','g') }

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns={}
endif
let g:rsenseUseOmniFunc = 1
