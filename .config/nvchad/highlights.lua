-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
-- M.override = {
--   Normal = {
--     bg = "none",
--   },
-- }

local markdownHeader = {
  fg = "white",
  bold = true
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  markdownCodeDelimiter = { fg = "purple" },
  markdownUrlDelimiter = { fg = "light_grey" },
  markdownUrl = { fg = "blue" },
  markdownLinkText = { fg = "blue", underline = false },
  markdownHeadingDelimiter = { fg = "light_grey" },
  markdownListMarker = { fg = "light_grey" },
  markdownOrderedListMarker = { fg = "light_grey" },
  markdownH1 = markdownHeader,
  markdownH2 = markdownHeader,
  markdownH3 = markdownHeader,
  markdownH4 = markdownHeader,
  markdownH5 = markdownHeader,
  markdownH6 = markdownHeader,
}

return M
