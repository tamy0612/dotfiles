local servers = require('config.lsp'):servers()

local _config = function(_, opts)
  require('mason').setup()

  local registry = require('mason-registry')
  registry.refresh(function()
    for _, pkg_name in ipairs(servers) do
      local exist, pkg = pcall(registry.get_package, pkg_name)
      if not exist then
        vim.notify('[Mason] LSP server not found: ' .. pkg_name, vim.log.levels.ERROR)
      elseif not pkg:is_installed() then
        vim.notify('[Mason] Installing ' .. pkg_name, vim.log.levels.INFO)
        pkg:install()
      end
    end
  end)

end

return {
  'mason-org/mason.nvim',
  opts = {},
  config = _config,
}
