local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").find_files()
    end
  end,
})

-- autocmd for c# files with tabstop 4
autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
  end,
})
