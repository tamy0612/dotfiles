if exists("b:did_ftplugin")
  finish
endif

command! -nargs=0 Sbt call commands#sbt#start()
nnoremap <buffer> <Space>m :<C-u>write<CR>:call commands#sbt#run()<CR>
