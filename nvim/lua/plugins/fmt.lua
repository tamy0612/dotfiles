local config = {
	rust = { "rust-fmt", lsp_format = "fallback" },
	lua = { "stylua", lsp_format = "fallback" },
	python = { "isort", "black", lsp_format = "fallback" },
}

return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = config,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
			quiet = true,
		},
	},
}
