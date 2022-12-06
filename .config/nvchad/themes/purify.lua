local M = {}

M.base_30 = {
  white = "#FAFAFA",
  darker_black = "#121C29",
  black = "#151F29", --  nvim bg
  black2 = "#202A37",
  one_bg = "#24283b",
  one_bg2 = "#313B48",
  one_bg3 = "#353b45",
  grey = "#40486a",
  grey_fg = "#565f89",
  grey_fg2 = "#4f5779",
  light_grey = "#545c7e",
  red = "#FF6059", -- base16
  baby_pink = "#FF99D3",
  pink = "#FF79C6", -- base16
  line = "#2A3441", -- for lines like vertsplit
  green = "#5FFF87", -- base16
  vibrant_green = "#6ad4d6",
  blue = "#5FAFFF", -- base16
  nord_blue = "#85C2FF",
  yellow = "#FFFF87", -- base16
  sun = "#FFFFAD",
  purple = "#AF87FF", -- base16
  dark_purple = "#A070FF",
  teal = "#5cc6c8",
  orange = "#FF875F", -- base16
  cyan = "#89DDFF", -- base16
  statusline_bg = "#202A37",
  lightbg = "#313B48",
  pmenu_bg = "#5FAFFF",
  folder_bg = "#5FAFFF",
}

M.base_16 = {
  base00 = "#151F29",
  base01 = "#3b4261",
  base02 = "#313b48",
  base03 = "#545c7e",
  base04 = "#565c64",
  base05 = "#EBEBEB",
  base06 = "#F5F5F5",
  base07 = "#FAFAFA",
  base08 = "#FF79C6",
  base09 = "#FF875F",
  base0A = "#FFFF87",
  base0B = "#5FFF87",
  base0C = "#89DDFF",
  base0D = "#5FAFFF",
  base0E = "#AF87FF",
  base0F = "#FF6059",
}

vim.opt.bg = "dark"

return M
