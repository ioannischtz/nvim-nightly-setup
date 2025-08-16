-- Rounded borders for floating UIs (hover, signature help)
-- Requires NeoVim with the 'winborder' option
vim.o.winborder = "rounded" -- alt: "single", "double", "solid", "shadow", "none"

-- Colorscheme
local ok = pcall(vim.cmd.colorscheme, "vague")
if not ok then pcall(vim.cmd.colorscheme, "habamax") end
