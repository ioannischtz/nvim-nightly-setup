-- Minimal plugin set via Neovim's builtin pack manager

vim.pack.add({
	-- UI
	{ src = "https://github.com/vague2k/vague.nvim" },
	-- LSP
	{ src = "https://github.com/yanganto/move.vim" },
	-- Format
	{ src = "https://github.com/stevearc/conform.nvim" },
	-- Other
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
})

-- Oil setup
require("oil").setup({})

-- mini.pick
local pick = require("mini.pick")
pick.setup()

-- conform setup
pcall(function()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			rust = { "rustfmt", lsp_format = "fallback" },
			move = { "prettier-move" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters = {
			["prettier-move"] = {
				command = "prettier-move",
				args = { "--stdin-filepath", "$FILENAME" },
				range_args = function(_, ctx)
					local util = require("conform.util")
					local lo, hi = util.get_offsets_from_range(ctx.buf, ctx.range)
					return {
						"--stdin-filepath",
						"$FILENAME",
						"--range-start=" .. lo,
						"--range-end=" .. hi,
					}
				end,
			},
		},
	})
end)

-- Plugin-aware keymaps
vim.keymap.set("n", "<leader>e", function()
	require("oil").open()
end, { desc = "File explorer (oil)" })

vim.keymap.set("n", "<leader>f", function()
	pick.builtin.files()
end, { desc = "Find files(mini.pick)" })

vim.keymap.set("n", "<leader>h", function()
	pick.builtin.help()
end, { desc = "Help tags(mini.pick)" })

-- Comments
local comment_api = require("Comment.api")

vim.keymap.set("n", "<leader>/", function()
	return comment_api.call("toggle.linewise." .. (vim.v.count == 0 and "current" or "count_repeat"), "g@$")()
end, { expr = true, silent = true, desc = "Toggle comment line" })

vim.keymap.set("x", "<leader>/", function()
	local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
	vim.api.nvim_feedkeys(esc, "nx", false)
	comment_api.toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment for selection" })

-- vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise)", { desc = "Comment operator" })
-- vim.keymap.set("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment operator visual" })

-- Treesitter highlight
pcall(function()
	require("nvim-treesitter.configs").setup({
		highlight = { enable = true },
		-- Keep this tiny, you can add more langs later
		ensure_installed = { "lua", "vim", "vimdoc", "query" },
	})
end)
