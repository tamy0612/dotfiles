return
{
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      -- change = { text = '*' },
      delete = { text = '-' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signs_staged_enable = true,
    signcolumn = true,
    numhl = true,
    linehl = false,
    word_diff = false,
  },
}
