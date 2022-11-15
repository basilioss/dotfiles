-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "nightfox",
  hl_override = require("custom.highlights").overriden_hlgroups,
}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

return M
