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
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local global = require("config.global")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- disable netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--
vim.g.rehash256 = 1

-- ========================================================
-- Options
-- ========================================================
local opt = vim.opt

opt.clipboard:append({ "unnamedplus" })
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
opt.whichwrap = "b,s,h,l,<,>,[,],~"
opt.termguicolors = true
opt.hidden = true
opt.incsearch = true
opt.backspace = "indent,eol,start"

-- ========================================================
-- Setup plugins
-- ========================================================
require("lazy").setup({
	spec = {
		-- UI related plugins
		{ import = "plugins.ui" },
		-- tree-sitter
		{ import = "plugins.treesitter" },
		-- LSP
		{ import = "plugins.lsp" },
		-- Completion
		{ import = "plugins.completion" },
		-- Formatter
		{ import = "plugins.fmt" },
		-- Filer
		{
			"nvim-tree/nvim-tree.lua",
			opts = {
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
					icons = { show = { git = true } },
				},
				filters = {
					dotfiles = true,
				},
			},
			config = function(_, opts)
				require("nvim-tree").setup(opts)
				local map = vim.keymap.set
				map("n", "<C-f>", "<cmd>NvimTreeFocus<CR>", { desc = "Focus nvim-tree", silent = true })
				-- Open nvim-tree automatically
				vim.api.nvim_create_autocmd("VimEnter", {
					callback = function()
						require("nvim-tree.api").tree.toggle({ focus = false })
					end,
				})
				-- Close nvim-tree when it's the last buffer
				vim.api.nvim_create_autocmd("BufEnter", {
					nested = true,
					callback = function()
						local wins = vim.api.nvim_tabpage_list_wins(0)
						local non_tree = vim.tbl_filter(function(win)
							return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "NvimTree"
						end, wins)
						if #non_tree == 0 then
							vim.cmd("quit")
						end
					end,
				})
				-- Let `"q` be `qall` in nvim-tree
				vim.api.nvim_create_autocmd("QuitPre", {
					callback = function()
						if vim.bo.filetype ~= "NvimTree" then
							return
						end
						local real_bufs = vim.tbl_filter(function(buf)
							return vim.api.nvim_buf_is_valid(buf)
								and vim.bo[buf].buflisted
								and vim.api.nvim_buf_get_name(buf) ~= ""
								and vim.bo[buf].filetype ~= "NvimTree"
						end, vim.api.nvim_list_bufs())
						if #real_bufs == 0 then
							vim.schedule(function()
								vim.cmd("qall")
							end)
						end
					end,
				})
			end,
		},
		-- File explorer
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					enable = vim.fn.executable("fzf") == 1,
					build = "make",
				},
			},
			cond = vim.fn.executable("rg") == 1 and vim.fn.executable("fd") == 1,
			opts = {},
			config = function(_, opts)
				require("telescope").setup(opts)
				local builtin = require("telescope.builtin")
				local map = vim.keymap.set
				map("n", "<Leader>ff", builtin.find_files, { desc = "Telescope find files" })
				map("n", "<Leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
				map("n", "<Leader>fb", builtin.buffers, { desc = "Telescope buffers" })
				map("n", "<Leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			end,
		},
		-- Utilities
		{
			"FotiadisM/tabset.nvim",
			opts = require("config.tabs"),
		},
		{
			"windwp/nvim-autopairs",
			lazy = true,
			event = "InsertEnter",
			opts = {},
		},
		{
			"numToStr/Comment.nvim",
			lazy = true,
			event = "VimEnter",
			opts = {},
		},
		{
			"folke/flash.nvim",
			event = "VeryLazy",
			opts = {},
			keys = {
				{
					"s",
					mode = { "n", "x", "o" },
					function()
						require("flash").jump()
					end,
					desc = "Flash",
				},
				{
					"S",
					mode = { "n", "x", "o" },
					function()
						require("flash").treesitter()
					end,
					desc = "Flash Treesitter",
				},
				{
					"r",
					mode = "o",
					function()
						require("flash").remote()
					end,
					desc = "Remote Flash",
				},
				{
					"R",
					mode = { "o", "x" },
					function()
						require("flash").treesitter_search()
					end,
					desc = "Treesitter Search",
				},
				{
					"<c-s>",
					mode = { "c" },
					function()
						require("flash").toggle()
					end,
					desc = "Toggle Flash Search",
				},
			},
		},
	},
	install = { colorscheme = { "kanagawa" } },
	checker = { enabled = false },
})

-- ========================================================
-- Key mapping
-- ========================================================
local map = vim.keymap.set

map("n", "<Esc><Esc>", ":nohlsearch<CR>", { desc = "Clear search highlight", silent = true })
for _, d in ipairs({ "h", "j", "k", "l" }) do
	-- visually consistent move
	map("n", string.format("%s", d), string.format("g%s", d))
	-- move split buffers
	map("n", string.format("<C-%s>", d), string.format("<C-w>%s", d))
end

-- ========================================================
-- Completion & LSP
-- ========================================================
vim.opt.completeopt = { "menu", "menuone", "noselect", "fuzzy", "popup" }

local lsp = require("config.lsp")
vim.diagnostic.config({
	severity_sort = true,
	virtual_text = {
		severity = {
			max = vim.diagnostic.severity.WARN,
		},
		format = lsp.message_formatter,
	},
	virtual_lines = {
		severity = {
			min = vim.diagnostic.severity.ERROR,
		},
		format = lsp.message_formatter,
	},
	-- jump = {
	--   on_jump = function(_, bufnr)
	--     vim.diagnostic.open_float { bufnr = bufnr, scope = 'cursor', focus = false }
	--   end,
	-- },
})

for server, config in pairs(lsp.configs) do
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
end
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotorigger = true })
		end

		local o = { buffer = args.buf }

		map("n", "gd", vim.lsp.buf.definition, o)
		map("n", "gi", vim.lsp.buf.implementation, o)
		map("n", "gr", vim.lsp.buf.references, o)
		map("n", "K", vim.lsp.buf.hover, o)
		map("n", "<Leader>rn", vim.lsp.buf.rename, o)
		map("n", "<Leader>ca", vim.lsp.buf.code_action, o)

		map("n", "gn", vim.diagnostic.goto_next, o)
		map("n", "gp", vim.diagnostic.goto_prev, o)
	end,
})

-- ========================================================
-- Experimental
-- ========================================================
local ok, ui2 = pcall(require, "vim._core.ui2")
if ok then
	ui2.enable({
		enable = true,
	})
end
