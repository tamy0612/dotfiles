let g:SrcExpl_updateTagsCmd = '/usr/local/bin/ctags --sort=foldcase -R .'
if has('cscope')
  set csprg=/usr/local/bin/cscope
  set csto=0
  set cst
  set nocsverb
  if filereadable("cscope.out")
    cs add cscope.out
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
  set cscopequickfix=s-,c-,d-,i-,t-,e-
endif
