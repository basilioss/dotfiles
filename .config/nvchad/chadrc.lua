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
    overriden_modules = function(modules)
      table.insert(modules, "%l:%c")
    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
