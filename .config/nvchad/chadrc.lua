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
      table.insert(modules, "%lL %cC ")
    end,
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

M.lazy_nvim =  {
  change_detection = {
    notify = false,
  },
}

return M
