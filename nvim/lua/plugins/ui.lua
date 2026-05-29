return {
  -- colorscheme should be available when starting Neovim
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    opts = {
      background = {
        dark = 'dragon',
        light = 'lotus',
      },
      dimInactive = true,
      keywordStyle = { italic = false },
    },
    config = function(_, opts)
      require('kanagawa').setup(opts)
      vim.cmd.colorscheme('kanagawa')
    end,
  },
  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = { theme = 'kanagawa' },
    },
  },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  -- git
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
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
    },
  },
}
