require("mason").setup()
local util = require("lspconfig.util")
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "csharp_ls", "omnisharp" }
})

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, {})
    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', '<leader>l', vim.lsp.buf.format)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- local pid = vim.fn.getpid()
require("lspconfig").omnisharp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    enable_roslyn_analyzers = true,
    enable_import_completion = true,
    analyze_open_documents_only = false,
    root_dir = function(path)
        return util.root_pattern("*.csproj")(path) or util.root_pattern("*.sln")(path)
    end
}


require("lspconfig").tsserver.setup {
    on_attach = on_attach,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "json" },
    capabilities = capabilities,
}


-- require("lspconfig").csharp_ls.setup {
--    on_attach = on_attach,
--    capabilities = capabilities
-- }

-- if vim.g.config_omnisharp_bin then
--   local pid = vim.fn.getpid()
--   nvim_lsp.omnisharp.setup(extended_setup({
--     cmd = { vim.g.config_omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
--     root_dir = function(path)
--       -- Make sure an sln doesn't already exist before trying to use the nearest csproj file
--       return root_pattern('*.sln')(path) or root_pattern('*.csproj')(path)
--     end,
--     handlers = {
--       ['textDocument/definition'] = require('omnisharp_extended').handler
--     }
--   }))
-- end
