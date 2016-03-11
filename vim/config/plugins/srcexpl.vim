let s:cwd = getcwd()
if isdirectory(s:cwd . "/src")
  let s:src_dir = s:cwd . "/src"
elseif isdirectory(s:cwd . "/source")
  let s:src_dir = s:cwd . "/source"
else
  let s:src_dir = s:cwd
endif

let g:SrcExpl_winHeight     = 20
let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase -R ' . s:src_dir

if has('cscope')
  set csprg=cscope
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
