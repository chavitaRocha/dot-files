---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.relativenumber = true

vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

M.ui = {
  theme = "chadtain",
  theme_toggle = { "chadtain", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    theme = "vscode",
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
