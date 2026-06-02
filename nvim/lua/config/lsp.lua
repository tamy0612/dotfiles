local M = {
	configs = {
		["emmylua_ls"] = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
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
	},
	message_formatter = function(diagnostic)
		return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
	end,
}

function M:servers()
	local keys = {}
	for key, _ in pairs(self.configs) do
		table.insert(keys, key)
	end
	return keys
end

return M
