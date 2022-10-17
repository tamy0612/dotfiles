"==========================================================
" vim/rc/pum.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" License: MIT License
"==========================================================

call pum#set_option('padding', v:true)
call pum#set_option('reverse', v:true)

inoremap <silent><expr> <Tab>
      \ pum#visible()
      \   ? '<Cmd>call pum#map#insert_relative(+1)<CR>'
      \   : (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s'
      \     ? '<Tab>'
      \     : ddc#manual_complete())

inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

" vim:ft=vim:ts=2:sw=2:fdm=marker
