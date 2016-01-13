augroup VimClangFormatSelf
  autocmd!
  autocmd FileType c,cpp nnoremap <Leader>cf :<C-u>ClangFormat<CR>
augroup END


let g:clang_format#style_options = {
      \ 'BasedOnStyle' : 'LLVM',
      \ 'AccessModifierOffset' : 0,
      \ 'Standard' : 'C++11',
      \ 'BreakBeforeBraces' : 'Stroustrup',
      \ 'AlwaysBreakTemplateDeclarations' : 'true',
      \ 'NamespaceIndentation' : 'All',
      \ 'MaxEmptyLinesToKeep' : 2,
      \ 'AlignEscapedNewlinesLeft' : 'true',
      \ 'PointerAlignment' : 'Left',
      \ 'AllowShortIfStatementsOnASingleLine' : 'true',
      \ 'AllowShortBlocksOnASingleLine' : 'true',
      \ 'AllowShortCaseLabelsOnASingleLine' : 'true',
      \ 'KeepEmptyLinesAtTheStartOfBlocks' : 'true',
      \ 'Cpp11BracedListStyle' : 'true',
      \ 'CommentPragmas' : '/*',
      \ 'ColumnLimit' : 0,
      \ 'ConstructorInitializerAllOnOneLineOrOnePerLine' : 'true',
      \ 'ConstructorInitializerIndentWidth' : &shiftwidth,
      \ 'ContinuationIndentWidth' : &shiftwidth,
      \ }
