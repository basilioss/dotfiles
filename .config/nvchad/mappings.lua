local M = {}

require "custom.mappings-cyrillic"

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<leader>s"] = { "<cmd> setlocal spell! spelllang=en_us,ru,uk<CR>", "toggle spelling" },
    ["Y"] = { "y$", "yank without newline"},
    ["<leader>w"] = { "<cmd>%s/\\s\\+$//e<CR>", "remove trailing whitespace" },
    ["<leader><Tab>"] = { '<cmd><Esc>/<++><Enter>"_c4l', "jump to <++>" },
    ["U"] = { "<C-r>", "undo" },
    --["<Tab>"] = { "%", "go to the matching pair item" },
    ["<C-k>"] = { "O<Esc>", "insert empty line before" },
    ["<C-j>"] = { "o<Esc>", "insert empty line after" },
    ["<C-l>"] = { "a<space><Esc>", "insert blank space before" },
    ["<C-h>"] = { "i<space><Esc>", "insert blank space after" },
    ["J"] = { "}", "move faster down" },
    ["K"] = { "{", "move faster up" },
    ["L"] = { "g_", "move to the end of line" },
    ["H"] = { "^", "move to the beginning of line" },
    ["<leader>a;"] = { "mzA;<Esc>`z", "append ;" },
    ["<leader>a."] = { "mzA.<Esc>`z", "append ." },
    ["<leader>a:"] = { "mzA:<Esc>`z", "append :" },
    ["<leader>a)"] = { "mzA)<Esc>`z", "append )" },
    ["<leader>a("] = { "mzA(<Esc>`z", "append (" },
    ["<leader>a]"] = { "mzA]<Esc>`z", "append ]" },
    ["<leader>a["] = { "mzA[<Esc>`z", "append [" },
    ["<leader>a{"] = { "mzA{<Esc>`z", "append {" },
    ["<leader>a}"] = { "mzA}<Esc>`z", "append }" },
    ["<C-/>"] = { "set formatoptions-=c formatoptions-=r formatoptions-=o" },
  },
}

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "find media" },
  },
}

M.telescope = {
  n = {
    ["<leader>fs"] = { "<cmd> Telescope spell_suggest<CR>", "spelling suggestions" },
  }
}

M.clipboardimage = {
  n = {
    ["<leader>i"] = { "<cmd>PasteImg<CR>", "paste image" },
  }
}

M.undotree = {
  n = {
    ["<F5>"] = { "<cmd>UndotreeToggle<CR>", "toggle undotree" }
  }
}

M.copliot = {
  i = {
    ["<A-Tab>"] = { [[copilot#Accept("\<CR>")]], opts = { noremap=false, silent=true, expr=true } }
  }
}

M.vimwiki = {
  n = {
    ["<Nop>"] = { "<Plug>VimwikiGoto" },
    ["<leader>ln"] = { "<Plug>VimwikiNextLink", "next link" },
    ["<leader>lp"] = { "<Plug>VimwikiPrevLink", "previous link" },
    ["<leader>wj"] = { "<Plug>VimwikiMakeDiaryNote", "open journal note" },
    ["<leader>ww"] = { "<Plug>VimwikiIndex", "open index" }
  }
}

M.zk = {
  n = {
    ["<leader>wn"] = { "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", "create new note",
      opts = { noremap = true, silent = false } },
    -- Preview a linked note
    ["<A-CR>"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", opts = { noremap = true, silent = false } },
    -- Backlinks
    ["<leader>wb"] = { "<Cmd>ZkBacklinks<CR>", "backlinks", opts = { noremap = true, silent = false } },
    -- Open notes associated with the selected tags.
    ["<leader>wt"] = { "<Cmd>ZkTags<CR>", "tags", opts = { noremap = true, silent = false } },
    -- Open recently modified
    ["<leader>wm"] = { [[<Cmd>ZkNotes { modifiedAfter = "2 days ago", sort = { 'modified' } }<CR>]],
      "recently modified", opts = { noremap = true, silent = false } },
  }
}

return M
