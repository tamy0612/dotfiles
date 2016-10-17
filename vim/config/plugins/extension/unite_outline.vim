let s:ftype_alias = {
    \ 'tex' : ['latex'],
    \}

for [ftype, aliases] in items( s:ftype_alias )
    call call('unite#sources#outline#alias', [aliases, ftype])
endfor
