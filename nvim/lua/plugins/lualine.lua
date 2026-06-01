return 
{
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = { theme = 'kanagawa' },
    },
  },
}
