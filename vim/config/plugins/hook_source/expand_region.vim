let g:expand_region_text_objects = {
    \ 'iw': 1,
    \ 'iW': 0,
    \ 'i"': 1,
    \ 'i'': 0,
    \ 'i]': 1,
    \ 'ib': 1,
    \ 'iB': 1,
    \ 'il': 1,
    \ 'ip': 1,
    \ 'ie': 0
    \}

call expand_refion#custom_text_objects({
    \ 'a]': 1,
    \ 'ab': 1,
    \ 'aB': 1
    \})
