"==========================================================
" vim/autoload/plugins/utility.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 17 Dec. 2018.
"==========================================================
function! plugins#utility#register_template() abort
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
endfunction

function! plugins#utility#register_precious() abort
  augroup Precious
    autocmd!
    autocmd FileType toml :PreciousSwitch
  augroup END
endfunction

function! plugins#utility#is_fzf_available() abort
  return exists('$FZF_HOME')
endfunction

function! plugins#utility#fzf_mapping() abort
  nmap <silent> <Leader>b :Buffers<CR>
  nmap <silent> <Leader>f :Files<CR>
  nmap <silent> <Leader>F :GFiles?<CR>
  nmap <Leader>g :Ag<Space>
  nmap / :BLines<CR>
  nmap q: :History:<CR>
endfunction
" vim:ft=vim:ts=2:sw=2:fdm=marker
