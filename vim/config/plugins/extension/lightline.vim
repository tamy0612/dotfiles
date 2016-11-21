let g:lightline = {
            \ 'colorscheme': 'default',
            \ 'active': {
            \   'left': [['mode', 'paste'], ['readonly', 'modified', 'gitbranch', 'gitstatus', 'filename']],
            \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
            \ },
            \ 'inactive': {
            \   'left': [['readonly', 'modified', 'filename']],
            \   'right': [['lineinfo'], ['percent'], ['filetype']]
            \ },
            \ 'component_function': {
            \   'mode': 'LightlineMode',
            \   'readonly': 'LightlineReadonly',
            \   'modified': 'LightlineModified',
            \   'gitbranch': 'LightlineGitBranch',
            \   'gitstatus': 'LightlineGitStatus',
            \   'filename': 'LightlineFilename',
            \   'filetype': 'LightlineFiletype'
            \ }
            \}


function! LightlineMode()
    if &ft == "denite"
        return denite#get_status_mode()
    endif

    return lightline#mode()
endfunction


function! LightlineReadonly()
    return &ft !~? 'help\|unite\|denite\|nerdtree' && &ro ? 'x' : ''
endfunction


function! LightlineModified()
    return &ft =~ 'help\|unite\|denite\|nerdtree' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction


function! LightlineFilename()
    if &buftype == 'terminal'
        return expand('%:t')
    endif
    if &ft =~ 'help\|unite\|denite\|nerdtree'
        return ''
    endif

    let l:filename = expand('%')
    return strlen(l:filename) ? fnamemodify(l:filename, winwidth('.') > 120 ? ':~:.' : ':t') : ''
endfunction


function! LightlineFiletype()
    if &buftype == 'terminal'
        return 'terminal'
    endif
    return &filetype
endfunction


function! LightlineGitBranch()
    if &buftype =~ 'terminal\|nofile'
        return ''
    endif
    if &ft =~ 'help\|unite\|denite\|nerdtree' || !exists('*fugitive#head')
        return ''
    endif

    let l:branch = fugitive#head()
    return strlen(l:branch) ? l:branch : ''
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
    if l:summary[0] + l:summary[1] + l:summary[2] > 0
        for i in [0,1,2]
            call add(l:gitinfo, l:summary[i] . l:symbols[i])
        endfor
    endif

    return len(l:gitinfo) ? join(l:gitinfo, ' ') : ''
endfunction
