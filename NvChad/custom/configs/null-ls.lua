local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {

  -- webdev stuff
  formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  formatting.prettierd.with {
    filetypes = { "html", "markdown", "css", "typescript", "typescriptreact", "javascript", "javascriptrect" },
  },
  formatting.clang_format,
  formatting.csharpier.with {
    filetypes = { "cs" },
  },
  -- Lua
  formatting.stylua,
  -- formatting.rustfmt,
  lint.eslint.with {
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptrect" },
  },

  -- cpp
  require "typescript.extensions.null-ls.code-actions",
}

null_ls.setup {
  debug = true,
  sources = sources,
}
