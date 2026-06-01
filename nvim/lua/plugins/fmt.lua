config = require("config.fmt")

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
