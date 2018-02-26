"==========================================================
" mono.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 23 Feb. 2018.
"==========================================================
hi clear
set background=dark
set t_Co=256
if exists('g:color_name')
    let g:color_name = 'mono'
endif

function! s:hi(group, fg, bg, attr)
    let command = ['hi', a:group]
    let fg = get(a:, 'fg', [])
    if fg != []
        call add(command, 'ctermfg='.fg[0])
        call add(command, 'guifg='.fg[1])
    endif
    let bg = get(a:, 'bg', [])
    if bg != []
        call add(command, 'ctermbg='.bg[0])
        call add(command, 'guibg='.bg[1])
    endif
    let attr = get(a:, 'attr', '')
    if attr != ''
        call add(command, 'cterm='.attr)
        call add(command, 'gui='.attr)
    endif
    execute 'hi clear '.a:group
    execute join(command, ' ')
endfunction


let s:grad = [[0, '#000000'],
            \ [233, '#121212'],
            \ [240, '#585858'],
            \ [245, '#8a8a8a'],
            \ [250, '#bcbcbc'],
            \ [253, '#dadada'],
            \ [231, '#ffffff']]
let s:em_bg = {'red': [160, '#d70000'], 'green': [40, '#00d700'], 'blue': [27, '#005fff'], 'yellow': [228, '#ffff87']}
let s:inherit = []

let s:none = ''
let s:bold = 'bold'
let s:underline = 'underline'
let s:italic = 'italic'

if get(g:, 'mono_disable_cursorline', 0)
    set nocursorline
else
    set cursorline
    augroup MonoCursorline
        autocmd!
        autocmd VimEnter * setlocal cursorline
        autocmd WinEnter * setlocal cursorline
        autocmd BufWinEnter * setlocal cursorline
        autocmd WinLeave * setlocal nocursorline
    augroup END
endif

" Customizable fields
let s:mono_search_bg = get(g:, 'mono_search_bg', 'yellow')
let s:mono_incsearch_bg = get(g:, 'mono_incsearch_bg', 'blue')
let s:mono_error_bg = get(g:, 'mono_error_bg', 'red')


" ---- editor ----
call s:hi('Normal', s:grad[4], s:grad[1], s:none)
call s:hi('CursorLine', s:inherit, s:grad[0], s:none)
call s:hi('ColorColumn', s:inherit, s:grad[2], s:none)

" ---- #line ----
call s:hi('LineNr', s:grad[2], s:inherit, s:none)
call s:hi('CursorLineNr', s:grad[3], s:grad[0], s:bold)
call s:hi('NonText', s:grad[2], s:inherit, s:none)

" ---- Special emphasis ----
call s:hi('Search', s:grad[3], s:em_bg[s:mono_search_bg], s:bold)
call s:hi('IncSearch', s:grad[1], s:em_bg[s:mono_incsearch_bg], s:bold)
call s:hi('ErrorMsg', s:grad[6], s:em_bg[s:mono_error_bg], s:bold)
if get(g:, 'mono_visual_inverse', 0)
    call s:hi('Visual', s:grad[0], s:grad[6], s:none)
else
    call s:hi('Visual', s:grad[6], s:grad[0], s:none)
endif
call s:hi('Conceal', s:grad[2], s:inherit, s:none)

" ---- Programming ----
call s:hi('Statement', s:grad[3], s:inherit, s:none)
call s:hi('Identifier', s:grad[5], s:inherit, s:bold)
call s:hi('Constant', s:grad[3], s:inherit, s:none)
call s:hi('Preproc', s:grad[3], s:inherit, s:none)
call s:hi('Type', s:grad[5], s:inherit, s:none)
call s:hi('Special', s:grad[3], s:inherit, s:none)
if get(g:, 'mono_italic_comment', 1)
    call s:hi('Comment', s:grad[2], [], s:italic)
else
    call s:hi('Comment', s:grad[2], [], s:none)
endif

" ---- Markdown ----
call s:hi('Title', s:grad[5], s:inherit, join([s:underline, s:bold], ','))
