return {

  'saghen/blink.cmp',
  version = "1.*",
  -- @module 'blink.cmp'
  -- @type blink.cmp.Config
  opts = {
    keymap = { preset = 'enter' },
    appearance = { nerd_font_variant = 'mono' },
    completion = { documentation = { auto_show = true }, },
    sources = { default = { 'lsp', 'path', 'buffer', 'snippets' }, },
    fuzzy = { implementaion = 'prefer_rust_with_warning' }
  },
  opts_extend = { 'sources.default' },
  dependencies = {},
}
