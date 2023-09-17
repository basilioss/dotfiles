local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt.with { extra_args = { "-i", "2", "-ci", "-sr" } },
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- Go
  b.formatting.gofumpt,
  b.formatting.goimports,
  b.formatting.golines,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
