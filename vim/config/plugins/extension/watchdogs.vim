let g:quickrun_config['python/watchdogs_checker'] = {
            \ 'type': 'watchdogs_checker/flake8'
            \}

call watchdogs#setup(g:quickrun_config)
