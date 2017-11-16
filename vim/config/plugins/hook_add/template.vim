augroup MyTemplates
    autocmd!
    autocmd BufNewFile *.h,*.hpp execute 'TemplateLoad /init.h'
    autocmd BufNewFile *.d       execute 'TemplateLoad /init.d'
    autocmd BufNewFile *.java    execute 'TemplateLoad /init.java'
    autocmd BufNewFile build.sbt execute 'TemplateLoad /init.sbt.scala'
    autocmd BufNewFile *.vim     execute 'TemplateLoad /init.vim'
    autocmd BufNewFile *.tikz    execute 'TemplateLoad /init.tikz'
augroup END
