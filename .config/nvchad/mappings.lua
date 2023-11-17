---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["ZS"] = { "<cmd>wqall<CR>", "Save and close all" },
    ["Y"] = { "y$", "yank without newline"},
    ["U"] = { "<C-r>", "undo" },
    ["<leader>s"] = { "<cmd> setlocal spell! spelllang=en_us<CR>", "toggle spelling" },
    ["<leader>w"] = { "<cmd>%s/\\s\\+$//e<CR>", "remove trailing whitespace" },
    ["<C-k>"] = { "O<Esc>", "insert empty line before" },
    ["<C-j>"] = { "o<Esc>", "insert empty line after" },
    ["<C-l>"] = { "a<space><Esc>", "insert blank space before" },
    ["<C-h>"] = { "i<space><Esc>", "insert blank space after" },
  },

  i = {
    ["<C-A>"] = { "<Esc>ggVG", "select all" },
  }
}

M.telescope = {
  n = {
    ["<leader>fs"] = { "<cmd> Telescope spell_suggest<CR>", "spelling suggestions" },
  }
}

M.copliot = {
  i = {
    ["<A-Tab>"] = { [[copilot#Accept("\<CR>")]], opts = { noremap=false, silent=true, expr=true } }
  }
}

M.zenmode = {
  n = {
    ["<leader>z"] = { "<cmd>ZenMode<CR>", "toggle zen mode" }
  }
}

local opts = { noremap = true, silent = false }

-- Notes
M.zk = {
  n = {
    ["<leader>wb"] = { "<Cmd>ZkBacklinks<CR>", "backlinks", opts },
    ["<leader>wn"] = { "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", "backlinks", opts },
    ["<A-CR>"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "preview link", opts },

    ["<CR>"] = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "open link", opts },
    ["<BS>"] = { ":edit #<CR>", opts = { silent = true } },
    ["<C-p>"] = { "<Plug>MarkdownPreviewToggle" },
    ["<leader>i"] = { "<cmd>PasteImg<CR>", "paste image" },
  },

  v = {
    ["<CR>"] = { ":'<,'>ZkInsertLinkAtSelection<CR>", "insert link", opts },
  }
}

return M
