let g:lightline = {
            \ 'colorscheme': 'default',
            \ 'active': {
            \   'left': [['mode', 'paste', 'modifiable'], ['modified', 'filename'], ['gitinfo']],
            \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
            \ },
            \ 'inactive': {
            \   'left': [['modified', 'filename']],
            \   'right': [['lineinfo'], ['filetype']]
            \ },
            \ 'component_function': {
            \   'mode': 'LightlineMode',
            \   'modifiable': 'LightlineModifiable',
            \   'modified': 'LightlineModified',
            \   'filename': 'LightlineFilename',
            \   'gitinfo': 'LightlineGitinfo',
            \   'fileformat': 'LightlineFileformat',
            \   'fileencoding': 'LightlineFileencoding',
            \   'filetype': 'LightlineFiletype',
            \   'percent': 'LightlinePercent',
            \   'lineinfo': 'LightlineLineinfo'
            \ }
            \}


function! LightlineMode()
    if &ft =~ 'denite'
        return substitute(denite#get_status_mode(), '-\|\s', '', 'g')
    endif
    if &ft =~ 'nerdtree'
        return ''
    endif

    return lightline#mode()
endfunction


function! LightlineModifiable()
    return &ro ? 'x' : &modifiable ? '' : '-'
endfunction


function! LightlineModified()
    return &modified ? '+' : ''
endfunction


function! LightlineFilename()
    if &buftype == 'terminal'
        let l:process = split(expand('%:t'), ':')
        return printf("[%s] %s", l:process[0], l:process[1])
    endif
    if &ft =~ 'denite'
        return denite#get_status_sources()
    endif
    if &ft =~ 'nerdtree'
        let l:dirname = fnamemodify(getcwd(), ':~')
        return fnamemodify(l:dirname, (strlen(l:dirname) > 20 ? ':t' : ':~'))
    endif

    let l:filename = expand('%')
    if strlen(l:filename) == 0
        return (&modified ? '[Unsaved]' : '[No Name]')
    endif

    if winwidth('.') - strlen(l:filename) > 120
        return fnamemodify(l:filename, ':~:.')
    elseif winwidth('.') - strlen(l:filename) > 80
        return fnamemodify(l:filename, ':t')
    else
        return pathshorten(l:filename)
    endif
endfunction


function! LightlineGitinfo()
    if &ft =~ 'nerdtree'
        return ''
    endif

    let l:branch = fugitive#head()
    if strlen(l:branch)
        return l:branch . ': ' . LightlineGitStatus()
    endif
    return ''
endfunction


function! LightlineFileformat()
    if &ft =~ 'denite\|unite\|nerdtree'
        return ''
    endif
    return &fileformat
endfunction


function! LightlineFileencoding()
    if &ft =~ 'denite\|unite\|nerdtree'
        return ''
    endif
    return &fileencoding
endfunction


function! LightlineFiletype()
    if &buftype == 'terminal'
        return 'terminal'
    endif
    if &ft =~ 'denite\|unite\|nerdtree'
        return ''
    endif
    return &filetype
endfunction


function! LightlinePercent()
    if &ft =~ 'nerdtree'
        return ''
    endif
    let l:cline = line('.')
    let l:eline = line('$')
    return printf("%3d%%", l:eline > 0 ? l:cline * 100 / l:eline : 0)
endfunction


function! LightlineLineinfo()
    if &ft =~ 'nerdtree'
        return ''
    endif
    if &ft =~ 'denite'
        return denite#get_status_linenr()
    endif
    let l:cpos = getpos('.')
    return printf('%3d:%-2d', l:cpos[1], l:cpos[2])
endfunction


function! LightlineGitStatus()
    if &ft =~ 'help\|unite\|denite\|nerdtree' || !exists('*GitGutterGetHunkSummary')
        return ''
    endif

    let l:gitinfo = []
    let l:summary = GitGutterGetHunkSummary()
    let l:symbols = [
                \   g:gitgutter_sign_added,
                \   g:gitgutter_sign_modified,
                \   g:gitgutter_sign_removed
                \ ]
    for i in [0,1,2]
        call add(l:gitinfo, l:summary[i] . l:symbols[i])
    endfor

    return len(l:gitinfo) ? join(l:gitinfo, ' ') : ''
endfunction
