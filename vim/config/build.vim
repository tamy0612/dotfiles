if executable('ninja') && filereadable(expand('./build.ninja'))
    set makeprg=ninja
endif
