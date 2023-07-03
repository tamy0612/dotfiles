if has('vim_starting')
  if !filereadable(fnameescape(join([$VIMDIR, 'autoload/plug.vim'], '/')))
    silent execute '!curl -fLo ' . $VIMDIR . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endif
endif

call plug#begin(expand('$VIM_CACHE_DIR/plug'))

Plug 'cocopon/iceberg.vim'
Plug 'itchyny/lightline.vim'

Plug 'vim-denops/denops.vim'
Plug 'matsui54/denops-popup-preview.vim'
Plug 'matsui54/denops-signature_help'

Plug 'prabirshrestha/vim-lsp'

Plug 'sbdchd/neoformat'

Plug 'Shougo/ddc.vim'
Plug 'Shougo/pum.vim'
Plug 'Shougo/ddc-ui-pum'
Plug 'Shougo/ddc-source-around'
Plug 'shun/ddc-source-vim-lsp'
Plug 'tani/ddc-path'
Plug 'tani/ddc-fuzzy'
Plug 'Shougo/ddc-filter-matcher_head'
Plug 'Shougo/ddc-converter_remove_overlap'

Plug 'vim-skk/skkeleton'

Plug 'lambdalisue/gina.vim'
Plug 'airblade/vim-gitgutter'

Plug 'cohama/lexima.vim'
Plug 'tpope/vim-commentary', {'on': ['Commentary']}
Plug 'h1mesuke/vim-alignta', {'on': ['Align']}

Plug 'haya14busa/vim-asterisk'
Plug 'easymotion/vim-easymotion'
Plug 't9md/vim-quickhl'

Plug 'voldikss/vim-floaterm'
Plug 'andymass/vim-matchup'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/vim-cursorword'

Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'vim-jp/cpp-vim', {'for': ['c', 'cpp']}
Plug 'bfrg/vim-cpp-modern', {'for': ['c', 'cpp']}
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescriptreact']}
Plug 'cespare/vim-toml', {'fot': 'toml'}
Plug 'stephpy/vim-yaml', {'for': 'yaml'}
Plug 'elixir-editors/vim-elixir', {'for': 'elixir'}

Plug 'Shougo/context_filetype.vim'
Plug 'osyo-manga/vim-precious'

if executable('fzf')
  Plug '$FZF_HOME'
else
  Plug 'junegunn/fzf', {'do': 'yes \| ./install'}
endif
Plug 'junegunn/fzf.vim'

call plug#end()

try
  setglobal background=dark
  colorscheme iceberg
catch
  call vimrc#log#error('colorscheme is not installed')
finally
  let g:colorscheme_specified = 1
endtry

let s:cwd = fnamemodify(expand('<sfile>'), ':h:p')
function! s:source(config) abort
  execute 'source' join([s:cwd, 'rc', a:config], '/')
endfunction

call s:source('lsp.vim')
call s:source('fmt.vim')
call s:source('ddc.vim')
call s:source('git.vim')
call s:source('lightline.vim')
call s:source('filetype.vim')
call s:source('filer.vim')

let g:matchup_matchparen_offscreen = {'method': 'popup'}

let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 1

let g:indentLine_setConceal = 1
let g:indentLine_conceallevel = 1
let g:indentLine_concealcursor = ''

let g:indentLine_char = '¦'
let g:indentLine_leadingSpaceChar = ''

let g:indentLine_setColors = 1
let g:indentLine_color_term = 241

let b:cursorword = 1
function! s:toggle_cursorword() abort
  let b:cursorword = !b:cursorword
  call cursorword#matchadd()
endfunction
command! ToggleCorsorword call s:toggle_cursorword()

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 0
let g:EasyMotion_use_upper = 0
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

nmap <C-f> <Plug>(easymotion-sn)
nmap / <Plug>(easymotion-fn)
nmap ? <Plug>(easymotion-Fn)
nmap ; <Plug>(easymotion-bd-n)

map * <Plug>(asterisk-z*)
map g* <Plug>(asterisk-gz*)
map # <Plug>(asterisk-z#)
map g# <Plug>(asterisk-gz#)

nmap <Leader>m <Plug>(quickhl-manual-this)
xmap <Leader>m <Plug>(quickhl-manual-this)
nmap <Leader>w <Plug>(quickhl-manual-this-whole-word)
xmap <Leader>w <Plug>(quickhl-manual-this-whole-word)

map <silent> <Leader>c :Commentary<CR>
" vim:ft=vim:ts=2:sw=2:fdm=marker
