-- overriding default plugin configs!

local M = {}

M.treesitter = {
  ensure_installed = {
    "html",
    "css",
    "javascript",
    "json",
    "markdown",
    "c",
    "lua",
    "c_sharp"
  },
  highlight = {
    additional_vim_regex_highlighting = { "markdown" }
  },
}

M.nvimtree = {
  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },

  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.blankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
    "norg",
    "",
  },
  max_indent_increase = 1,
  show_first_indent_level = true
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    -- shell
    "shfmt",
    "shellcheck",

    -- c#
    "netcoredbg",
    "omnisharp"
  },
}

M.statusline = {
  statusline = {
    separator_style = "block",
    overriden_modules = function ()
      local st_modules = require "nvchad_ui.statusline.modules"
      return {
        cursor_position = function()
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          local cp = st_modules.cursor_position()
          return cp .. (col + 1) .. " "
        end,
      }
    end
  }
}

return M
