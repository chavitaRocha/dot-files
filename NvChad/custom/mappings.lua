---@type MappingsTable
local M = {}

local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function GetProjectIndex(path)
  if path == nil then
    return -1
  end
  if path == "" then
    return -1
  end

  local files = io.popen("ls " .. path .. "/*.csproj")
  if files == nil then
    return GetProjectIndex(string.gsub(path, "/([^/]+)$", ""))
  end

  for file in files:lines() do
    if file_exists(file) then
      return string.len(string.gsub(path, "/([^/]+)$", ""))
    end
  end

  if files:read "n" == nil then
    return GetProjectIndex(string.gsub(path, "/([^/]+)$", ""))
  end

  return string.len(string.gsub(path, "/([^/]+)$", ""))
end

function GetNamespace()
  local buffer = vim.api.nvim_get_current_buf()
  local file_path = vim.api.nvim_buf_get_name(buffer)
  local name = string.match(file_path, "([^/]+)$")
  file_path = string.gsub(file_path, "/" .. name, "")

  local result = GetProjectIndex(file_path)
  if result == -1 then
    return
  end

  local namespace = "namespace " .. string.sub(file_path, result + 2) .. ";"
  namespace = string.gsub(namespace, "/", ".")
  vim.api.nvim_buf_set_text(buffer, 0, 0, 0, 0, { namespace })
  -- local pos = vim.api.nvim_win_get_cursor(0)[2]
  -- local line = vim.api.nvim_get_current_line()
  -- local nline = line:sub(0, pos) .. namespace .. line:sub(pos + 1)
  -- vim.api.nvim_set_current_line(nline)
end

M.general = {
  n = {
    -- ["q"] = { "", "", opts = { nowait = true } },
    ["<leader>n"] = { ":lua GetNamespace()<cr>", "Get namespace" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["n"] = { "nzz", "enter command mode", opts = { nowait = true } },
    ["0"] = { "0w", "", opts = { nowait = true } },
    ["<s-h>"] = { ":bprev<cr>", "prev buffer", opts = { nowait = true } },
    ["<s-l>"] = { ":bnext<cr>", "next buffer", opts = { nowait = true } },
    ["<leader>b"] = { "<cmd> enew <CR>", "Buffers" },
    ["<leader>bn"] = { "<cmd> enew <CR>", "New buffer" },
    ["<leader>rn"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "Rename",
    },
    ["<leader>cf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "Format Code",
    },
    ["<leader>d"] = { '"_d', "Delete without copy on clipboard" },
    ["<leader>p"] = { '"_dP', "Paste without copy on clipboard" },
    ["gcc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
    -- ["<leader>bd"] = { ":bd<cr>", "close buffer", opts = { nowait = true } },
    -- ["<leader>bp"] = { ":BufferLineTogglePin", "toggle pin", opts = { nowait = true } },
  },
  v = {
    ["<leader>d"] = { '"_d', "Delete without copy on clipboard" },
    ["<leader>p"] = { '"_dP', "Paste without copy on clipboard" },
    ["gcc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

return M
