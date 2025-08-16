-- Diagnostics
vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 2, prefix = "*" },
	severity_sort = true,
	float = { border = vim.o.winborder },
})

-- Common capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Helper to load per-server config modules that return a table
local function server_config(name)
	local ok, cfg = pcall(require, "lsp.servers." .. name)
	if not ok then
		return { capabilities = capabilities }
	end
	cfg.capabilities = vim.tbl_deep_extend("force", capabilities, cfg.capabilities or {})
	return cfg
end

-- List only the servers you want running by default
local servers = {
	"lua_ls",
	"ts_lsp",
	"rust_analyzer",
	"move_analyzer",
}

-- Register configs with the native API, then enable all at once
for _, name in ipairs(servers) do
	vim.lsp.config(name, server_config(name))
end

vim.lsp.enable(servers)
