local langs = {
  'rust',
  'c',
  'cpp',
  'python',
  'lua',
}

local _check = function()
  return vim.fn.executable('tree-sitter')
end

local M = {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  cond = _check,
  build = ':TSUpdate',
}

M.opts = {}

M.config = function(_, opts)
  ts = require('nvim-treesitter')
  ts.setup(opts)
  ts.install(langs)
  -- autocmd to start tree-sitter
  vim.api.nvim_create_autocmd("FileType", {
 vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'   callback = function(args)
      local lang = vim.treesitter.language.get_lang(args.match)
      if not lang then return end

      local parser = vim.treesitter.get_parser(args.buf, lang)
      if not parser then
        return
      end
      -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      -- vim.wo[0][0].foldmethod = 'expr'
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.treesitter.start(args.buf, lang)
    end,
  })
end


return M
