function! plugins#denite#mapping() abort
  " Shortcut
  nnoremap <silent> / :<C-u>Denite line<CR>

  " Denite mapping
  nnoremap [denite] <Nop>
  nmap <Leader>d [denite]

  nmap <silent> [denite]b :<C-u>Denite buffer<CR>
  nmap <silent> [denite]j :<C-u>Denite -no-auto-preview -vertical-preview jump<CR>
  nmap <silent> [denite]g :<C-u>Denite -no-auto-preview -vertical-preview grep<CR>
  nmap <silent> [denite]o :<C-u>Denite -no-auto-preview -vertical-preview outline tag<CR>
  nmap <silent> [denite]l :<C-u>Denite -no-auto-preview -vertical-preview location_list quickfix<CR>
  nmap <silent> [denite]f :<C-u>Denite `finddir('.git', ';') != '' ? 'file_rec/git' : ''` file_rec file_mru file_old<CR>
  nmap <silent> [denite]d :<C-u>Denite directory_rec<CR>
  nmap <silent> [denite]c :<C-u>Denite command_history command<CR>
  nmap <silent> [denite]y :<C-u>Denite register neoyank<CR>
  xmap <silent> [denite]y :<C-u>Denite -default-action=replace register neoyunk<CR>
  nmap <silent> [denite]m :<C-u>Denite menu<CR>
  nmap <silent> [denite]h :<C-u>Denite help<CR>

  nmap <silent> [denite]. :<C-u>Denite -resume<CR>
  nmap <silent> [denite]n :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
  nmap <silent> [denite]p :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>
endfunction


function! plugins#denite#option() abort
  " Options
  call denite#custom#option('_', {
            \   'statusline': v:false,
            \   'cursor_wrap': v:true,
            \   'split': 'horizontal',
            \   'direction': 'botright',
            \   'prompt': '>',
            \   'prompt_highlight': 'Comment',
            \   'auto_resume': v:true
            \})

  " Commands
  let s:is_available = {'ag': executable('ag')}
  "" Filer
  if s:is_available.ag  " Use TheSilverSercher if available
    call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
  endif
  call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])

  "" Grep
  if s:is_available.ag  " Use TheSilverSercher if available
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--skip-vcs-ignores'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  endif
  call denite#custom#source('grep', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
            \['.git/', '.svn/', '.hg/', '__pycache__/', 'fonts/', 'CMakeCache/',
            \ '.gitmodules', '*~', '*.pyc', '*.sw[po]', '*.bak',
            \ '*.o', '*.so', '*.dylib', '*.exe', '*.out', '*.class', '*.elf',
            \ '.DS_Store', '*.min.*', '*.zip', '*.tar', '*.gz',
            \ '*.png', '*.jpg', '*.jpeg', '*.pdf', '*.aux', '*.dvi'])

  "" Filer
  call denite#custom#alias('source', 'file_rec/git', 'file_rec')
  call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])
  call denite#custom#source('file_rec/git', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])


  " Mapping
  "" Move
  call denite#custom#map('insert', '<Tab>', '<denite:move_to_next_line>')
  call denite#custom#map('insert', '<S-Tab>', '<denite:move_to_previous_line>')
  call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>')
  call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>')
  call denite#custom#map('insert', '<C-f>', '<denite:move_caret_to_next_word>')
  call denite#custom#map('insert', '<C-^>', '<denite:move_caret_to_head>')

  "" Action
  call denite#custom#map('insert', '<C-a>', '<denite:choose_action>')
  call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>')
  call denite#custom#map('insert', '<C-s>', '<denite:do_action:split>')
  call denite#custom#map('insert', '<C-d>', '<denite:do_action:delete>')
  call denite#custom#map('insert', '<C-p>', '<denite:do_action:preview>')

  "" History
  call denite#custom#map('insert', '<C-S-h>', '<denite:assign_next_text>')
  call denite#custom#map('insert', '<C-h>', '<denite:assign_previous_text>')


  " Menu
  let s:menu = {}

  let s:menu.vimrc = {
            \ 'description': 'Edit vimrc',
            \ 'file_candidates': [
            \   ['.vimrc.local', getcwd().'/.vimrc.local']
            \ ]
            \}
  let s:menu.vimrc.file_candidates += map(split(glob($VIMDIR.'/config/**/*')), "[fnamemodify(v:val, ':~'), v:val]")

  let s:menu.plugins = {
            \ 'description': 'List plugins'
            \}
  let s:menu.plugins.file_candidates = map(split(glob($VIM_CACHE_DIR.'/plugins/**/*')), "[fnamemodify(v:val, ';~'), v:val]")

  call denite#custom#var('menu', 'menus', s:menu)
endfunction
