local autocmd = vim.api.nvim_create_autocmd

-- tabs = 2 spaces in some files
autocmd("FileType", {
  pattern = { "lua", "javascript", "sh", "zsh" },
  command = "setlocal sw=2 ts=2 sts=2",
})

-- restart sxhkd on save
autocmd("BufWritePost", {
  pattern = "*sxhkdrc",
  command = "!pkill -USR1 sxhkd"
})

-- merge xresources on save
autocmd("BufWritePost", {
  pattern = "xresources",
  command = "!xrdb -merge ~/.config/x11/xresources"
})

-- disable auto comment
autocmd("FileType", {
  command = "set formatoptions-=cro",
})

-- wrap in vimdiff
autocmd("VimEnter", {
  command = "if &diff | execute 'windo set wrap' | endif"
})
