local aug = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- Highlight on yank
au("TextYankPost", {
	group = aug("YankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Show hover docs automatically on CursorHold
au("CursorHold", {
	group = aug("CursorHoldHover", { clear = true }),
	callback = function()
		local hover_config = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = " ",
			scope = "cursor",
		}
		vim.lsp.buf.hover(hover_config)
	end,
})

-- When an LSP attaches: set omnifunc and buffer-local LSP maps
au("LspAttach", {
	group = aug("LspAttachMinimal", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

		local map = function(mode, lhs, rhs, dsc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
		end

		map("n", "K", vim.lsp.buf.hover, "Hover")
		map("n", "gd", vim.lsp.buf.definition, "Go to definition")
		map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
		map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
		map("n", "gr", vim.lsp.buf.references, "References")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
		map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
		map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
		-- map("n", "<leader>lf",  function(args) require("conform").format({ bufnr = args.buf, lsp_fallback = true }) end, "Format buffer")

		-- autocomplete
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
