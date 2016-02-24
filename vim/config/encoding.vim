if has('vim_starting')
  set enc=utf-8
endif
set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,cp20932
let &fenc = &encoding
set termencoding=&encoding


set fileformat=unix
set fileformats=unix,mac,dos

set formatoptions&
set formatoptions+=mM
set formatexpr=autofmt#japanese#formatexpr()

if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif


" Re-open in utf-8
command! -bang -bar -complete=file -nargs=? Utf8
      \ edit<bang> ++enc=utf-8 <args>
" Re-open in ISO-2022jp
command! -bang -bar -complete=file -nargs=? Iso2022jp
      \ edit<bang> ++enc=iso-2022-jp <args>
" Re-open in euc
command! -bang -bar -complete=file -nargs=? Euc
      \ edit<bang> ++enc=euc-jp <args>
" Re-open in SJIS
command! -bang -bar -complete=file -nargs=? SJIS
      \ edit<bang> ++enc=cp932 <args>
