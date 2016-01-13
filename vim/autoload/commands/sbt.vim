function! commands#sbt#start()
  execute 'VimShellInteractive --split="split |resize 15" sbt'
  stopinsert
  let t:sbt_bufname = bufname('%')
  if !has_key( t:, 'sbt_cmds' )
    let t:sbt_cmds = ['compile','run']
  endif
  wincmd p
endfunction

function! commands#sbt#run()
  let sbt_bufname = get(t:,'sbt_bufname')
  if sbt_bufname !=# ''
    call vimshell#interactive#set_send_buffer(sbt_bufname)
    call vimshell#interactive#send('run')
  else
    echoerr "try :Sbt"
  endif
endfunction
