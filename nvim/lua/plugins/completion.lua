return {
  'saghen/blink.cmp',
  lazy = true,
  event = { 'InsertEnter', 'CmdLineEnter' },
  dependencies = {
    'saghen/blink.lib',
  },
  build = function()
    require('blink.cmp').build():pwait()
  end,
  -- @module 'blink.cmp'
  -- @type blink.cmp.Config
  opts = {
    sources = { default = { 'lsp', 'path', 'buffer' }, },
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = { border = 'single' },
      documentation = {
        window = { border = 'single' },
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
    signature = { window = { border = 'single' } },
    keymap = {
      preset = 'enter',
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
    },
    appearance = { nerd_font_variant = 'mono' },
    fuzzy = { implementation = 'rust' },
  },
  opts_extend = { 'sources.default' },
}
