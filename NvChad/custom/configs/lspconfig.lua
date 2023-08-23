local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "tsserver", "clangd", "csharp_ls", "tailwindcss", "omnisharp" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}

lspconfig.omnisharp.setup {
  filetypes = { "cs" },
  cmd = { "/Users/vita/.local/share/NvChad/mason/bin/omnisharp", "--languageserver", tostring(vim.fn.getpid()) },
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
  on_attach = on_attach,
  capabilities = capabilities,
}
