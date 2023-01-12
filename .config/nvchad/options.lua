local opt = vim.opt
local g = vim.g

-- Indenting
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Fold based on indentation
opt.foldmethod = "indent"
opt.foldlevel = 99

-- Typewriter
opt.scrolloff = 999

-- Soft wrap
opt.linebreak = true

-- UI
g.toggle_theme_icon = " "
