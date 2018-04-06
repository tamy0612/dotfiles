"==========================================================
" vim/config/options.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 06 Apr. 2018.
"==========================================================
" Swap file
set noswapfile undofile
let &undodir = &backupdir


" File formats
let &fileencoding = &encoding
set fileformat=unix
if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif

set formatoptions& formatoptions+=mM
if exists('*autofmt#japanese#formatexpr')
  set formatexpr=autofmt#japanese#formatexpr()
endif


" Globals
setglobal laststatus=2 cmdheight=1
setglobal clipboard=unnamed
setglobal showmatch matchpairs& matchpairs+=<:>
setglobal hlsearch incsearch nowrapscan ignorecase smartcase
setglobal wildignore=*.o,*.class,*.beam,*.dvi,*.pdf
setglobal whichwrap=b,s,h,l,<,>,[,] backspace=indent,eol,start
setglobal wildmenu
setglobal lazyredraw
setglobal hidden
if has('mouse')
    setglobal mouse+=a
endif


" Locals
set splitright splitbelow
set list listchars=tab:>\ ,trail:~
set foldmethod=marker foldlevelstart=0 foldopen=all
set autoindent smartindent tabstop=4 shiftwidth=4 softtabstop=0 smarttab expandtab
set cindent cinoptions& cinoptions+=h0,(4,Us,p0
set modeline
set spelllang=en,cjk
set number relativenumber scrolloff=10 textwidth=0
" vim:ft=vim:ts=2:sw=2:fdm=marker
