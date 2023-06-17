local opt = vim.opt

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
-- opt.linebreak = true

-- Left-align wrapped/indented lines 
-- Set same amount of space as the beginning of the line
opt.breakindent = true
