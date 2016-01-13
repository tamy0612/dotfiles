if exists( 'b:did_php_ftplugin' )
  finish
endif
let b:did_php_ftplugin = 1

setlocal dict=$VIMDIR/dict/php.dict
setlocal omnifunc=phpcomplete#CompletePHP

compiler php
