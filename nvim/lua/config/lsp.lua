local M = {
  configs = {
    ['emmylua_ls'] = {
      cmd          = { 'lua-language-server' },
      filetypes    = { 'lua' },
      root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
      settings     = {
        Lua = {
          runtime   = { version = 'LuaJIT' },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        }
      },
    },
    -- ['lua-language-server'] = {
    --   cmd          = { 'lua-language-server' },
    --   filetypes    = { 'lua' },
    --   root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    --   settings     = {
    --     Lua = {
    --       runtime   = { version = 'LuaJIT' },
    --       workspace = { checkThirdParty = false },
    --       telemetry = { enable = false },
    --     }
    --   },
    -- },
  }
}

function M:servers()
  local keys = {}
  for key, _ in pairs(self.configs) do
    table.insert(keys, key)
  end
  return keys
end

return M
