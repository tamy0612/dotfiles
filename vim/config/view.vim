" Set title the file path
let &titleold = ""
let &titlestring = "%f"
" Show row number
set number
augroup numberwidth
  autocmd!
  autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END
" Don't show escape chars
set nolist
" Show status line
set laststatus=2
" cmd height = 1
set cmdheight=1
" Show commandsd
set showcmd
" colors
set t_Co=256
set background=dark
colorscheme original
syntax on
" Show matches
set showmatch

" window
set splitright
set splitbelow
set scrolloff=10
set lazyredraw
set modeline

" Folding
set foldmethod=marker
set foldlevelstart=0
