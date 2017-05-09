if executable('cppman')
    autocmd MyCmdGroup FileType cpp set keywordprg=cppman
endif

let g:clang_format#command = 'clang-format'
let g:clang_format#code_style = 'LLVM'
let g:clang_format#style_options = {
    \ 'TabWidth': 4,
    \ 'AccessModifierOffset': 0,
    \ 'AlignConsecutiveAssignments': 'true',
    \ 'AlignEscapedNewlinesLeft': 'true',
    \ 'AllowAllParametersOfDeclarationOnNextLine': 'false',
    \ 'AllowShortFunctionsOnASingleLine': 'true',
    \ 'BraceWrapping': {'AfterFunction': 'true'},
    \ 'BreakBeforeBraces': 'Stroustrup',
    \ 'BreakConstructorInitializersBeforeComma': 'true',
    \ 'SpacesBeforeTrailingComments': 2,
    \ 'CommentPragmas': '\*'
    \}
let g:clang_format#filetype_style_options = {
    \ 'cpp': {'Standard': 'C++1z'},
    \}
