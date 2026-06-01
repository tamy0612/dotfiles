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
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local global = require('config.global')

-- ========================================================
-- Options
-- ========================================================
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

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- ========================================================
-- Setup plugins
-- ========================================================
require('lazy').setup({
  spec = {
    -- UI related plugins
    { import = 'plugins.ui' },
    -- tree-sitter
    { import = 'plugins.treesitter' },
    -- LSP
    { import = 'plugins.lsp' },
    -- Completion
    { import = 'plugins.completion' },
    -- Formatter
    { import = 'plugins.fmt' },
    -- Utilities
    {
      'windwp/nvim-autopairs',
      lazy = true,
      event = "InsertEnter",
      opts = {},
    },
    {
      'numToStr/Comment.nvim',
      lazy = true,
      event = 'VimEnter',
      opts = {},
    },
    {
      'folke/flash.nvim',
      event = "VeryLazy",
      opts = {},
      keys = {
        { 's', mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
        { 'S', mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        -- { "R", modem= { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    },
    { 'vim-jp/vimdoc-ja' },
  },
  install = { colorscheme = { 'kanagawa' } },
  checker = { enabled = false },
})


-- ========================================================
-- Key mapping
-- ========================================================
local map = vim.keymap.set

for _, d in ipairs({ 'h', 'j', 'k', 'l' }) do
  -- visually consistent move
  map('n', string.format('%s', d), string.format('g%s', d))
  -- move split buffers
  map('n', string.format('<C-%s>', d), string.format('<C-w>%s', d))
end


-- ========================================================
-- Completion & LSP
-- ========================================================
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'fuzzy', 'popup' }
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = {
    severity = {
      max = vim.diagnostic.severity.WARN,
    },
  },
  virtual_lines = {
    severity = {
      min = vim.diagnostic.severity.ERROR,
    },
  },
  -- jump = {
  --   on_jump = function(_, bufnr)
  --     vim.diagnostic.open_float { bufnr = bufnr, scope = 'cursor', focus = false }
  --   end,
  -- },
})

local lsp = require('config.lsp')
for server, config in pairs(lsp.configs) do
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotorigger = true })
    end

    local o = { buffer = args.buf }

    map('n', 'gd', vim.lsp.buf.definition, o)
    map('n', 'gi', vim.lsp.buf.implementation, o)
    map('n', 'gr', vim.lsp.buf.references, o)
    map('n', 'K', vim.lsp.buf.hover, o)
    map('n', '<Leader>rn', vim.lsp.buf.rename, o)
    map('n', '<Leader>ca', vim.lsp.buf.code_action, o)

    map('n', 'gn', vim.diagnostic.goto_next, o)
    map('n', 'gp', vim.diagnostic.goto_prev, o)
  end,
})


-- ========================================================
-- Experimental
-- ========================================================
local ok, ui2 = pcall(require, 'vim._core.ui2')
if ok then
  ui2.enable({
    enable = true,
  })
end
