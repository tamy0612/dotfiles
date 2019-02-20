"==========================================================
" vim/rc/template.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 28 Feb. 2019.
"==========================================================
augroup MyTemplates
  autocmd!
  autocmd BufNewFile *.h            execute 'TemplateLoad /init.h'
  autocmd BufNewFile *.hpp          execute 'TemplateLoad /init.hpp'
  autocmd BufNewFile *.d            execute 'TemplateLoad /init.d'
  autocmd BufNewFile *.java         execute 'TemplateLoad /init.java'
  autocmd BufNewFile build.sbt      execute 'TemplateLoad /init.sbt.scala'
  autocmd BufNewFile *.scala        execute 'TemplateLoad /init.scala'
  autocmd BufNewFile *.vim          execute 'TemplateLoad /init.vim'
  autocmd BufNewFile *.tikz         execute 'TemplateLoad /init.tikz'
  autocmd BufNewFile CMakeLists.txt execute 'TemplateLoad /init.cmake'
  autocmd BufNewFile *.toml         execute 'TemplateLoad /init.toml'
  autocmd BufNewFile *.py           execute 'TemplateLoad /init.py'
augroup END
" vim:ft=vim:ts=2:sw=2:fdm=marker
