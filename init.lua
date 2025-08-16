vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Speed up Lua module loads (builtin since 0.9+)
-- pcall(vim.loader.enable)

-- Plugins (native pack manager)
require("plugins")

-- LSP (native)
require("lsp")

-- Core
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.ui")
