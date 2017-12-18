" Set title the file path
let &titleold = ""
let &titlestring = "%f"

" Show row number
set number
augroup numberwidth
  autocmd!
  autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 1
augroup END

" Show escape chars
set list
set listchars=tab:>\ ,trail:~

" Status line
set laststatus=2
set cmdheight=1

" window
set splitright
set splitbelow
set scrolloff=10
set lazyredraw
set modeline

" Folding
set foldmethod=marker
set foldlevelstart=0
set foldopen=all

" Indent
set autoindent
set smartindent
set cindent
set cinoptions&
set cinoptions+=h0,(4,Us,p0

" Tab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
set expandtab

" wrapping
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start

" Enable hiden buffer
set hidden

" Deny auto CR
set textwidth=0

" search
set hlsearch
set nowrapscan
set ignorecase
set smartcase
set incsearch
set wildignore=*.o,*.class,*.beam,*.dvi,*.pdf

" misc.
set showmatch
set wildmenu
set clipboard=unnamed
set spelllang=en,cjk
if has('mouse')
    set mouse+=a
endif
