local langs = {
  'rust',
  'c',
  'cpp',
  'python',
  'lua',
}

local _config = function(_, opts)
  local ts = require('nvim-treesitter')
  ts.setup(opts)
  ts.install(langs)
  --
  -- vim.treesitter.start = (function(wrapped)
  --   return function(bufnr, lang)
  --     lang = lang or vim.fn.getbufvar(bufnr or '', '&filetype')
  --     pcall(wrapped, bufnr, lang)
  --   end
  -- end)(vim.treesitter.start)

  -- autocmd to start tree-sitter
  vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
      local lang = vim.treesitter.language.get_lang(args.match)
      if not lang then return end

      local parser = vim.treesitter.get_parser(args.buf, lang)
      if not parser then return end

      -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      -- vim.wo[0][0].foldmethod = 'expr'
      -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.treesitter.start(args.buf, lang)
    end,
  })
end


return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  opts = {},
  build = ':TSUpdate',
  cond = function()
    return vim.fn.executable('tree-sitter') == 1
  end,
  config = _config,
}
