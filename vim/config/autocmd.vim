augroup MyCmdGroup

    " Hooks
    autocmd BufWritePre * call hook#write#auto_mkdir( expand('<afile>:p:h'), v:cmdbang )
    autocmd BufWritePre * call hook#write#space_clean()

    " Auto-reload for configurations
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    if exists('g:private_vimrc')
        autocmd BufWritePost $SECRETVIMRC source $SECRETVIMRC
    endif
    if IsGUI()
        autocmd BufWritePost $MYGVIMRC source $MYGVIMRC
    endif

    " autocmd for specific filetypes
    autocmd FileType help nnoremap <silent> q :<C-u>q<CR>
    autocmd FileType gitcommit execute "normal! gg"

    " omnifunc
    " autocmd FileType ada setlocal omnifunc=adacomplete#Complete
    " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    " autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete
    " autocmd FileType c setlocal omnifunc=ccomplete#Complete
    " autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    " autocmd FileType java setlocal omnifunc=javacomplete#Complete
    " autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    " if has('python3')
    "     autocmd FileType python setlocal omnifunc=python3complete#Complete
    " else
    "     autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    " endif

augroup END
