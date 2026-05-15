-- ========================================================
-- Bootstrap lazy.nvim
-- ========================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- ========================================================
-- Options
-- ========================================================
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.clipboard:append({ 'unnamedplus' })
opt.wildmenu = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.smartcase = true
opt.ignorecase = true
opt.cursorline = true
opt.showmode = true
opt.splitright = true
opt.splitbelow = true


-- ========================================================
-- Setup plugins
-- ========================================================
require('lazy').setup({
  spec = {
    -- colorscheme should be available when starting Neovim
    {
      'oahlen/iceberg.nvim',
      lazy = false,
      config = function()
        vim.cmd.colorscheme('iceberg')
      end,
    },
    { import = 'plugins.git' },
    { import = 'plugins.lualine' },
    { 'vim-jp/vimdoc-ja' },
  },
  install = { colorscheme = { "iceberg" } },
  checker = { enabled = false },
})


-- ========================================================
-- Key mapping
-- ========================================================
local map = vim.keymap.set

-- Split buffer selection
for _, d in ipairs({'h', 'j', 'k', 'l'}) do
  map('n', string.format('<C-%s>', d), string.format('<C-w>%s', d))
end
