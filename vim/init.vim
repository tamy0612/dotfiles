if exists('$XDG_CONFIG_DIR')
  let $VIMDIR = $XDG_CONFIG_DIR . '/nvim'
else
  let $VIMDIR = fnamemodify(expand('<sfile>'), ':h:p')
endif
execute 'source' $VIMDIR . '/config/vimrc'

" vim:ft=vim:ts=2:sw=2
