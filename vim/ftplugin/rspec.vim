if exists( 'b:did_rspec_ftplugin' )
  finish
endif
let b:did_rspec_ftplugin = 1

let b:quickrun_config = { 'type' : 'rspec/bundle' }
