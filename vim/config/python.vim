let s:python3_dir_candidates = [
            \ $PYENV_ROOT . "/versions/neovim3/bin",
            \ $PYENV_ROOT . "/shims"
            \]
let g:python3_host_prog = util#find#executable("python3", s:python3_dir_candidates)

let s:python2_dir_candidates = [
            \ $PYENV_ROOT . "/versions/neovim2/bin",
            \ $PYENV_ROOT . "/shims",
            \]
let g:python_host_prog = util#find#executable("python", s:python2_dir_candidates)
