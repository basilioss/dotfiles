---@type MappingsTable
local M = {}

require "custom.mappings-cyrillic"

M.general = {
  n = {
    ["ZS"] = { "<cmd>wqall<CR>", "Save and close all" },
    ["ZX"] = { "<cmd>qall!<CR>", "Close all" },
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<leader>s"] = { "<cmd> setlocal spell! spelllang=en_us,ru,uk<CR>", "toggle spelling" },
    ["Y"] = { "y$", "yank without newline"},
    ["<leader>w"] = { "<cmd>%s/\\s\\+$//e<CR>", "remove trailing whitespace" },
    -- ["<leader><Tab>"] = { '<cmd><Esc>/<++><Enter>"_c4l', "jump to <++>" },
    ["U"] = { "<C-r>", "undo" },
    ["<C-k>"] = { "O<Esc>", "insert empty line before" },
    ["<C-j>"] = { "o<Esc>", "insert empty line after" },
    ["<C-l>"] = { "a<space><Esc>", "insert blank space before" },
    ["<C-h>"] = { "i<space><Esc>", "insert blank space after" },
    -- ["<C-/>"] = { "set formatoptions-=c formatoptions-=r formatoptions-=o" },
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
