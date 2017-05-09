let g:vimshell_split_command = ''
let g:vimshell_enable_transient_user_prompt = 1
let g:vimshell_force_overwrite_statusline = 1

call vimshell#set_execute_file('txt,vim,log', 'vim')

let g:vimshell_execute_file_list = {}
let g:vimshell_execute_file_list['rb'] = 'ruby'
let g:vimshell_execute_file_list['pl'] = 'perl'
let g:vimshell_execute_file_list['py'] = 'python'
let g:vimshell_execute_file_list['js'] = 'node'
let g:vimshell_execute_file_list['php'] = 'php'
let g:vimshell_execute_file_list['d'] = 'rdmd'
