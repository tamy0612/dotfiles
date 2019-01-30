"==========================================================
" vim/init.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 30 Jan. 2019.
"==========================================================
if !1 | finish | endif

augroup MyCmdGroup
  autocmd!
augroup END

function! s:source_config(filename, ...) abort
  let l:parent = get(a:000, 0, 'config')
  execute 'source' fnameescape(join([$VIMDIR, l:parent, a:filename], '/'))
endfunction


if has('vim_starting')
  if has('nvim')
    if !exists('$XDG_CONFIG_DIR')
      let $XDG_CONFIG_DIR = expand('$HOME/.config')
    endif
    let $VIMDIR = $XDG_CONFIG_DIR . '/nvim'
  else
    let $VIMDIR = fnamemodify(expand('<sfile>'), ':h:p')
  endif

  if &encoding !=? 'utf-8'
    let &termencoding = &encoding
    if !vimrc#is_nvim() | setglobal encoding=utf-8 | endif
  endif
  language message C
  scriptencoding utf-8

  setglobal fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,cp20932
  setglobal fileformats=unix,mac,dos

  setglobal helplang& helplang=en,ja
  setglobal secure

  " for yacky OS (will never be used, but just in case)
  if vimrc#is_windows()
    setglobal runtimepath^=$VIMDIR
    setglobal runtimepath+=$VIMDIR/after
    setglobal shellslash
  endif

  if !exists('$VIM_CACHE_DIR')
    if exists('$XDG_CACHE_HOME')
      let $VIM_CACHE_DIR = expand('$XDG_CACHE_HOME/vim')
    else
      let $VIM_CACHE_DIR = expand('$HOME/.cache/vim')
    endif
  endif
  setglobal backupdir=$VIM_CACHE_DIR/back
  call vimrc#mkdir_unless_exist(expand(&backupdir))

  if vimrc#is_nvim()
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
    let g:python3_host_prog = vimrc#find_executable('python3', [
          \ $PYENV_ROOT . '/versions/neovim3/bin',
          \ $PYENV_ROOT . '/shims'
          \])
  endif
endif

let mapleader = "\<Space>"


" Plugins
let s:dein_cache_dir = expand($VIM_CACHE_DIR . '/dein')
if has('vim_starting') && &runtimepath !~ '/dein.vim'
  let s:dein_dir = expand(s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim')

  if !isdirectory(s:dein_dir)
    if executable('git')
      call vimrc#mkdir_unless_exist(s:dein_cache_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    else
      vimrc#error('git command not found')
      vimrc#log('skip installing dein.vim')
    endif
  endif

  if filereadable(s:dein_dir . '/autoload/dein.vim')
    execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p'), '/$', '', '')
  else
    vimrc#error('dein.vim not found')
    vimrc#log('skip putting dein.vim into runtimepath')
  endif
endif

if &runtimepath !~ '/dein.vim'
  vimrc#error('dein.vim is not loaded')
else
  set packpath=

  let g:dein#install_progress_type = 'title'
  let g:dein#enable_notifycation = 1
  let g:dein#install_log_filename = expand('')

  if dein#load_state(s:dein_cache_dir)
    function! s:load_toml(file, ...) abort
      let l:option = get(a:000, 0, {})
      let l:config_dir = expand('$VIMDIR/rc')
      call dein#load_toml(join([l:config_dir, a:file], '/'), l:option)
    endfunction

    function! s:load_toml_lazy(file, ...) abort
      let l:option = extend(get(a:000, 0, {}), {'lazy': 1})
      call s:load_toml(a:file, l:option)
    endfunction

    let s:dein_dependencies = [$VIMDIR . '/init.vim', $VIMDIR . '/autoload/vimrc.vim']
    let s:dein_dependencies += split(glob($VIMDIR . '/autoload/plugins/*.vim'), '\n')
    let s:dein_dependencies += split(glob($VIMDIR . '/rc/*.toml'), '\n')

    call dein#begin(s:dein_cache_dir, s:dein_dependencies)
      call s:load_toml('core.toml')
      call s:load_toml('git.toml')
      call s:load_toml('appearance.toml')
      call s:load_toml_lazy('completion.toml', {'on_event': ['InsertEnter']})
      call s:load_toml_lazy('lsp.toml', {'on_ft': plugins#lsp#on_ft()})
      call s:load_toml_lazy('fzf.toml', {'if': plugins#fzf#is_available()})
      call s:load_toml_lazy('filetype/toml.toml', {'on_ft': ['toml']})
      call s:load_toml_lazy('filetype/vim.toml', {'on_ft': ['vim']})
      call s:load_toml_lazy('filetype/cpp.toml', {'on_ft': ['c', 'cpp']})
      call s:load_toml_lazy('filetype/scala.toml', {'on_ft': ['sbt', 'scala']})
      call s:load_toml_lazy('filetype/yaml.toml', {'on_ft': 'yaml'})
      call s:load_toml_lazy('filetype/typescript.toml', {'on_ft': 'typescript'})
      call s:load_toml_lazy('utility.toml')
      " call s:load_toml_lazy('denite.toml')
    call dein#end()
    call dein#save_state()
  endif

  if has('vim_starting') && dein#check_install()
    call dein#install()
  endif

  " Enable colorscheme
  setglobal background=dark
  if dein#tap('iceberg.vim')
    colorscheme iceberg
  else
    execute 'colorscheme' vimrc#default_colorscheme()
  endif
  " call dein#call_hook('post_source')
endif

filetype plugin indent on
syntax enable


" Mappings
imap OA <UP>
imap OB <Down>
imap OC <Right>
imap OD <Left>
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nmap <silent> <Esc><Esc> :<C-u>nohlsearch<CR><Esc>
nmap # "zyiw:let @/ = '\<' . @z . '\>'<CR>:%s/<C-r>///gc<Left><Left><Left>

nnoremap <expr> K (&filetype is# 'vim' ? (':help ' . fnameescape(expand('<cword>')) . '<CR>') : 'K')

map <C-c> g<C-g>
tnoremap <ESC> <C-\><C-n>

autocmd FileType help,diff,qf nnoremap <silent><buffer> q :<C-u>q<CR>

nnoremap <silent> <Leader>n :<C-u>call vimrc#toggle_variable("&relativenumber")<CR>
nnoremap <silent> <Leader>q :<C-u>call vimrc#open_qf_or_loclist()<CR>


" Swap file
set noswapfile undofile
let &undodir = &backupdir


" File formats
let &fileencoding = &encoding
set fileformat=unix
set formatoptions& formatoptions+=mM
if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif
if exists('*autofmt#japanese#formatexpr')
  set formatexpr=autofmt#japanese#formatexpr()
endif


setglobal laststatus=2 cmdheight=1
setglobal clipboard=unnamed
setglobal showmatch matchpairs& matchpairs+=<:>
setglobal hlsearch incsearch nowrapscan ignorecase smartcase
setglobal wildignore=*.o,*.class,*.beam,*.dvi,*.pdf
setglobal whichwrap=b,s,h,l,<,>,[,] backspace=indent,eol,start
setglobal wildmenu
setglobal lazyredraw
setglobal hidden
setglobal updatetime=100
if has('mouse')
  setglobal mouse+=a
endif

set splitright splitbelow
set list listchars=tab:>\ ,trail:~
set foldmethod=marker foldlevelstart=0 foldopen=all
set autoindent smartindent tabstop=4 shiftwidth=4 softtabstop=0 smarttab expandtab
set cindent cinoptions& cinoptions+=h0,(4,Us,p0
set modeline
set spelllang=en,cjk
set number relativenumber scrolloff=10 textwidth=0
set colorcolumn=100


autocmd MyCmdGroup BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 1
autocmd MyCmdGroup BufWritePre * call vimrc#auto_mkdir_on_write(expand('<afile>:p:h'), v:cmdbang)
autocmd MyCmdGroup FileType gitcommit execute "normal! gg"

if vimrc#is_nvim()
  autocmd MyCmdGroup BufRead,BufNewFile *.nvim setlocal filetype=vim
  autocmd MyCmdGroup CursorHold * if exists(':rshada') | rshada | wshada | endif
endif


" Load local vimrc
let s:local_vimrc = findfile('.vimrc.local', '.;')
if filereadable(s:local_vimrc)
  execute 'source' s:local_vimrc
endif
" vim:ft=vim:ts=2:sw=2:fdm=marker
