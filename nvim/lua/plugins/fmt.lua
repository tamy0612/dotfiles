config = require('config.fmt')

return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = config,
    format_on_save = {
      timeout_ms = 2000,
      lsp_fallback = true,
      quiet = true,
    }
  }
}
