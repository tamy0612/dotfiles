"==========================================================
" mono.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 27 Feb. 2018.
"==========================================================
hi clear
set background=dark
set t_Co=256
if exists('g:color_name')
    let g:color_name = 'mono'
endif

function! s:hi(group, fg, bg, attr) abort
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

function! s:hiLink(from, to) abort
    execute join(['hi', 'clear', a:from], ' ')
    execute join(['hi', 'link', a:from, a:to], ' ')
endfunction

function! s:attr(...) abort
    return join(a:000, ',')
endfunction


let s:grad = [[0, '#000000'],
            \ [233, '#121212'],
            \ [240, '#585858'],
            \ [245, '#8a8a8a'],
            \ [250, '#bcbcbc'],
            \ [253, '#dadada'],
            \ [231, '#ffffff']]
let s:emps = {'red': [9, '#ff0000'], 'green': [34, '#00af00'], 'blue': [32, '#0087d7'], 'yellow': [11, '#ffff00']}
let s:inherit = []

let s:none = ''
let s:bold = 'bold'
let s:underline = 'underline'
let s:italic = 'italic'
let s:reverse = 'reverse'

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


" ---- Editor ----
call s:hi('Normal', s:grad[4], s:grad[1], s:none)
call s:hi('CursorLine', s:inherit, s:grad[0], s:none)
call s:hi('ColorColumn', s:inherit, s:grad[2], s:none)
call s:hi('Pmenu', s:grad[1], s:grad[4], s:none)
call s:hi('PmenuSel', s:grad[1], s:grad[3], s:bold)
call s:hiLink('PmenuSbar', 'Pmenu')
call s:hi('PmenuThumb', s:inherit, s:grad[2], s:none)
call s:hiLink('WildMenu', 'IncSearch')
call s:hiLink('SpellBad', 'Error')
call s:hi('SpellCap', s:emps['blue'], s:inherit, s:bold)
call s:hiLink('SpellRare', 'WarningMsg')
call s:hi('SpellLocal', s:emps['green'], s:inherit, s:bold)

" ---- Terminal ----
call s:hi('TermCursor', s:grad[1], s:grad[3], s:none)

" ---- #line ----
call s:hi('LineNr', s:grad[2], s:inherit, s:none)
call s:hi('CursorLineNr', s:grad[3], s:grad[0], s:bold)
call s:hi('NonText', s:grad[2], s:inherit, s:none)

" ---- Special emphasis ----
call s:hi('Visual', s:grad[1], s:grad[3], s:none)
call s:hi('Search', s:inherit, s:inherit, s:reverse)
call s:hi('IncSearch', s:grad[1], s:emps['blue'], s:none)
call s:hi('Underlined', s:grad[5], s:inherit, s:attr(s:underline, s:bold))
call s:hi('Conceal', s:grad[2], s:inherit, s:none)
call s:hi('Todo', s:emps['red'], s:inherit, s:attr(s:bold, s:italic))
call s:hi('Error', s:grad[6], s:emps[s:mono_error_bg], s:bold)
call s:hi('WarningMsg', s:emps['red'], s:inherit, s:bold)
call s:hiLink('ErrorMsg', 'Error')

" ---- Invisible ----
call s:hiLink('SpecialKey', 'Comment')

" ---- Programming ----
call s:hi('Statement', s:grad[3], s:inherit, s:none)
call s:hi('Identifier', s:grad[5], s:inherit, s:bold)
call s:hi('Constant', s:grad[3], s:inherit, s:underline)
call s:hi('Preproc', s:grad[3], s:inherit, s:italic)
call s:hi('Type', s:grad[5], s:inherit, s:none)
call s:hi('Special', s:grad[3], s:inherit, s:none)
if get(g:, 'mono_italic_comment', 1)
    call s:hi('Comment', s:grad[2], [], s:italic)
else
    call s:hi('Comment', s:grad[2], [], s:none)
endif
call s:hiLink('MatchParen', 'Search')

" ---- System ----
call s:hiLink('Directory', 'Underlined')

" ---- Markdown ----
call s:hiLink('Title', 'Underlined')
