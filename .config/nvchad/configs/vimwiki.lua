vim.g["vimwiki_list"] = {
  {
    path = "$ZK_NOTEBOOK_DIR/pages",
    syntax = "markdown",
    ext = ".md",
    diary_rel_path = "",
    links_space_char = "-",
  }
}

-- [ ] Todo
-- [x] Done
-- [/] Incomplete task
-- [>] Forwarded/migrated
-- [<] Scheduled
-- [e] Event
-- [I] Idea
vim.g.vimwiki_listsyms = " /<>eIx"
-- Append wiki file extension to links
vim.g.vimwiki_markdown_link_ext = 1
-- Enable folding based on expression
vim.g.vimwiki_folding = "expr"
-- The header level of the Table of Contents
vim.g.vimwiki_toc_header_level = 2
-- Use brief format of the links in the Table of Contents
vim.g.vimwiki_toc_link_format = 1
-- Disable link shortening
vim.g.vimwiki_url_maxsave = 0
-- Disable some key mappings
vim.g.vimwiki_key_mappings = { global = 0, html = 0 }
