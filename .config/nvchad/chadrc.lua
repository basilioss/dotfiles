---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "github_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  -- Add column number
  statusline = {
    separator_style = "round",
    overriden_modules = function ()
      local st_modules = require "nvchad_ui.statusline.default"
      return {
        cursor_position = function()
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          local cp = st_modules.cursor_position()
          return cp .. (col + 1) .. " "
        end,
      }
    end
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
