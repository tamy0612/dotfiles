" NeoBundle core
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neobundle-vim-scripts'

" vimproc
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \   'mac' : 'make -f make_mac.mak',
      \   'unix' : 'make -f make_unix.mak',
      \ }}


" completion
if has('nvim') && has('python3')
  let g:python3_host_prog = expand('$PYENV_ROOT') . '/shims/python'
  NeoBundleLazy 'Shougo/deoplete.nvim', {
        \ 'insert' : 1,
        \ }
else
  NeoBundleLazy 'Shougo/neocomplete.vim', {
        \ 'depends' : 'Shougo/context_filetype.vim',
        \ 'insert' : 1,
        \ }
endif

NeoBundleLazy 'Shougo/neosnippet.vim', {
      \ 'depends' : ['Shougo/neosnippet-snippets', 'Shougo/context_filetype.vim'],
      \ 'insert' : 1,
      \ 'filetypes' : 'snippet',
      \ 'unite_sources' : [
      \    'neosnippet', 'neosnippet/user', 'neosnippet/runtime'],
      \ }

NeoBundleLazy 'Shougo/echodoc.vim', {
      \ 'insert' : 1
      \ }

NeoBundleLazy 'koron/codic-vim', {
      \ 'insert' : 1
      \ }


" ctags & cscope
NeoBundleLazy 'taglist.vim', {
      \ 'filetypes' : [
      \   'c', 'cpp', 'java'
      \ ]}

NeoBundleLazy 'SrcExpl', {
      \ 'filetypes' : [
      \   'c', 'cpp', 'java'
      \ ]}


" unite
NeoBundleLazy 'Shougo/unite.vim', {
      \ 'commands' : [
      \   {
      \     'name' : 'Unite',
      \     'complete' : 'customlist,unite#complete_source'
      \   },
      \   'UniteWithCursorWord',
      \   'UniteWithInput',
      \   'UniteBookmarkAdd'
      \ ]}

NeoBundleLazy 'Shougo/unite-build', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'unite_sources' : 'build'
      \ }

NeoBundleLazy 'Shougo/unite-outline', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'unite_sources' : 'outline'
      \ }

NeoBundleLazy 'Shougo/unite-ssh', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'unite_sources' : 'ssh'
      \ }

NeoBundleLazy 'osyo-manga/unite-quickfix', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'unite_sources' : 'quickfix'
      \ }

NeoBundleLazy 'thinca/vim-unite-history', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'unite_sources' : ['history/command', 'history/search']
      \ }

NeoBundleLazy 'pasela/unite-webcolorname', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'unite_sources' : ['webcolorname'],
      \ }

NeoBundleLazy 'ujihisa/unite-colorscheme', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'unite_sources' : ['colorscheme'],
      \ }

NeoBundleLazy 'rhysd/unite-codic.vim', {
      \ 'depends' : ['Shougo/unite.vim', 'koron/codic-vim'],
      \ 'unite_sources' : ['codic']
      \ }


" filer
NeoBundleLazy 'Shougo/vimfiler', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'commands' : [
      \   {
      \     'name' : 'VimFiler',
      \     'complete' : 'customlist,vimfiler#complete'
      \   },
      \   {
      \     'name' : 'VimFilerExplorer',
      \     'complete' : 'customlist,vimfiler#complete'
      \   },
      \   {
      \     'name' : 'Edit',
      \     'complete' : 'customlist,vimfiler#complete'
      \   },
      \   { 'name' : 'Write',
      \     'complete' : 'customlist,vimfiler#complete'
      \   },
      \   'Read',
      \   'Source'
      \ ],
      \ 'mappings' : ['<Plug>(vimfiler_switch)'],
      \ 'explorer' : 1,
      \ }

NeoBundleLazy 'ctrlpvim/ctrlp.vim', {
      \ 'commands' : ['CtrlP'],
      \ 'mappings' : ['n','<C-p>'],
      \ }

NeoBundleLazy 'tacahiroy/ctrlp-funky', {
      \ 'depends' : 'kien/ctrlp.vim',
      \ 'commands' : ['CtrlPFunky'],
      \ }

" vimshell
NeoBundleLazy 'Shougo/vimshell', {
      \ 'commands' : [
      \   {
      \     'name' : 'VimShell',
      \     'complete' : 'customlist,vimshell#complete'
      \   },
      \   'VimShellExecute',
      \   'VimShellInteractive',
      \   'VimShellterminal',
      \   'VimShellPop'
      \ ],
      \ 'mappings' : [
      \   '<Plug>(vimshell_switch)',
      \   '<Plug>(vimshell_toggle)'
      \ ]
      \ }

NeoBundleLazy 'ujihisa/vimshell-ssh', {
      \ 'depends' : 'Shougo/vimshell',
      \ 'filetypes' : ['vimshell'],
      \ }

NeoBundleLazy 'yomi322/vim-gitcomplete', {
      \ 'filetypes' : ['vimshell']
      \ }


" util
NeoBundleLazy 'mbbill/undotree', {
      \ 'commands' : ['UndotreeToggle']
      \ }

NeoBundleLazy 'thinca/vim-quickrun', {
      \ 'mappings' : ['<Plug>(quickrun)']
      \ }

NeoBundleLazy 'itchyny/calendar.vim', {
      \ 'commands' : ['Calendar']
      \ }

NeoBundleLazy 'Yggdroot/indentLine', {
      \ 'filetypes' : ['python'],
      \ 'commands' : ['IndentLinesEnable', 'IndentLinesToggle'],
      \ }

NeoBundleLazy 'mattn/webapi-vim'
NeoBundleLazy 'yuratomo/w3m.vim', {
      \ 'commands' : [
      \   'W3m', 'W3mTab', 'W3mSplit', 'W3mVsplit'
      \ ]
      \ }

NeoBundleLazy 'tpope/vim-commentary', {
      \ 'mappings' : [
      \   'gc',
      \   '<Plug>Commentary',
      \   '<Plug>CommentaryLine',
      \   '<Plug>ChangeCommentary',
      \ ]
      \ }

NeoBundleLazy 'h1mesuke/vim-alignta', {
      \ 'commands' : 'Align'
      \ }

NeoBundleLazy 'koron/codic-vim', {
      \ 'insert' : 1,
      \ 'commands' : [
      \   'Codic'
      \ ]
      \ }

NeoBundleLazy 'scrooloose/syntastic', {
      \ 'insert' : 1
      \ }


" operator
NeoBundleLazy 'kana/vim-operator-user', {
      \ 'functions' : 'operator#user#define',
      \ }

NeoBundleLazy 'kana/vim-operator-replace', {
      \ 'depends' : 'vim-operator-user',
      \ 'mappings' : [
      \   ['nx', '<Plug>(operator-replace)']
      \ ]
      \ }

NeoBundleLazy 'rhysd/vim-operator-surround', {
      \ 'depends' : 'vim-operator-user',
      \   'mappings' : '<Plug>(operator-surround)',
      \ }


" visual
NeoBundle 'itchyny/lightline.vim'

NeoBundle 'CSApprox'


" plugins depend on each environment
NeoBundleLazy 'kana/vim-smartinput', {
      \ 'filetypes' : [
      \   'c', 'cpp', 'd', 'go', 'java', 'scala', 'css', 'sass', 'php', 'javascript'
      \ ]
      \ }

NeoBundleLazy 'tpope/vim-endwise', {
      \ 'depends' : 'rhysd/vim-crystal',
      \ 'filetypes' : [
      \   'c', 'cpp', 'ruby', 'crystal', 'elixir', 'lua', 'sh', 'zsh', 'vim'
      \ ],
      \ }

NeoBundleLazy 'ujihisa/unite-rake', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'filetypes' : ['ruby','d'],
      \ }

NeoBundleLazy 'vim-ruby/vim-ruby', {
      \ 'mappings' : ['<Plug>'],
      \ 'filetypes' : 'ruby'
      \ }

NeoBundleLazy 'vim-jp/cpp-vim', {
      \ 'filetypes' : [ 'c', 'cpp' ],
      \ }

NeoBundleLazy 'rhysd/vim-clang-format', {
      \ 'filetypes' : [
      \   'c', 'cpp'
      \ ]
      \ }

NeoBundleLazy 'osyo-manga/vim-marching', {
      \ 'filetypes' : [
      \   'c', 'cpp'
      \ ]
      \ }

NeoBundleLazy 'tamy0612/d.vim', {
      \ 'filetypes' : 'd',
      \ }

NeoBundleLazy 'rhysd/vim-crystal', {
      \ 'filetype' : 'crystal',
      \ }

NeoBundleLazy 'jiangmiao/simple-javascript-indenter', {
      \ 'filetypes' : 'javascript',
      \ }

NeoBundleLazy 'jelera/vim-javascript-syntax', {
      \ 'filetypes' : 'javascript',
      \ }

NeoBundleLazy 'hynek/vim-python-pep8-indent', {
      \ 'filetypes' : 'python',
      \ }

NeoBundleLazy 'hail2u/vim-css3-syntax', {
      \ 'filetypes' : 'css'
      \ }

NeoBundleLazy 'elzr/vim-json', {
      \ 'filetypes' : 'json',
      \ }

NeoBundle 'tamy0612/template.vim'
