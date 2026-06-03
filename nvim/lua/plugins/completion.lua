-- Text decolarion for color codes
local text_fn = function(ctx)
	local icon = ctx.kind_icon
	if ctx.item.source_name == "LSP" then
		local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
		if color_item and color_item.abbr ~= "" then
			icon = color_item.abbr
		end
	end
	return icon .. ctx.icon_gap
end

-- Text highlight for color codes
local highlight_fn = function(ctx)
	local highlight = "BlinkCmpKind" .. ctx.kind
	if ctx.item.cource_name == "LSP" then
		local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
		if color_item and color_item.abbr_hl_group then
			highlight = color_item.abbr_hl_group
		end
	end
	return highlight
end

-- Item transformer for copilot suggestions
local item_transformer = function(_, items)
	local comp_item_kind = require("blink.cmp.types").CompletionItemKind
	local kind_idx = #comp_item_kind + 1
	comp_item_kind[kind_idx] = "Copilot"
	for _, item in ipairs(items) do
		item.kind = kind_idx
	end
	return items
end

local M = {
	"saghen/blink.cmp",
	lazy = true,
	event = { "InsertEnter", "CmdLineEnter" },
	version = "*",
	dependencies = {
		"saghen/blink.lib",
		{ "brenoprata10/nvim-highlight-colors", opts = {} },
		{
			"giuxtaposition/blink-cmp-copilot",
			dependencies = {
				{
					"zbirenbaum/copilot.lua",
					opts = {
						suggestion = { enabled = false },
						panel = { enabled = false },
					},
				},
			},
		},
	},
	build = function()
		require("blink.cmp").build({}):pwait()
	end,
	-- @module 'blink.cmp'
	-- @type blink.cmp.Config
	opts = {
		sources = {
			default = {
				"lsp",
				"path",
				"buffer",
				"copilot",
			},
			providers = {
				copilot = {
					name = "Copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
					transform_items = item_transformer,
				},
			},
		},
		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				border = "single",
				draw = {
					components = {
						kind_icon = {
							text = text_fn,
							highlight = highlight_fn,
						},
					},
				},
			},
			documentation = {
				window = { border = "single" },
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},
		signature = { window = { border = "single" } },
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},
		appearance = {
			nerd_font_variant = "Cica",
			kind_icons = {
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",
				Field = "󰜢",
				Variable = "󰆦",
				Property = "󰖷",
				Class = "󱡠",
				Interface = "󱡠",
				Struct = "󱡠",
				Module = "󰅩",
				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰦨",
				EnumMember = "󰦨",
				Keyword = "󰻾",
				Constant = "󰏿",
				Snippet = "󱄽",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
				Copilot = "",
			},
		},
		fuzzy = { implementation = "rust" },
	},
	opts_extend = { "sources.default" },
}

return M
