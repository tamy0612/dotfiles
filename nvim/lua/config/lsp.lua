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
		["rust-analyzer"] = {
			cmd = { "rust-analyzer" },
			filetypes = { "rust" },
			root_markers = { "Cargo.toml", "Cargo.lock", ".git" },
			settings = {
				checkOnSave = {
					command = "clippy",
					extraArgs = { "--all", "--", "-W", "clippy:all" },
				},
				cargo = {
					allFeatures = true,
					loadOutDirsFromCheck = true,
					buildScripts = { enable = true },
				},
				procMacro = {
					enable = true,
					attributes = { enable = true },
				},
				inlayHints = {
					enable = true,
					chainingHints = { enable = true },
					typeHints = { enable = true, hideClosureInitialization = true },
					parameterHints = { enable = true },
					closureReturnTypeHints = { enable = "with_block" },
					lifetimeElisionHints = { enable = "skip_trivial", useParameterNames = true },
					maxLength = 25,
					bindingModeHints = { enable = true },
					closureCaptureHints = { enable = true },
					discriminantHints = { enable = "fieldless" },
					expressionAdjustmentHints = { enable = "reborrow" },
					rangeExclusiveHints = { enable = true },
				},
				completion = {
					autoimport = { enable = true },
					postfix = { enable = true },
					callable = { snippets = "fill_arguments" },
					fullFunctionSignatures = { enable = true },
					privateEditable = { enable = true },
				},
				imports = {
					granularity = { group = "module" },
					prefix = "self",
				},
				diagnostics = {
					enable = true,
					experimental = { enable = true },
					styleLints = { enable = true },
				},
				semanticHighlighting = {
					operator = { specialization = { enable = true } },
					punctuation = { enable = true, specialization = { enable = true } },
					strings = { enable = true },
				},
				hover = {
					actions = {
						enable = true,
						references = { enable = true },
						run = { enable = true },
						debug = { enable = true },
						gotoTypeDef = { enable = true },
						implementations = { enable = true },
					},
					documentation = { enable = true, keywords = { enable = true } },
					links = { enable = true },
				},
				typing = {
					autoClosingAngleBrackets = { enable = true },
				},
				lens = {
					enable = true,
					references = {
						enable = true,
						adt = { enable = true },
						enumVariant = { enable = true },
						method = { enable = true },
						trait = { enable = true },
					},
					implementations = { enable = true },
					run = { enable = true },
					debug = { enable = true },
				},
				workspace = {
					symbol = { search = { kind = "all_symbols" } },
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
