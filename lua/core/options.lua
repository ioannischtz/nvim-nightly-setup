local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.wrap = false
opt.swapfile = false

-- Tabs: adjust if you prefer 2 spaces for JS/TS
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.splitright = true
opt.splitbelow = true
opt.termguicolors = true
opt.updatetime = 150

-- completion UX for <C-x><C-o> (omni)
opt.completeopt = { "menuone", "noinsert", "noselect" }
